import '../source.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const UserProfilePage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.dh),
        child: Column(
          children: [
            _buildAppBar(),
            _buildTitle(),
            _buildAccountInfo(),
            _buildSignOutButton(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(15.dw, 0.dh, 15.dw, 30.dh),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icons.arrow_back,
              iconColor: AppColors.secondaryColor,
              size: 35.dw,
              iconSize: 25.dw,
            ),
            AppTextButton(
              onPressed: () {},
              text: 'Edit',
              textColor: AppColors.primaryColor,
              fontSize: 18.dw,
              isBolded: true,
            )
          ],
        ),
      );
    });
  }

  _buildTitle() {
    return Column(
      children: [
        CircleAvatar(
          radius: 70.dw,
          backgroundImage: const NetworkImage(
              'https://images.pexels.com/photos/1535437/pexels-photo-1535437.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        ),
        SizedBox(height: 15.dh),
        AppText(
          'Angela Smith',
          size: 20.dw,
          isBolded: true,
        ),
        SizedBox(height: 5.dh),
        AppText(
          '( Joined May, 2021 )',
          size: 16.dw,
          color: AppColors.textColor2,
        ),
      ],
    );
  }

  _buildAccountInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15.dw, 35.dh, 15.dh, 0),
          child: AppText(
            'Account Info',
            size: 22.dw,
            color: AppColors.textColor2,
            isBolded: true,
          ),
        ),
        _buildListTile('Email', Icons.email, 'angelasmith@gmail.com'),
        _buildListTile('Phone', Icons.phone, '+255743877660'),
        _buildListTile('Language', Icons.language, 'English'),
      ],
    );
  }

  _buildListTile(String title, IconData icon, String value) {
    return AppMaterialButton(
      onPressed: () {},
      margin: EdgeInsets.only(top: 10.dh),
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 5.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20.dw, color: AppColors.secondaryColor),
              SizedBox(width: 10.dw),
              AppText(title, size: 16.dw, isBolded: true),
            ],
          ),
          SizedBox(height: 5.dw),
          AppText(
            value,
            size: 16.dw,
            color: AppColors.textColor2,
          )
        ],
      ),
    );
  }

  _buildSignOutButton() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppTextButton(
            onPressed: () {},
            text: 'Sign out',
            isBolded: true,
            height: 45.dh,
            borderRadius: 5.dw,
            margin: EdgeInsets.only(left: 15.dw, right: 15.dw, bottom: 10.dw),
            buttonColor: AppColors.secondaryColor,
            textColor: AppColors.onPrimary,
          ),
        ],
      ),
    );
  }
}
