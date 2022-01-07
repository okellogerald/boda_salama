import '../source.dart';

class SheetOpeningTile extends StatelessWidget {
  const SheetOpeningTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40.dw,
        height: 4.dw,
        margin: EdgeInsets.only(bottom: 20.dh),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.35),
            borderRadius: BorderRadius.all(Radius.circular(2.dw))),
      ),
    );
  }
}
