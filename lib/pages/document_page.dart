import '../source.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage(this.dataFieldList, this.topBannerMessage, this.title,
      {Key? key})
      : super(key: key);

  final List<Widget> dataFieldList;
  final String topBannerMessage, title;

  static void navigateTo(BuildContext context,
          {required List<Widget> dataFieldList,
          required String bannerMessage,
          required String title}) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  DocumentPage(dataFieldList, bannerMessage, title)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10.dh),
        children: [
          _buildTopBanner(),
          Column(
            children: dataFieldList,
          )
        ],
      ),
    );
  }

  _buildTopBanner() {
    return Material(
        color: AppColors.errorColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.dw, vertical: 15.dh),
          child: AppText(
            topBannerMessage,
            size: 15.dw,
            color: AppColors.onPrimary,
            alignment: TextAlign.start,
          ),
        ));
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: AppText(
        title,
        size: 18.dw,
        color: AppColors.onPrimary,
        isBolded: true,
      ),
      actions: [
        AppIconButton(
          onPressed: () {},
          icon: Icons.edit_outlined,
          iconColor: AppColors.onPrimary2,
          size: 45.dw,
          iconSize: 25.dw,
        )
      ],
    );
  }
}
