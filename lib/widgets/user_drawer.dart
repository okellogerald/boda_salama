import '../source.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer(this.hasTrip, {Key? key}) : super(key: key);

  final bool hasTrip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSizeConfig.getFullWidth - 60.dw,
      child: Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: 50.dh),
          child: Column(
            children: [
              _buildTitle(),
              _buildTileList(),
              _buildBecomeDriver(),
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle() {
    return Builder(builder: (context) {
      return Column(
        children: [
          CircleAvatar(
            radius: 50.dw,
            backgroundImage: const NetworkImage(
                'https://images.pexels.com/photos/1535437/pexels-photo-1535437.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          ),
          SizedBox(height: 15.dh),
          AppText(
            'Angela Smith',
            size: 25.dw,
            isBolded: true,
          ),
          AppTextButton(
            onPressed: () => UserProfilePage.navigateTo(context),
            text: 'View profile',
            textColor: AppColors.primaryColor,
            height: 40.dh,
            margin: EdgeInsets.only(top: 5.dh),
          ),
        ],
      );
    });
  }

  _buildTileList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.dh),
        _buildTile(Icons.notifications_outlined, 'Notifications'),
        _buildTile(Icons.two_wheeler_outlined, 'Ride History'),
        _buildTile(Icons.payment, 'Payments'),
        _buildTile(Icons.support, 'Support'),
        _buildTile(Icons.info_outline, 'About'),
        _buildTile(Icons.settings_outlined, 'Settings'),
      ],
    );
  }

  _buildTile(IconData icon, String title) {
    return AppMaterialButton(
        onPressed: () {},
        padding: EdgeInsets.only(left: 15.dw),
        child: ListTile(
          leading: Icon(icon),
          title: AppText(title, size: 16.dw),
          horizontalTitleGap: 5.dw,
          contentPadding: EdgeInsets.zero,
          dense: true,
        ));
  }

  _buildBecomeDriver() {
    return Expanded(
      child: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppTextButton(
              onPressed: () => DriverPage.navigateTo(context),
              text: 'Become A Driver',
              margin: EdgeInsets.symmetric(horizontal: 15.dw),
              height: 45.dh,
              width: ScreenSizeConfig.getFullWidth,
              buttonColor:
                  hasTrip ? AppColors.accentColor : AppColors.primaryColor,
              isBolded: false,
              textColor: AppColors.onPrimary,
            ),
            SizedBox(height: 10.dh)
          ],
        );
      }),
    );
  }
}
