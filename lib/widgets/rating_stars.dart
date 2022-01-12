import '../source.dart';

class RatingStars extends StatelessWidget {
  const RatingStars(this.rating, {Key? key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    final int _index = rating.round();

    return SizedBox(
        width: 120.dw,
        height: 20.dh,
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 5.dw),
              child: Icon(
                _index != rating.toInt()
                    ? index < _index - 1
                        ? Icons.star
                        : index == _index - 1
                            ? Icons.star_half
                            : Icons.star_outline
                    : index <= _index - 1
                        ? Icons.star
                        : Icons.star_outline,
                size: 18.dw,
                color: AppColors.accentColor,
              ),
            );
          },
        ));
  }
}
