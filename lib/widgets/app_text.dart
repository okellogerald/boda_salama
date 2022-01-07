import '../source.dart';

class AppText extends StatelessWidget {
  const AppText(this.data,
      {this.size,
      this.family,
      this.color,
      this.alignment = TextAlign.justify,
      this.isBolded = false,
      this.weight,
      this.maxLines,
      this.height,
      this.letterSpacing,
      key})
      : super(key: key);

  final double? size;
  final int? maxLines;
  final bool isBolded;
  final String data;
  final String? family;
  final Color? color;
  final TextAlign alignment;
  final FontWeight? weight;
  final double? height, letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(data,
        textAlign: alignment,
        maxLines: maxLines ?? 10,
        style: TextStyle(
            fontWeight:
                weight ?? (isBolded ? FontWeight.w600 : FontWeight.w400),
            fontSize: size ?? 20.dw,
            color: color ?? AppColors.textColor,
            fontFamily: family,
            height: height,
            letterSpacing: letterSpacing,
            overflow: TextOverflow.ellipsis));
  }
}
