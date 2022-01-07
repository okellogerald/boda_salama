import '../source.dart';

class DriverListSheet extends StatelessWidget {
  const DriverListSheet(this.drivers,
      {required this.viewOnMapCallback, required this.userLocation, Key? key})
      : super(key: key);

  final void Function(Driver) viewOnMapCallback;
  final List<Driver> drivers;
  final Location userLocation;

  static final isExpandedNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableActuator(
      child: ValueListenableBuilder<bool>(
          valueListenable: isExpandedNotifier,
          builder: (context, value, child) {
            return DraggableScrollableSheet(
                key: Key(value.toString()),
                maxChildSize: .8,
                initialChildSize: .25,
                minChildSize: .20,
                builder: (context, ScrollController scrollController) {
                  return _child(scrollController);
                });
          }),
    );
  }

  _child(ScrollController controller) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.dw))),
        padding: EdgeInsets.only(top: 10.dh),
        child: Column(
          children: [
            const SheetOpeningTile(),
            Expanded(
              child: ListView(
                controller: controller,
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.dw),
                    child: AppText(
                      'Drivers sorted by their approx. distance from your current location.',
                      size: 16.dw,
                      isBolded: true,
                      alignment: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 10.dh),
                  Column(
                      children: drivers
                          .map((e) => DriverTile(
                                e,
                                userLocation: userLocation,
                                viewOnMapCallback: (driver) {
                                  isExpandedNotifier.value =
                                      !isExpandedNotifier.value;
                                  DraggableScrollableActuator.reset(context);
                                  viewOnMapCallback(driver);
                                },
                              ))
                          .toList())
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
