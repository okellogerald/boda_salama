import '../source.dart';

class DataField extends StatelessWidget {
  const DataField({required this.title, required this.value, Key? key})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.dh, left: 15.dw, right: 15.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(title, size: 16.dw, color: AppColors.textColor2),
          Container(
            color: Colors.grey.shade200,
            width: ScreenSizeConfig.getFullWidth,
            padding: EdgeInsets.symmetric(horizontal: 10.dw, vertical: 5.dh),
            child: AppText(
              value,
              size: 16.dw,
              isBolded: true,
            ),
          )
        ],
      ),
    );
  }
}
