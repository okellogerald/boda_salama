import '../source.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.dw,
      width: 10.dw,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.accentColor,
      ),
    );
  }
}
