import 'dart:async';
import 'package:lottie/lottie.dart';
import '../source.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const DriverPage()));

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> with WidgetsBindingObserver {
  final mapController = Completer<GoogleMapController>();

  late final TripsService tripsService;
  late final LocationService locationsService;
  late final PlacesService placesService;
  late final DriverPageBloc bloc;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    tripsService = Provider.of<TripsService>(context, listen: false);
    placesService = Provider.of<PlacesService>(context, listen: false);
    locationsService = Provider.of<LocationService>(context, listen: false);
    bloc = DriverPageBloc(locationsService, placesService, tripsService);
    bloc.init(mapController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverPageBloc, DriverPageState>(
        bloc: bloc,
        builder: (_, state) {
          return state.when(
            loading: (supp) => _buildContent(supp, isLoading: true),
            content: _buildContent,
          );
        });
  }

  Widget _buildContent(DriverPageSupplements supp, {bool isLoading = false}) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(supp),
      drawer: DriverDrawer(supp.driver),
      body: Stack(
        children: [
          _buildMap(supp),
          _buildReturnOnline(supp),
          _buildTrips(supp),
          _buildLoading(isLoading),
        ],
      ),
    );
  }

  _buildTrips(DriverPageSupplements supp) {
    final radius = Radius.circular(30.dw);
    final trip = supp.isOffline ? Trip.empty() : supp.trips[supp.currentIndex];

    return !supp.isOffline
        ? Positioned(
            bottom: 0,
            child: Container(
              height: 280.dh,
              width: ScreenSizeConfig.getFullWidth,
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius:
                      BorderRadius.only(topLeft: radius, topRight: radius)),
              child: Column(
                children: [
                  _buildTripsTitle(supp),
                  _buildTripDetails(trip),
                ],
              ),
            ),
          )
        : Container();
  }

  _buildTripsTitle(DriverPageSupplements supp) {
    final numberOfTrips = supp.trips.length;

    return Padding(
      padding: EdgeInsets.fromLTRB(20.dw, 20.dw, 20.dw, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            '$numberOfTrips Current Ride Requests',
            size: 16.dw,
            color: AppColors.onPrimary,
          ),
          _buildTripsControls(supp),
        ],
      ),
    );
  }

  _buildTripDetails(Trip trip) {
    final radius = Radius.circular(30.dw);

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 15.dh, left: 20.dw, right: 10.dw),
        margin: EdgeInsets.only(top: 10.dh),
        width: ScreenSizeConfig.getFullWidth,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPickUpInfo(trip),
            SizedBox(height: 15.dh),
            AppText(
              '${trip.distance.toStringAsFixed(2)} m away ( ~ ${trip.timeAway} mins )',
              size: 16.dw,
              color: AppColors.accentColor,
              isBolded: true,
            ),
            _buildTripButtons(trip),
          ],
        ),
      ),
    );
  }

  _buildTripButtons(Trip trip) {
    return Padding(
      padding: EdgeInsets.only(top: 30.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppTextButton(
            onPressed: () => bloc.ignore(trip.tripId),
            text: 'Ignore',
            isBolded: true,
            height: 40.dh,
            width: 120.dw,
            textColor: AppColors.textColor2,
          ),
          SizedBox(width: 20.dw),
          AppTextButton(
            onPressed: () => DriverToCustomerPage.navigateTo(context, trip),
            text: 'Accept',
            height: 40.dh,
            width: 120.dw,
            textColor: AppColors.onPrimary,
            buttonColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }

  _buildPickUpInfo(Trip trip) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                trip.customerName,
                size: 20.dw,
                isBolded: true,
              ),
              SizedBox(height: 5.dh),
              AppText(
                trip.pickUpAddress,
                size: 15.dw,
                maxLines: 2,
                alignment: TextAlign.start,
                color: AppColors.textColor2,
              ),
              AppTextButton(
                onPressed: () => bloc.viewOnMap(trip.tripId),
                text: 'view on map',
                textColor: AppColors.primaryColor,
                alignment: Alignment.centerLeft,
                borderRadius: 0,
                width: 100.dw,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.dw),
          child: CircleAvatar(
            backgroundImage: NetworkImage(trip.customerImage),
            backgroundColor: Colors.grey.shade300,
            radius: 45.dw,
          ),
        )
      ],
    );
  }

  _buildTripsControls(DriverPageSupplements supp) {
    final isTheLast = supp.currentIndex == supp.trips.length - 1;
    final isTheFirst = supp.currentIndex == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppIconButton(
          onPressed: isTheFirst
              ? () {}
              : () => bloc.updateIndex(isGoingForward: false),
          icon: Icons.chevron_left,
          iconColor: isTheFirst ? Colors.white54 : Colors.white,
        ),
        SizedBox(width: 20.dw),
        AppIconButton(
          onPressed: isTheLast ? () {} : bloc.updateIndex,
          icon: Icons.chevron_right,
          iconColor: isTheLast ? Colors.white54 : Colors.white,
        ),
      ],
    );
  }

  _buildReturnOnline(DriverPageSupplements supp) {
    return supp.isOffline
        ? Positioned(
            top: 10.dh,
            left: 15.dw,
            child: Container(
              color: AppColors.errorColor,
              width: ScreenSizeConfig.getFullWidth - 30.dw,
              padding: EdgeInsets.all(10.dw),
              child: Row(
                children: [
                  Icon(Icons.dark_mode, size: 30.dw, color: Colors.black),
                  SizedBox(width: 10.dw),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'YOU\'RE OFFLINE',
                        size: 14.dw,
                        color: AppColors.onPrimary,
                      ),
                      AppText(
                        'Return online to start receiving ride requests.',
                        size: 14.dw,
                        color: AppColors.onPrimary2,
                      ),
                    ],
                  ),
                ],
              ),
            ))
        : Container();
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
              child: Center(
                child: Lottie.asset(
                  'assets/icons/loading.json',
                  height: 50.dh,
                  fit: BoxFit.contain,
                ),
              ),
            ))
        : Container();
  }

  _buildAppBar(DriverPageSupplements supp) {
    return AppBar(
      backgroundColor:
          supp.isOffline ? Colors.white70 : AppColors.secondaryColor,
      elevation: 0.0,
      leading: AppIconButton(
          icon: Icons.menu,
          iconSize: 25.dw,
          size: 55.dw,
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          iconColor:
              supp.isOffline ? AppColors.textColor : AppColors.onPrimary2),
      centerTitle: true,
      title: AppText(
        supp.isOffline ? 'Offline' : 'Online',
        size: 18.dw,
        color: supp.isOffline ? AppColors.secondaryColor : AppColors.onPrimary,
      ),
      actions: [
        AppIconButton(
          onPressed: () => bloc.toggleStatus(mapController),
          icon: supp.isOffline ? Icons.toggle_off_outlined : Icons.toggle_on,
          size: 55.dw,
          iconSize: 30.dw,
          margin: EdgeInsets.only(right: 10.dw),
          iconColor:
              supp.isOffline ? AppColors.secondaryColor : AppColors.onPrimary,
        ),
      ],
    );
  }

  _buildMap(DriverPageSupplements supp) {
    final location = supp.driver.position;

    return GoogleMap(
      zoomControlsEnabled: false,
      compassEnabled: false,
      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      markers: supp.markers.toSet(),
      scrollGesturesEnabled: !supp.isOffline,
      onMapCreated: mapController.isCompleted
          ? (_) {}
          : (controller) => mapController.complete(controller),
      initialCameraPosition: CameraPosition(target: location, zoom: 16.25),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      log('resuming on the driver page using set state');
      bloc.refreshMap(mapController);
    }
  }
}
