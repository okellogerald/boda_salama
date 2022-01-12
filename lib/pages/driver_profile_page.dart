import '../source.dart';

class DriverProfilePage extends StatelessWidget {
  const DriverProfilePage(this.driver, {required this.userLocation, Key? key})
      : super(key: key);

  final Driver driver;
  final Location userLocation;

  static void navigateTo(
          BuildContext context, Driver driver, Location userLocation) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DriverProfilePage(
                driver,
                userLocation: userLocation,
              )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: _buildAppBar(),
      body: ListView(children: [
        _buildImages(),
        _buildTitle(),
        const Compliments(),
        _buildTaxStatus(),
        _buildReviewsList(),
        SizedBox(height: 80.dh),
      ]),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  _buildAppBar() {
    return AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        title: AppText(
          'Driver\'s Profile Page',
          size: 18.dw,
          color: AppColors.onPrimary,
          isBolded: true,
        ));
  }

  _buildFloatingButton() {
    return Builder(builder: (context) {
      return AppTextButton(
          onPressed: () => ChatPage.navigateTo(context,
              driver: driver, location: userLocation),
          text: 'Select Driver',
          height: 45.dh,
          buttonColor: AppColors.primaryColor,
          textColor: AppColors.onPrimary,
          margin: EdgeInsets.only(left: 30.dw));
    });
  }

  _buildImages() {
    return Container(
      height: 230.dh,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: .85,
              child: Container(
                height: 175.dh,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://images.pexels.com/photos/819805/pexels-photo-819805.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'))),
              ),
            ),
          ),
          CircleAvatar(
            radius: 75.dh,
            backgroundImage: NetworkImage(driver.image),
            backgroundColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }

  _buildTitle() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20.dh),
      // margin: EdgeInsets.only(top: 20.dh),
      child: Column(
        children: [
          AppText(
            driver.name,
            isBolded: true,
            size: 22.dw,
          ),
          AppText(
            '( since 2019 )',
            size: 16.dw,
            color: AppColors.textColor2,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.dh, left: 15.dw, right: 15.dw),
            padding: EdgeInsets.symmetric(vertical: 10.dh),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                _buildTitleValue('# of trips', '220'),
                _buildTitleValue('License plate', 'CGK120GHP',
                    withBorders: true),
                _buildTitleValue('Rating', driver.rating.toString()),
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
            AppText(valueTitle, size: 16.dw),
            SizedBox(height: 5.dh),
            AppText(
              value,
              size: 14.dw,
              color: AppColors.textColor2,
              isBolded: true,
            ),
          ],
        ),
      ),
    );
  }

  _buildTaxStatus() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15.dw, 0.dh, 15.dw, 15.dh),
      margin: EdgeInsets.only(top: 20.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Tax-paying status'),
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.dw, vertical: 5.dw),
                    color: Colors.grey.shade200,
                    child: AppText(
                      'Active',
                      size: 14.dw,
                      isBolded: true,
                      color: AppColors.accentColor,
                    ),
                  ),
                  SizedBox(width: 20.dw),
                  Expanded(
                    child: AppText(
                      'Excellent tax payer. Never missed a single payment.',
                      size: 14.dw,
                      color: AppColors.textColor2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildReviewsList() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15.dw, 0, 15.dw, 0.dh),
      margin: EdgeInsets.only(top: 20.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Reviews'),
          _buildReview(
            'https://cdn1.iconfinder.com/data/icons/user-pictures/100/boy-128.png',
            'Calvin James',
            '01-01-2021',
            kReview1,
            4.5,
          ),
          _buildReview(
            'https://cdn0.iconfinder.com/data/icons/user-pictures/100/matureman2-128.png',
            'Derrick Mason',
            '20-12-2021',
            kReview2,
            5.0,
          ),
          _buildReview(
            'https://cdn0.iconfinder.com/data/icons/user-pictures/100/maturewoman-3-128.png',
            'Brenda Michael',
            '20-12-2021',
            kReview3,
            0.0,
          ),
        ],
      ),
    );
  }

  _buildReview(
      String image, String name, String date, String review, double rating) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.dh),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.dw,
                    backgroundImage: NetworkImage(image),
                  ),
                  SizedBox(width: 15.dw),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(name, size: 16.dw),
                      AppText(date, size: 14.dw)
                    ],
                  ),
                ],
              ),
              RatingStars(rating),
            ],
          ),
          AppText(
            review,
            size: 14.dw,
            color: AppColors.textColor2,
          )
        ],
      ),
    );
  }

  _buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 15.dh, bottom: 12.dh),
      padding: EdgeInsets.only(bottom: 8.dh),
      width: ScreenSizeConfig.getFullWidth,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 1.5))),
      child: AppText(
        title,
        size: 18.dw,
        color: AppColors.textColor,
      ),
    );
  }
}
