import '../source.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const UserProfilePage()));

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: EdgeInsets.only(top: 40.dh),
        child: Column(
          children: [
            _buildTitle(),
            _buildAccountInfo(),
            _buildSignOutButton(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.secondaryColor,
      leading: AppIconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icons.arrow_back,
        iconColor: AppColors.onPrimary,
        size: 35.dw,
        iconSize: 25.dw,
      ),
      title: AppText('Profile Page', size: 18.dw, color: AppColors.onPrimary),
      actions: [
        AppIconButton(
          onPressed: () {},
          iconColor: AppColors.onPrimary,
          margin: EdgeInsets.only(right: 15.dw),
          size: 18.dw,
          icon: Icons.edit_outlined,
        ),
      ],
    );
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
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 5.dh),
      margin: EdgeInsets.only(top: 15.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.dh),
            padding: EdgeInsets.only(bottom: 8.dh),
            width: ScreenSizeConfig.getFullWidth,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 1.5))),
            child: AppText(
              'Account Information',
              size: 18.dw,
              color: AppColors.textColor,
            ),
          ),
          _buildListTile('Email', Icons.email, 'angelasmith@gmail.com'),
          _buildListTile('Phone', Icons.phone, '+255743877660'),
          _buildListTile('Language', Icons.language, 'English'),
        ],
      ),
    );
  }

  _buildListTile(String title, IconData icon, String value) {
    return ListTile(
      leading: Icon(icon, size: 20.dw, color: AppColors.secondaryColor),
      title: AppText(title, size: 16.dw),
      horizontalTitleGap: 5.dw,
      contentPadding: EdgeInsets.zero,
      dense: true,
      subtitle: AppText(
        value,
        size: 16.dw,
        color: AppColors.textColor2,
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
            margin: EdgeInsets.only(left: 15.dw, right: 15.dw, bottom: 10.dw),
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.onPrimary,
          ),
        ],
      ),
    );
  }
}
