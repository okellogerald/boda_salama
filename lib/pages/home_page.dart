import 'dart:async';
import 'package:boda_salama/widgets/notification_banner.dart';
import '../source.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.location, Key? key}) : super(key: key);

  final Location? location;

  static const initialCameraPosition =
      CameraPosition(target: LatLng(-6.7731456, 39.2331264));

  static void navigateTo(BuildContext context, Location location) =>
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => HomePage(location: location)),
          (route) => false);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late final LocationService service;
  late final PlacesService placesService;
  late final TripsService tripsService;
  late final HomePageBloc bloc;

  final appBarVisibilityNotifier = ValueNotifier<bool>(true);
  static final mapController = Completer<GoogleMapController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    service = Provider.of<LocationService>(context, listen: false);
    placesService = Provider.of<PlacesService>(context, listen: false);
    tripsService = Provider.of<TripsService>(context, listen: false);
    bloc = HomePageBloc(service, placesService, tripsService);
    bloc.init(location: widget.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
        bloc: bloc,
        listener: (_, state) {
          final shouldShowSheet = state.maybeWhen(
              content: (_, __, s) => s.driver != null, orElse: () => false);

          if (shouldShowSheet) _showBottomSheet(state.supplements);
        },
        builder: (_, state) {
          return state.when(loading: _buildLoading, content: _buildContent);
        });
  }

  Widget _buildLoading(
      List<Marker> markers, List<Driver> drivers, Supplements supplements) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    ));
  }

  Widget _buildContent(
      List<Marker> markers, List<Driver> drivers, Supplements supp) {
    if (!supp.isGrantedPermission) return _buildPermissions();

    return Scaffold(
      key: scaffoldKey,
      drawer: AppDrawer(supp.trip.isReal),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          _buildMap(supp.location, markers),
          _buildFloatingAppBar(supp),
          _buildDriversList(drivers, supp),
        ],
      ),
    );
  }

  _buildDriversList(List<Driver> drivers, Supplements supp) {
    final location = Location(address: supp.address, point: supp.location);
    return DriverListSheet(drivers, userLocation: location,
        viewOnMapCallback: (driver) {
      bloc.viewOnMap(driver.id);
      _showBottomSheet(supp);
    });
  }

  _buildPermissions() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15.dw, 40.dw, 15.dw, 0),
        decoration: const BoxDecoration(
            /* image: DecorationImage(
                  image: NetworkImage(kOpeningImage), fit: BoxFit.fill) */
            ),
        child: Column(
          children: [
            AppText(
              'Boda Salama',
              size: 30.dw,
              weight: FontWeight.w700,
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Boda Salama needs location permission to operate.',
                      size: 16.dw),
                  AppTextButton(
                    onPressed: bloc.askForPermission,
                    height: 40.dh,
                    margin: EdgeInsets.only(top: 40.dh),
                    text: 'Allow',
                    textColor: AppColors.onPrimary,
                    buttonColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildMap(LatLng location, List<Marker> markers) {
    return GoogleMap(
        zoomControlsEnabled: false,
        compassEnabled: false,
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        markers: markers.toSet(),
        onMapCreated: mapController.isCompleted
            ? (_) {}
            : (controller) => mapController.complete(controller),
        circles: <Circle>{
          Circle(
            circleId: const CircleId('-1'),
            radius: 375,
            strokeWidth: 2,
            strokeColor: AppColors.primaryColor.withOpacity(.65),
            center: location,
            fillColor: AppColors.primaryColor.withOpacity(.1),
          )
        },
        initialCameraPosition: CameraPosition(target: location, zoom: 16.25));
  }

  _showBottomSheet(Supplements supp) {
    scaffoldKey.currentState!.showBottomSheet(
      (context) => _buildBottomSheet(supp.driver!, supp),
      backgroundColor: Colors.transparent,
    );
  }

  _buildBottomSheet(Driver driver, Supplements supp) {
    return Container(
        height: 240.dh,
        width: ScreenSizeConfig.getFullWidth,
        padding: EdgeInsets.only(
            left: 20.dw, right: 20.dw, top: 15.dh, bottom: 5.dh),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.dw),
            topRight: Radius.circular(30.dw),
          ),
        ),
        child: DriverProfile(driver,
            userLocation:
                Location(address: supp.address, point: supp.location)));
  }

  _buildFloatingAppBar(Supplements supp) {
    return ValueListenableBuilder<bool>(
        valueListenable: appBarVisibilityNotifier,
        builder: (context, isVisible, snapshot) {
          return isVisible
              ? Positioned(
                  top: 30.dh,
                  child: Container(
                      width: ScreenSizeConfig.getFullWidth - 30.dw,
                      height: 40.dh,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.dw))),
                      child: _buildCurrentLocation(supp)))
              : Positioned(
                  top: 33.5.dh,
                  left: 15.dw,
                  child: Stack(
                    children: [
                      AppIconButton(
                        onPressed: () =>
                            appBarVisibilityNotifier.value = !isVisible,
                        icon: Icons.more_vert,
                        margin: EdgeInsets.only(right: 10.dw),
                        size: 40.dw,
                        iconSize: 25.dw,
                        buttonColor: AppColors.primaryColor,
                        iconColor: AppColors.onPrimary,
                      ),
                      supp.trip.isReal
                          ? Positioned(
                              right: 18.dw,
                              top: 5.dh,
                              child: const NotificationBanner())
                          : Container()
                    ],
                  ),
                );
        });
  }

  _buildCurrentLocation(Supplements supp) {
    return AppMaterialButton(
      elevation: 2,
      shadowColor: Colors.grey.shade100,
      color: Colors.white,
      onPressed: () =>
          CustomLocationPage.navigateTo(context, location: widget.location),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Stack(
          children: [
            AppIconButton(
              onPressed: scaffoldKey.currentState!.openDrawer,
              icon: Icons.menu_outlined,
              size: 40.dw,
              iconSize: 25.dw,
              margin: EdgeInsets.only(left: 5.dw),
              iconColor: AppColors.secondaryColor,
            ),
            supp.trip.isReal
                ? Positioned(
                    right: 8.dw, top: 10.dh, child: const NotificationBanner())
                : Container()
          ],
        ),
        AppText(
          widget.location != null
              ? widget.location!.address
              : 'use custom location',
          size: 15.dw,
          color: AppColors.primaryColor,
          family: kFontFam2,
        ),
        AppIconButton(
          onPressed: () =>
              appBarVisibilityNotifier.value = !appBarVisibilityNotifier.value,
          icon: Icons.more_horiz,
          margin: EdgeInsets.only(right: 10.dw),
          size: 40.dw,
          iconSize: 25.dw,
          iconColor: AppColors.secondaryColor,
        ),
      ]),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      bloc.refreshMap(mapController);
    }
  }
}
