import '../source.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .50,
        maxChildSize: .80,
        minChildSize: .1,
        builder: (context, controller) => Container(
              padding: EdgeInsets.only(top: 10.dh),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.dw),
                      topRight: Radius.circular(30.dw))),
              child: Column(
                children: [
                  const SheetOpeningTile(),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      children: [
                        Center(
                          child: AppText(
                            'Suggestions',
                            size: 22.dw,
                            color: AppColors.textColor2,
                            isBolded: true,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
