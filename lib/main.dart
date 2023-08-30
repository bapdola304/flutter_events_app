import 'package:events_app/constants.dart';
import 'package:events_app/cubit/events_cubit.dart';
import 'package:events_app/repository/events_repository.dart';
import 'package:events_app/screens/favourites.dart';
import 'package:events_app/screens/home.dart';
import 'package:events_app/screens/profile.dart';
import 'package:events_app/screens/search.dart';
import 'package:events_app/screens/tickets.dart';
import 'package:events_app/services/event_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EventsCubit>(
          create: (BuildContext context) =>
              EventsCubit(EventRepository(apiService: ApiService())),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List tabs = [
    const Home(),
    const Search(),
    const Tickets(),
    const Favourites(),
    const Profile()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF2F2F2),
        selectedItemColor: const Color(0xFF333538),
        unselectedItemColor: const Color(0xFFBDBDBD),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'a'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'b'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined), label: 'c'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_outlined), label: 'profile')
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (value) => {
          setState(() {
            _selectedIndex = value;
          })
        },
      ),
    );
  }
}
