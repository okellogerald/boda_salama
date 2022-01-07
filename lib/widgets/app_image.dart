import 'package:cached_network_image/cached_network_image.dart';
import '../source.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final double width, height;
  final double? radius, size;
  final bool withBorders;
  final Color placeholderColor;

  const AppImage(
      {Key? key,
      required this.imageUrl,
      this.radius,
      this.placeholderColor = AppColors.primaryColor,
      this.height = 180,
      this.withBorders = false,
      this.size,
      this.width = 300})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _child();
  }

  _child() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 7.dw)),
      child: CachedNetworkImage(
        width: size ?? width,
        height: size ?? height,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, __) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: placeholderColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(radius ?? 7.dw))),
            child: Icon(Icons.image, size: 25.dw, color: Colors.white)),
      ),
    );
  }
}
