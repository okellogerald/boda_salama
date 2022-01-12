import '../source.dart';

class OnDriverAppDriverProfilePage extends StatelessWidget {
  const OnDriverAppDriverProfilePage(this.driver, {Key? key}) : super(key: key);

  final Driver driver;

  static void navigateTo(BuildContext context, Driver driver) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => OnDriverAppDriverProfilePage(driver)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        // padding: EdgeInsets.only(top: 20.dh),
        children: [
          _buildTitle(),
          _buildTaxStatus(),
          const Compliments(),
          _buildAccountInformation(),
          SizedBox(height: 20.dh),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        title: AppText(
          'Profile Page',
          size: 18.dw,
          color: AppColors.onPrimary,
          isBolded: true,
        ));
  }

  _buildTitle() {
    return Container(
      color: Colors.white,
      //margin: EdgeInsets.only(bottom: 10.dh),
      padding: EdgeInsets.symmetric(vertical: 20.dh, horizontal: 15.dw),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.dw,
            backgroundImage: NetworkImage(driver.image),
          ),
          SizedBox(height: 8.dh),
          AppText(
            driver.name,
            size: 22.dw,
          ),
          AppText(
            '( since 2019 )',
            size: 16.dw,
            color: AppColors.textColor2,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.dh),
            padding: EdgeInsets.symmetric(vertical: 10.dh),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                _buildTitleValue('Rating', driver.rating.toString()),
                _buildTitleValue('# of trips', '220', withBorders: true),
                _buildTitleValue('Total Earnings', '3,500,000 /='),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildTitleValue(String valueTitle, String value,
      {bool withBorders = false}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.symmetric(
                vertical: BorderSide(
          width: withBorders ? 2 : 0,
          color: withBorders ? AppColors.dividerColor : Colors.transparent,
        ))),
        child: Column(
          children: [
            AppText(valueTitle, size: 16.dw, color: AppColors.textColor),
            SizedBox(height: 5.dh),
            AppText(
              value,
              size: 16.dw,
              isBolded: true,
              color: AppColors.textColor2,
            ),
          ],
        ),
      ),
    );
  }

  _sectionTitleContainer({required Widget child, double? bottomPadding}) {
    return Container(
      padding: EdgeInsets.only(bottom: 8.dh),
      margin: EdgeInsets.only(top: 15.dh, bottom: bottomPadding ?? 12.dh),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.5, color: Colors.grey))),
      child: child,
    );
  }

  _buildSectionTitle(String title) => AppText(title, size: 18.dw);

  _buildAccountInformation() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20.dh),
      padding: EdgeInsets.symmetric(vertical: 10.dh, horizontal: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitleContainer(
            bottomPadding: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionTitle('Account Information'),
                AppTextButton(
                  onPressed: () {},
                  text: 'Edit',
                  textColor: AppColors.primaryColor,
                  borderRadius: 0,
                )
              ],
            ),
          ),
          _buildAccountInformationList(),
        ],
      ),
    );
  }

  _buildAccountInformationList() {
    return Column(
      children: [
        _buildAccountInfo('Username', driver.name),
        _buildAccountInfo('Phone Number', '+255 765 435 561'),
        _buildAccountInfo('Email',
            '${driver.name.replaceAll(' ', '').toLowerCase()}@gmail.com'),
        _buildAccountInfo('Gender', 'Male'),
        _buildAccountInfo('Age', driver.age.toString()),
      ],
    );
  }

  _buildAccountInfo(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(top: 15.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(title, size: 16.dw, color: AppColors.textColor),
          AppText(value, color: AppColors.textColor2, size: 16.dw),
        ],
      ),
    );
  }

  _buildTaxStatus() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20.dh),
      padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 15.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitleContainer(
                child: Row(
                  children: [
                    _buildSectionTitle('Tax-paying status'),
                    SizedBox(width: 15.dw),
                    AppText(
                      '( Active )',
                      size: 14.dw,
                      color: AppColors.accentColor,
                      isBolded: true,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Total amount paid',
                    size: 16.dw,
                    color: AppColors.textColor,
                  ),
                  SizedBox(height: 5.dh),
                  AppText(
                    '480,000 /= Tzs',
                    size: 16.dw,
                    color: AppColors.textColor2,
                    isBolded: true,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
