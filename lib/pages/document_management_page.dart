import '../source.dart';

class DocumentManagement extends StatelessWidget {
  const DocumentManagement(this.driver, {Key? key}) : super(key: key);

  final Driver driver;

  static MaterialPageRoute route(Driver driver) =>
      MaterialPageRoute(builder: (_) => DocumentManagement(driver));

  static void navigateTo(BuildContext context, Driver driver) =>
      Navigator.push(context, route(driver));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: EdgeInsets.only(top: 8.dh),
          child: Column(
            children: [
              _buildCard(
                'Driver\'s Licence',
                driver.image,
                _driverLicenseDetails(),
                () => licenseOnPressed(context),
              ),
              _buildCard('TIN Certificate', kTRALogo, _tinCertificateDetails(),
                  () => tinOnPressed(context)),
            ],
          ),
        ));
  }

  List<Widget> _driverLicenseDetails() => [
        _buildCardDetails('Name', driver.name),
        _buildCardDetails('License Number', '4000099896'),
      ];

  List<Widget> _tinCertificateDetails() => [
        _buildCardDetails('Name', driver.name),
        _buildCardDetails('TIN Number', '135-000-123'),
      ];

  _buildAppBar() {
    return AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        title: AppText(
          'Document Management',
          size: 18.dw,
          color: AppColors.onPrimary,
          isBolded: true,
        ));
  }

  _buildCard(String title, String image, List<Widget> children,
      VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.dh, left: 15.dw, right: 15.dw),
      child: Material(
        color: Colors.grey.shade200,
        elevation: 2.0,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: 15.dw, top: 10.dh, bottom: 10.dh, right: 15.dw),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title.toUpperCase(), isBolded: true, size: 18.dw),
              SizedBox(height: 5.dh),
              Row(
                children: [
                  AppImage(
                      imageUrl: image,
                      width: 120.dw,
                      height: 100.dw,
                      radius: 0),
                  SizedBox(width: 20.dw),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  )
                ],
              ),
              AppTextButton(
                onPressed: onPressed,
                text: 'View Details',
                margin: EdgeInsets.only(top: 10.dh),
                height: 40.dh,
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.onPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardDetails(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(title, size: 16.dw, color: AppColors.textColor2),
        AppText(value, size: 16.dw, isBolded: true)
      ],
    );
  }

  void tinOnPressed(BuildContext context) => DocumentPage.navigateTo(context,
      dataFieldList: driverLicenseDataFieldList(),
      title: 'TIN Certificate',
      bannerMessage: 'You have 2 unpaid payments.');

  void licenseOnPressed(BuildContext context) => DocumentPage.navigateTo(
      context,
      dataFieldList: tinCertificateDataFieldList(),
      title: 'Driver\'s License',
      bannerMessage: 'There are 5 accidents registered under this license.');

  List<Widget> driverLicenseDataFieldList() {
    return [
      DataField(title: 'Full Name', value: driver.name),
      const DataField(title: 'Date of birth', value: '25-07-2021'),
      const DataField(title: 'License Number', value: "40000998765"),
      const DataField(
          title: 'Issuing Authority',
          value: 'TANZANIA REVENUE AUTHORITY (TRA)'),
      const DataField(title: 'Date of issue', value: "25-10-2022"),
      const DataField(title: 'Date of expiry', value: '25-07-2021'),
      const DataField(title: 'Vehicle Categories', value: 'C1 C2 D E'),
    ];
  }

  List<Widget> tinCertificateDataFieldList() {
    return [
      DataField(title: 'Business name', value: driver.name),
      const DataField(title: 'TIN Number', value: "135-000-123"),
      const DataField(
          title: 'Issuing Authority',
          value: 'TANZANIA REVENUE AUTHORITY (TRA)'),
      const DataField(title: 'Date of issue', value: "25-10-2022"),
    ];
  }
}
