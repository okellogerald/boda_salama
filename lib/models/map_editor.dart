import '../source.dart';

part 'map_editor.freezed.dart';

@freezed
class MapEditor with _$MapEditor {
  const factory MapEditor({
    required Marker marker,
    required bool isDragging,
    required String address,
    required LatLng location,
  }) = _MapEditor;

  factory MapEditor.empty() => const MapEditor(
      marker: Marker(markerId: MarkerId('')),
      isDragging: false,
      address: '',
      location: LatLng(0, 0));
}
