import '../features/service_list/view/view.dart';


final routes = {
  '/': (context) =>const WrapScrollViewPage(),
  //const MainPageListScreen(title: 'Мое первое приложение'),
  '/service': (context) => const ServiceListScreen(),
  '/test': (context) => const WrapScrollViewPage(),

};