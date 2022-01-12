import '../source.dart';

class Compliments extends StatelessWidget {
  const Compliments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      margin: EdgeInsets.only(top: 20.dh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Driver Compliments'),
          _buildComplimentList(),
        ],
      ),
    );
  }

  _buildSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 15.dh, bottom: 0.dh),
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

  _buildComplimentList() {
    return Column(
      children: [
        _buildCompliment(
            Icons.question_answer_outlined, 'Great Conversation', 35),
        _buildCompliment(Icons.sanitizer_outlined, 'Clean & Neat', 18),
        _buildCompliment(Icons.sports_motorsports_outlined, 'Safe Driver', 20),
        _buildCompliment(Icons.recommend_outlined, 'Nice Experience', 35),
        _buildCompliment(Icons.timer, 'Timely Pickup', 22),
      ],
    );
  }

  _buildCompliment(IconData icon, String title, int count) {
    return ListTile(
      leading: Icon(icon),
      title: AppText(title, size: 15.dw),
      trailing: AppText('x $count', size: 15.dw),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 5.dw,
      dense: true,
    );
  }
}
