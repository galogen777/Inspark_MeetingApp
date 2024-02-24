import '../features/service_list/view/view.dart';
import '../main.dart';

final routes = {
  '/': (context) =>
  const MainPageListScreen(title: 'Мое первое приложение'),
  '/service': (context) => const ServiceListScreen(),
  '/test': (context) => const WrapScrollViewPage(),

};