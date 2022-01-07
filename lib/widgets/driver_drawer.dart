import '../source.dart';

class DriverDrawer extends StatelessWidget {
  const DriverDrawer(this.driver, {Key? key}) : super(key: key);

  final Driver driver;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370.dw,
      child: Drawer(
        child: Column(
          children: [
            _buildTitle(),
            _buildEarningBanner(),
            _buildTileList(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(15.dw, 35.dh, 15.dw, 10.dh),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35.dw,
              backgroundImage: NetworkImage(driver.image),
            ),
            SizedBox(width: 15.dh),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  driver.name,
                  size: 18.dw,
                  isBolded: true,
                ),
                AppTextButton(
                  onPressed: () =>
                      OnDriverAppDriverProfilePage.navigateTo(context, driver),
                  text: 'View profile',
                  textColor: AppColors.primaryColor,
                  height: 30.dh,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  _buildEarningBanner() {
    return Card(
      margin: EdgeInsets.all(10.dw),
      elevation: 2,
      shadowColor: Colors.grey.shade200,
      color: AppColors.secondaryColor,
      child: Container(
          padding: EdgeInsets.all(8.dw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('Earned today', size: 16.dw, color: AppColors.onPrimary2),
              AppText(
                '70,000 /= Tzs',
                size: 22.dw,
                isBolded: true,
                color: AppColors.onPrimary,
              ),
              SizedBox(height: 10.dh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildEstimation('Total trips', '13'),
                  _buildEstimation('Total distance', '21 km'),
                  _buildEstimation('Hours online', '5 hrs'),
                ],
              )
            ],
          )),
    );
  }

  _buildEstimation(String title, String amount) {
    return Column(
      children: [
        AppText(
          title,
          color: AppColors.onPrimary2,
          size: 16.dw,
        ),
        AppText(
          amount,
          color: AppColors.onPrimary,
          isBolded: true,
          size: 16.dw,
        ),
      ],
    );
  }

  _buildTileList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.dh),
        _buildTile(Icons.document_scanner, 'Document Management'),
        _buildTile(Icons.two_wheeler_outlined, 'Vehicle Management'),
        _buildTile(Icons.money, 'Earnings History'),
        _buildTile(Icons.notifications_outlined, 'Notifications'),
        _buildTile(Icons.share, 'Invite Friends'),
        _buildTile(AppIcons.support, 'Support'),
        _buildTile(Icons.info_outline, 'About'),
        _buildTile(Icons.settings_outlined, 'Settings'),
      ],
    );
  }

  _buildTile(IconData icon, String title) {
    return AppMaterialButton(
      onPressed: () {},
      padding: EdgeInsets.only(top: 5.dh, bottom: 5.dh, left: 15.dw),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondaryColor, size: 22.dw),
          SizedBox(width: 15.dw),
          AppText(
            title,
            size: 16.dw,
            color: AppColors.textColor,
          ),
        ],
      ),
    );
  }
}
