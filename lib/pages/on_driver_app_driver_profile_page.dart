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
      body: ListView(
        padding: EdgeInsets.only(top: 20.dh),
        children: [
          _buildTitle(),
          _buildTaxStatus(),
          _buildDriverCompliments(),
          _buildAccountInformation(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: AppText(
          'Profile',
          size: 18.dw,
          color: AppColors.onPrimary,
          isBolded: true,
        ));
  }

  _buildTitle() {
    return Column(
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
          padding: EdgeInsets.symmetric(vertical: 8.dh),
          color: AppColors.secondaryColor,
          child: Row(
            children: [
              _buildTitleValue('Rating', driver.rating.toString()),
              _buildTitleValue('# of trips', '220', withBorders: true),
              _buildTitleValue('Total Earnings', '3,500,000 /='),
            ],
          ),
        )
      ],
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
            AppText(valueTitle, size: 16.dw, color: AppColors.onPrimary),
            SizedBox(height: 5.dh),
            AppText(
              value,
              size: 16.dw,
              isBolded: true,
              color: AppColors.onPrimary2,
            ),
          ],
        ),
      ),
    );
  }

  _buildDriverCompliments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.dh),
        _buildSectionTitle('Compliments'),
        _buildComplimentList(),
      ],
    );
  }

  _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 15.dw),
      child: AppText(
        title,
        isBolded: true,
      ),
    );
  }

  _buildComplimentList() {
    return Padding(
      padding: EdgeInsets.only(left: 15.dw),
      child: Column(
        children: [
          _buildCompliment(
              'https://cdn4.iconfinder.com/data/icons/basic-ui-2-line/32/word-balloon-speak-chat-conversation-128.png',
              'Great Conversation',
              35),
          _buildCompliment(
              'https://cdn3.iconfinder.com/data/icons/pandemic-solid-keep-healthy-routine/512/Alcohol_gel-128.png',
              'Clean & Neat',
              18),
          _buildCompliment(
              'https://cdn0.iconfinder.com/data/icons/sport-and-fitness-1/32/Sports_and_Fitness_helmet_rugby_football-128.png',
              'Safe Driver',
              20),
          _buildCompliment(
              'https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/like-128.png',
              'Nice Experience',
              35),
          _buildCompliment(
              'https://cdn0.iconfinder.com/data/icons/business-management-2-14/256/b-98-128.png',
              'Timely Pickup',
              22),
        ],
      ),
    );
  }

  _buildCompliment(String image, String title, int count) {
    return Padding(
      padding: EdgeInsets.only(top: 8.dw),
      child: Row(
        children: [
          AppImage(imageUrl: image, size: 50.dw),
          SizedBox(width: 20.dw),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title, size: 14.dw, isBolded: true),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.dw, vertical: 3.dw),
                color: Colors.grey.shade300,
                child: AppText('x $count', size: 12.dw, isBolded: true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildAccountInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.dh),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Account Information'),
            AppTextButton(
              onPressed: () {},
              text: 'Edit',
              textColor: AppColors.primaryColor,
              margin: EdgeInsets.only(right: 15.dw),
            )
          ],
        ),
        _buildAccountInformationList(),
        SizedBox(height: 20.dh),
      ],
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
      padding: EdgeInsets.symmetric(horizontal: 15.dw, vertical: 5.dh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            title,
            size: 16.dw,
            color: AppColors.textColor2,
            isBolded: true,
          ),
          AppText(value, color: AppColors.textColor2, size: 16.dw),
        ],
      ),
    );
  }

  _buildTaxStatus() {
    return Padding(
      padding: EdgeInsets.only(top: 20.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildSectionTitle('Tax-paying status'),
                  SizedBox(width: 10.dw),
                  AppText(
                    '( Active )',
                    size: 14.dw,
                    color: AppColors.accentColor,
                    isBolded: true,
                  ),
                ],
              ),
              SizedBox(height: 5.dh),
              Padding(
                padding: EdgeInsets.only(left: 15.dw),
                child: Column(
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
