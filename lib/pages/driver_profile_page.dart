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
      body: ListView(children: [
        _buildImages(),
        _buildTitle(),
        _buildDriverCompliments(),
        _buildTaxStatus(),
        _buildReviewsList(),
      ]),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  _buildFloatingButton() {
    return Builder(builder: (context) {
      return AppTextButton(
          onPressed: () => ChatPage.navigateTo(context,
              driver: driver, location: userLocation),
          text: 'Select driver',
          height: 45.dh,
          buttonColor: AppColors.primaryColor,
          textColor: AppColors.onPrimary,
          borderRadius: 5.dw,
          margin: EdgeInsets.only(left: 30.dw));
    });
  }

  _buildImages() {
    return SizedBox(
      height: 230.dh,
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: .85,
                  child: Container(
                    height: 175.dh,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.pexels.com/photos/819805/pexels-photo-819805.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'))),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 75.dh,
                backgroundImage: NetworkImage(driver.image),
              ),
            ],
          ),
          Positioned(
            left: 15.dw,
            top: 10.dh,
            child: Builder(builder: (context) {
              return AppIconButton(
                onPressed: () => Navigator.pop(context),
                buttonColor: AppColors.secondaryColor,
                iconColor: AppColors.onPrimary,
                icon: Icons.arrow_back,
                size: 35.dw,
              );
            }),
          ),
        ],
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.dh),
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
            padding: EdgeInsets.symmetric(vertical: 5.dh),
            decoration: const BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(width: 2))),
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
            AppText(
              valueTitle,
              size: 16.dw,
              isBolded: true,
            ),
            SizedBox(height: 5.dh),
            AppText(
              value,
              size: 16.dw,
              color: AppColors.textColor2,
            ),
          ],
        ),
      ),
    );
  }

  _buildDriverCompliments() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.dh),
          _buildSectionTitle('Driver Compliments'),
          _buildComplimentList(),
        ],
      ),
    );
  }

  _buildComplimentList() {
    return Column(
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

  _buildTaxStatus() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.dw, 20.dh, 15.dw, 10.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Tax-paying status'),
              SizedBox(height: 5.dh),
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
                  SizedBox(width: 10.dw),
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.dh),
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
          SizedBox(height: 80.dh),
        ],
      ),
    );
  }

  _buildReview(
      String image, String name, String date, String review, double rating) {
    return Padding(
      padding: EdgeInsets.only(top: 15.dh),
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
                      AppText(
                        name,
                        size: 16.dw,
                        isBolded: true,
                      ),
                      AppText(
                        date,
                        size: 14.dw,
                      )
                    ],
                  ),
                ],
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.dw, vertical: 5.dw),
                color: Colors.grey.shade200,
                child: AppText(
                  rating.toString(),
                  size: 14.dw,
                  isBolded: true,
                  color: AppColors.accentColor,
                ),
              )
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
    return AppText(title,
        size: 20.dw, color: AppColors.textColor2, isBolded: true);
  }
}
