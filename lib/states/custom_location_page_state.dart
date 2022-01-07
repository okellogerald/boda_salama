import 'package:boda_salama/source.dart';

part 'custom_location_page_state.freezed.dart';

@freezed
class CustomLocationPageState with _$CustomLocationPageState {
  const factory CustomLocationPageState.loading(MapEditor editor) = _Loading;
  const factory CustomLocationPageState.content(MapEditor editor) = _Content;
  const factory CustomLocationPageState.success(MapEditor editor) = _Success;

  factory CustomLocationPageState.initial() =>
      CustomLocationPageState.content(MapEditor.empty());
}
