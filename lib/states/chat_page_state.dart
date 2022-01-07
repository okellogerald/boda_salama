import 'package:boda_salama/source.dart';

part 'chat_page_state.freezed.dart';

@freezed
class ChatPageState with _$ChatPageState {
  const factory ChatPageState.loading(String message) = _Loading;
  const factory ChatPageState.content() = _Content;
  const factory ChatPageState.cancelled() = _Cancelled;
}
