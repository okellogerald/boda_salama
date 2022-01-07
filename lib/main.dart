import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as directory;
import 'app.dart';
import 'source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _directory = await directory.getApplicationDocumentsDirectory();

  Hive.init(_directory.path);
  Hive.registerAdapter(TripAdapter());
  await Hive.openBox(kTripDetailsBox);

  final myApp = MultiProvider(
    providers: [
      Provider<LocationService>(create: (_) => LocationService()),
      Provider<PlacesService>(create: (_) => PlacesService()),
      Provider<TripsService>(create: (_) => TripsService()),
    ],
    child: const MyApp(),
  );
  runApp(myApp);
}
