import 'source.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenSizeInit(
      designSize: const Size(411.4, 866.3),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: AppColors.backgroundColor,
          fontFamily: 'SK Payidar',
        ),
        home: const HomePage(),
      ),
    );
  }
}
