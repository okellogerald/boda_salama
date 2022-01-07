import 'package:lottie/lottie.dart';
import '../source.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({required this.driver, required this.location, Key? key})
      : super(key: key);

  final Driver driver;
  final Location location;

  static void navigateTo(BuildContext context,
          {required Driver driver, required Location location}) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ChatPage(driver: driver, location: location)));

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatPageBloc bloc;
  late final TripsService tripsService;

  @override
  void initState() {
    tripsService = Provider.of<TripsService>(context, listen: false);
    bloc = ChatPageBloc(tripsService);
    bloc.init(widget.driver, widget.location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ChatPageBloc, ChatPageState>(
            listener: (_, state) {
              final isCancelled =
                  state.maybeWhen(cancelled: () => true, orElse: () => false);

              if (isCancelled) Navigator.pop(context);
            },
            bloc: bloc,
            builder: (_, state) {
              return state.when(
                loading: _buildLoading,
                content: _buildContent,
                cancelled: _buildContent,
              );
            }));
  }

  Widget _buildLoading(String message) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/icons/loading.json',
            height: 50.dh,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 15.dh),
          AppText(
            message,
            size: 18.dw,
            color: AppColors.textColor2,
          ),
          SizedBox(height: 70.dh),
          AppTextButton(
            onPressed: bloc.cancelTrip,
            text: 'Cancel',
            height: 45.dh,
            borderRadius: 5.dw,
            buttonColor: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.dw),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
              '${widget.driver.name} accepted your request and is on the way.',
              size: 18.dw),
          SizedBox(height: 20.dh),
          AppTextButton(
            onPressed: () {},
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.onPrimary,
            height: 45.dh,
            family: kFontFam2,
            borderRadius: 5.dw,
            text: 'Track the driver',
          )
        ],
      ),
    );
  }
}
