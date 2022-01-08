import 'dart:async';
import 'package:lottie/lottie.dart' hide Marker;
import 'package:url_launcher/url_launcher.dart';
import '../source.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({required this.driver, required this.location, Key? key})
      : super(key: key);

  final Driver driver;
  final Location location;

  static void navigateTo(BuildContext context,
          {required Driver driver, required Location location}) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChatPage(driver: driver, location: location)));

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  late final ChatPageBloc bloc;
  late final TripsService tripService;

  final mapController = Completer<GoogleMapController>();

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    tripService = Provider.of<TripsService>(context, listen: false);
    bloc = ChatPageBloc(tripService);
    bloc.init(widget.driver, widget.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatPageBloc, ChatPageState>(
        listener: (_, state) {
          final isCancelled =
              state.maybeWhen(cancelled: () => true, orElse: () => false);

          if (isCancelled) Navigator.pop(context);
        },
        bloc: bloc,
        builder: (_, state) {
          return state.when(
            loading: _buildLoading,
            content: _buildContent,
            cancelled: _buildContent,
          );
        });
  }

  Widget _buildLoading(String message) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.dw),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/icons/loading.json',
              height: 50.dh,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 15.dh),
            AppText(
              message,
              size: 18.dw,
              color: AppColors.textColor2,
            ),
            SizedBox(height: 70.dh),
            AppTextButton(
              onPressed: bloc.cancelTrip,
              text: 'Cancel',
              height: 45.dh,
              borderRadius: 5.dw,
              buttonColor: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10.dh),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.dw),
              child: AppText(
                  '${widget.driver.name} accepted your request and is on the way.',
                  size: 16.dw),
            ),
            SizedBox(height: 10.dh),
            _buildSampleMap(),
            _buildPickUpDetails(),
            _buildPhoneNumber(),
            _buildPickUpButton(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: AppText(
          'Waiting for pick up',
          size: 18.dw,
          color: AppColors.onPrimary,
          isBolded: true,
        ));
  }

  _buildSampleMap() {
    final position = widget.location.point;
    final pickUpPosition = widget.driver.position;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          height: 300.dh,
          child: GoogleMap(
              compassEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (c) {
                c.setMapStyle(AppMapStyling.getRetroStyle);
                mapController.complete(c);
              },
              markers: {
                Marker(
                  markerId: const MarkerId('driver'),
                  position: position,
                  icon: AppMarkers.getDarkDriverIcon,
                ),
                Marker(
                  markerId: const MarkerId('customer'),
                  position: pickUpPosition,
                  icon: BitmapDescriptor.defaultMarker,
                )
              },
              initialCameraPosition:
                  CameraPosition(target: position, zoom: 15.5)),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5.dw, horizontal: 10.dw),
            color: Colors.black87,
            child: AppText(
              'Real-time tracking',
              size: 14.dw,
              color: AppColors.onPrimary,
            ))
      ],
    );
  }

  _buildPickUpDetails() {
    final driver = widget.driver;

    return Container(
      width: ScreenSizeConfig.getFullWidth,
      padding: EdgeInsets.symmetric(vertical: 15.dh, horizontal: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Driver Details',
            size: 20.dw,
            isBolded: true,
          ),
          SizedBox(height: 5.dh),
          _buildPickUpDetail('Name', driver.name),
          _buildPickUpDetail(
              'Distance', driver.distance.toStringAsFixed(2) + ' m'),
          _buildPickUpDetail(
              'Time', '~ ' + driver.getTimeAway.toString() + ' mins')
        ],
      ),
    );
  }

  _buildPickUpDetail(String title, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          width: 100.dw,
          child: AppText(title,
              size: 16.dw, isBolded: true, color: AppColors.textColor2)),
      SizedBox(width: 30.dw),
      Expanded(
          child: Row(
        children: [
          AppText(value, size: 16.dw, color: AppColors.textColor2),
        ],
      )),
    ]);
  }

  void _makeACall() async {
    await launch('tel:0742344768');
  }

  _buildPhoneNumber() {
    return Container(
      height: 80.dh,
      width: ScreenSizeConfig.getFullWidth,
      color: Colors.grey.shade300,
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                'Driver\'s phone number',
                size: 16.dw,
                color: AppColors.textColor2,
              ),
              AppText(
                '0745-543-443',
                size: 18.dw,
                isBolded: true,
              ),
            ],
          ),
          AppIconButton(
            onPressed: _makeACall,
            icon: Icons.call,
            iconColor: AppColors.onPrimary,
            buttonColor: AppColors.accentColor,
            size: 55.dw,
            iconSize: 25.dw,
          )
        ],
      ),
    );
  }

  _buildPickUpButton() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppTextButton(
            onPressed: () {},
            text: 'Driver has arrived',
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.onPrimary,
            height: 45.dh,
          ),
        ],
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      log('google map has been reloaded on the driver to chat page');
      setState(() {});
    }
  }
}
