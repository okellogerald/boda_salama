import '../source.dart';

class DriverTile extends StatelessWidget {
  const DriverTile(this.driver,
      {required this.viewOnMapCallback, required this.userLocation, Key? key})
      : super(key: key);

  final Driver driver;
  final Location userLocation;
  final ValueChanged<Driver> viewOnMapCallback;

  @override
  Widget build(BuildContext context) {
    final distance = driver.distance.toStringAsFixed(2);
    final timeAway = driver.getTimeAway;

    return Container(
        padding: EdgeInsets.only(bottom: 5.dh, left: 15.dw, right: 15.dw),
        margin: EdgeInsets.only(bottom: 10.dh),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.grey.shade300,
          width: 2,
        ))),
        child: Column(
          children: [
            Row(children: [
              AppImageButton(
                onPressed: () =>
                    DriverProfilePage.navigateTo(context, driver, userLocation),
                imageUrl: driver.image,
                size: 55.dw,
                radius: 5.dw,
              ),
              SizedBox(width: 10.dw),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    driver.name,
                    size: 16.dw,
                    isBolded: false,
                    color: AppColors.textColor,
                    weight: FontWeight.w500,
                  ),
                  AppText(
                    'Age : ${driver.age}',
                    size: 15.dw,
                    weight: FontWeight.w500,
                    color: AppColors.textColor2,
                  ),
                  AppText(
                    'Rating : ${driver.rating}',
                    size: 15.dw,
                    weight: FontWeight.w500,
                    color: AppColors.textColor2,
                  ),
                ],
              ),
            ]),
            SizedBox(height: 10.dh),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text: '$distance m', children: [
                    TextSpan(
                        text:
                            ' ( ~ $timeAway ${timeAway == 1 ? 'min' : 'mins'} )')
                  ]),
                  style: TextStyle(
                    fontSize: 15.dw,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppTextButton(
                      onPressed: () => viewOnMapCallback(driver),
                      text: 'View on map',
                      textColor: AppColors.primaryColor,
                      family: kFontFam2,
                    ),
                    SizedBox(width: 20.dw),
                    AppTextButton(
                      onPressed: () => DriverProfilePage.navigateTo(
                          context, driver, userLocation),
                      text: 'Go to profile',
                      textColor: AppColors.primaryColor,
                      family: kFontFam2,
                    )
                  ],
                ))
              ],
            )
          ],
        ));
  }
}
