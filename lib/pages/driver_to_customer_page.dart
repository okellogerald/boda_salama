import 'dart:async';

import 'package:custom_timer/custom_timer.dart';

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

class _DriverToCustomerPageState extends State<DriverToCustomerPage> {
  static final Completer<GoogleMapController> mapController = Completer();
  final timerController = CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSampleMap(),
          _buildPickUpDetails(),
          _buildPhoneNumber(),
          _buildPickUpButton(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.black,
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
              scrollGesturesEnabled: false,
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
            padding: EdgeInsets.all(5.dw),
            color: AppColors.secondaryColor,
            child: AppText('Real-time tracking',
                color: AppColors.onPrimary, size: 14.dw))
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

  _buildPhoneNumber() {
    return Container(
      height: 80.dh,
      width: ScreenSizeConfig.getFullWidth,
      color: Colors.grey.shade300,
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            '0745-543-443',
            size: 18.dw,
            isBolded: true,
          ),
          AppIconButton(
            onPressed: () {},
            icon: Icons.call,
            iconColor: AppColors.onPrimary,
            buttonColor: AppColors.secondaryColor,
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
            text: 'GO FOR PICK-UP',
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.onPrimary,
            height: 45.dh,
          )
        ],
      ),
    );
  }

  _buildTimer() {
    final trip = widget.trip;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100.dh,
          width: ScreenSizeConfig.getFullWidth,
          color: Colors.grey.shade300,
          alignment: Alignment.center,
          child: CustomTimer(
              controller: timerController,
              begin: Duration(minutes: trip.timeAway),
              end: const Duration(),
              builder: (time) {
                return Text(
                    "${time.minutes} : ${time.seconds} : ${time.milliseconds}",
                    style: TextStyle(
                      fontSize: 30.dw,
                      fontFamily: kFontFam,
                      fontWeight: FontWeight.w600,
                    ));
              },
              onChangeState: (state) {
                // This callback function runs when the timer state changes.
                print("Current state: $state");
              }),
        ),
        SizedBox(height: 10.dh),
        AppText(
          '* A customer expects to see you around this time.',
          size: 16.dw,
          color: AppColors.accentColor,
        ),
        SizedBox(height: 10.dh),
        AppTextButton(
            onPressed: () {},
            text: 'START',
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.onPrimary,
            height: 40.dh)
      ],
    );
  }
}
