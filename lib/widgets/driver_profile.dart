import '../source.dart';

class DriverProfile extends StatelessWidget {
  const DriverProfile(this.driver, {required this.userLocation, Key? key})
      : super(key: key);

  final Driver driver;
  final Location userLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SheetOpeningTile(),
        _buildTitle(),
        _buildLocation(),
        _buildBookBodaButton()
      ],
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 10.dh, bottom: 20.dh),
      child: Row(
        children: [
          AppImage(
            imageUrl: driver.image,
            height: 70.dw,
            width: 70.dw,
            radius: 5.dw,
          ),
          SizedBox(width: 20.dw),
          SizedBox(
            //  height: 70.dw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  driver.name,
                  size: 22.dw,
                  isBolded: true,
                ),
                AppText(
                  'Age : ${driver.age}',
                  size: 15.dw,
                  weight: FontWeight.w500,
                ),
                AppText(
                  'Rating : ${driver.rating}',
                  size: 15.dw,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildLocation() {
    final distanceAway = driver.distance.toStringAsFixed(2);
    final timeAway = driver.getTimeAway;

    return Row(
      children: [
        Icon(
          AppIcons.distance,
          size: 20.dw,
          color: AppColors.secondaryColor,
        ),
        SizedBox(width: 10.dw),
        AppText(
          '$distanceAway m away ',
          size: 16.dw,
          color: AppColors.accentColor,
        ),
        AppText(
          '( ~ $timeAway ${timeAway == 1 ? 'min' : 'mins'} )',
          size: 16.dw,
          color: AppColors.textColor2,
        )
      ],
    );
  }

  _buildBookBodaButton() {
    return Builder(builder: (context) {
      return AppTextButton(
        onPressed: () =>
            DriverProfilePage.navigateTo(context, driver, userLocation),
        text: 'View full profile',
        family: kFontFam2,
        borderRadius: 5.dw,
        height: 45.dh,
        margin: EdgeInsets.only(top: 20.dh),
        buttonColor: AppColors.primaryColor,
        textColor: AppColors.onPrimary,
      );
    });
  }
}
