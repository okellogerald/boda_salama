import 'dart:async';

import 'package:lottie/lottie.dart' show Lottie;
import '../source.dart';

class CustomLocationPage extends StatefulWidget {
  const CustomLocationPage({this.location, Key? key}) : super(key: key);

  final Location? location;

  static void navigateTo(BuildContext context, {Location? location}) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => CustomLocationPage(location: location)));

  @override
  _CustomLocationPageState createState() => _CustomLocationPageState();
}

class _CustomLocationPageState extends State<CustomLocationPage>
    with WidgetsBindingObserver {
  late final CustomLocationPageBloc bloc;
  late final PlacesService service;
  late final LocationService locationService;

  final mapController = Completer<GoogleMapController>();

  @override
  void initState() {
    service = Provider.of<PlacesService>(context, listen: false);
    locationService = Provider.of<LocationService>(context, listen: false);
    bloc = CustomLocationPageBloc(service, locationService);
    bloc.init(mapController, currentLocation: widget.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<CustomLocationPageBloc, CustomLocationPageState>(
            listener: (context, state) {
              final isDone =
                  state.maybeWhen(success: (_) => true, orElse: () => false);
              final editor = state.editor;
              if (isDone) {
                HomePage.navigateTo(context,
                    Location(point: editor.location, address: editor.address));
              }
            },
            bloc: bloc,
            builder: (_, state) {
              return state.when(
                loading: (editor) => _buildContent(editor, isLoading: true),
                content: _buildContent,
                success: _buildContent,
              );
            }));
  }

  Widget _buildContent(MapEditor editor, {bool isLoading = false}) {
    return Stack(
      children: [
        _buildMap(editor),
        _buildFloatingAppBar(editor),
        _buildConfirmLocationButton(editor.isDragging),
        _buildLoading(isLoading),
      ],
    );
  }

  Widget _buildLoading(bool isLoading) {
    return isLoading
        ? Container(
            width: ScreenSizeConfig.getFullWidth,
            height: ScreenSizeConfig.getFullHeight,
            color: Colors.black26,
            alignment: Alignment.center,
            child: Container(
              height: 100.dw,
              width: 150.dw,
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ))
        : Container();
  }

  _buildMap(MapEditor editor) {
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: editor.location, zoom: 16.25),
      onMapCreated: (controller) => mapController.complete(controller),
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      mapToolbarEnabled: false,
      onCameraIdle: bloc.onDragEnd,
      onCameraMove: (c) => bloc.onDrag(c.target),
      markers: <Marker>{editor.marker},
    );
  }

  _buildFloatingAppBar(MapEditor editor) {
    return editor.isDragging
        ? Container()
        : Positioned(
            top: 30.dh,
            left: 15.dw,
            child: Material(
              elevation: 2,
              shadowColor: Colors.grey.shade100,
              child: Container(
                height: 40.dh,
                alignment: Alignment.center,
                width: ScreenSizeConfig.getFullWidth - 30.dw,
                child: AppText(editor.address,
                    size: 16.dw, color: AppColors.textColor2),
              ),
            ));
  }

  _buildConfirmLocationButton(bool isDragging) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 60.dh,
        width: ScreenSizeConfig.getFullWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.dw),
                topRight: Radius.circular(30.dw))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isDragging
                ? Container(
                    height: 35.dh,
                    width: 300.dw,
                    margin: EdgeInsets.only(left: 15.dw),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15.dw))),
                    child: Lottie.asset('assets/icons/loading-dots.json',
                        height: 50.dw),
                  )
                : AppTextButton(
                    onPressed: bloc.confirm,
                    borderRadius: 5.dw,
                    text: 'Confirm Location',
                    buttonColor: AppColors.primaryColor,
                    family: kFontFam2,
                    height: 35.dh,
                    width: 300.dw,
                    margin: EdgeInsets.only(left: 15.dw),
                    textColor: AppColors.onPrimary,
                  ),
            AppIconButton(
              onPressed: () => bloc.moveToOrigin(mapController),
              icon: Icons.gps_fixed,
              iconColor: AppColors.secondaryColor,
              size: 45.dw,
              iconSize: 25.dw,
              margin: EdgeInsets.only(right: 15.dw),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      bloc.refreshMap(mapController);
    }
  }
}
