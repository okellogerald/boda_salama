import 'dart:async';
import 'package:custom_timer/custom_timer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../source.dart';

class DriverToCustomerPage extends StatefulWidget {
  const DriverToCustomerPage(this.trip, {Key? key}) : super(key: key);

  final Trip trip;

  static MaterialPageRoute _route(Trip trip) =>
      MaterialPageRoute(builder: (_) => DriverToCustomerPage(trip));

  static void navigateTo(BuildContext context, Trip trip) =>
      Navigator.push(context, _route(trip));

  @override
  State<DriverToCustomerPage> createState() => _DriverToCustomerPageState();
}

class _DriverToCustomerPageState extends State<DriverToCustomerPage>
    with WidgetsBindingObserver {
  static final Completer<GoogleMapController> mapController = Completer();
  final timerController = CustomTimerController();
  final timerStateNotifier =
      ValueNotifier<CustomTimerState>(CustomTimerState.paused);

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildSampleMap(),
            _buildPickUpDetails(),
            _buildPhoneNumber(),
            // _buildTimer(),
            _buildPickUpButton(),
          ],
        ),
      );
    });
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        title: AppText(
          'Riding to a pick up',
          size: 18.dw,
          color: AppColors.onPrimary,
          isBolded: true,
        ));
  }

  _buildSampleMap() {
    final position =
        LatLng(widget.trip.driverLatitude, widget.trip.driverLongitude);
    final pickUpPosition =
        LatLng(widget.trip.pickUpLatitude, widget.trip.pickUpLongitude);

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
            color: AppColors.secondaryColor,
            child: AppText(
              'Real-time tracking',
              size: 14.dw,
              color: AppColors.onPrimary,
            ))
      ],
    );
  }

  _buildPickUpDetails() {
    final trip = widget.trip;

    return Container(
      width: ScreenSizeConfig.getFullWidth,
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Pick Up Details',
            size: 20.dw,
            isBolded: true,
          ),
          SizedBox(height: 10.dh),
          _buildPickUpDetail('Name', trip.customerName),
          _buildPickUpDetail('Address', trip.pickUpAddress),
          _buildPickUpDetail(
              'Distance', trip.distance.toStringAsFixed(2) + ' m'),
          _buildPickUpDetail('Time', '~ ' + trip.timeAway.toString() + ' mins')
        ],
      ),
    );
  }

  _buildPickUpDetail(String title, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          width: 100.dw,
          child: AppText(title, size: 16.dw, color: AppColors.textColor)),
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
      width: ScreenSizeConfig.getFullWidth,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 15.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                'Customer\'s phone number',
                size: 16.dw,
                color: AppColors.textColor2,
              ),
              AppText(
                '0745-543-443',
                size: 18.dw,
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
    return ValueListenableBuilder<CustomTimerState>(
        valueListenable: timerStateNotifier,
        builder: (context, timerState, snapshot) {
          final isCounting = timerState == CustomTimerState.counting;
          final isFinished = timerState == CustomTimerState.finished;
          if (isFinished) return Container();

          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTextButton(
                  onPressed:
                      () {} /* isCounting ? () {} : timerController.start */,
                  text: isCounting ? 'Reached the customer' : 'GO FOR PICK-UP',
                  buttonColor: AppColors.primaryColor,
                  textColor: AppColors.onPrimary,
                  height: 45.dh,
                  borderRadius: 0,
                ),
              ],
            ),
          );
        });
  }

  _buildTimer() {
    final trip = widget.trip;
    final style = TextStyle(
        fontSize: 50.dw,
        fontWeight: FontWeight.w400,
        color: AppColors.onPrimary);

    return Expanded(
      child: Container(
        height: 100.dh,
        width: ScreenSizeConfig.getFullWidth,
        color: AppColors.secondaryColor,
        alignment: Alignment.center,
        child: CustomTimer(
            controller: timerController,
            begin: Duration(minutes: trip.timeAway),
            end: const Duration(),
            builder: (time) {
              return SizedBox(
                width: 200.dw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(time.minutes, style: style),
                    SizedBox(width: 15.dw),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' : ', style: style),
                        Text(time.seconds, style: style),
                      ],
                    )),
                  ],
                ),
              );
            },
            onChangeState: (state) {
              timerStateNotifier.value = state;
            }),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      log('google map has been reloaded on the driver to customer page using set state');
      final controller = await mapController.future;
      controller.setMapStyle('[]');
    }
  }
}
