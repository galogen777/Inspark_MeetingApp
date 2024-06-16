import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project5/features/service_list/widgets/ButtonsData_Widget.dart';

import '../widgets/MeetingsData_widget.dart';
import "dart:math";



class WrapScrollViewPage extends StatelessWidget {
  const WrapScrollViewPage({super.key});

  @override
Widget build(BuildContext context) {

    final _random = new Random();
    final busyList = [true,false];
    final meetingSubjectsList = ["Обсуждение РД 1234-АСУД",
      "ДОЛБ ОКТ ЖД - ТП",
      "Переезд на участке 1-5",
      "мониторинг моста через реку Волга в районе Твери. проработка версии изменения коснтрукции моста",
      "Встреча делегации из Китая",
      "Без темы",
      "обсуждение детального графика и задач для завершения проекта строительства железной дороги",
      "разработка стратегий для оптимизации затрат и обеспечения финансирования",
      "анализ оптимальных маршрутов и обеспечение экологической устойчивости",
      "выбор лучших материалов для строительства и организация поставок",
      "оценка потенциальных рисков и разработка планов реагирования.",
      "обсуждение юридических вопросов, связанных с получением разрешений и соблюдением нормативных требований",
      "найм и обучение сотрудников для различных этапов проекта",
      "планирование закрытия проекта, включая сдачу инфраструктуры в эксплуатацию и анализ результатов",
      "поиск и управление субподрядчиками, а также координация с партнерами"
    ];

    final items = List<ListItem>.generate(
        10,
            (i) {
          var rnd = busyList[_random.nextInt(busyList.length)];
          var subject  =meetingSubjectsList[_random.nextInt(meetingSubjectsList.length)];
          return
            i % 6 == 0
                ? HeadingItem( i==0 ? 'Понедельник 13 мая':'Вторник 14 мая')
                : MessageItem('12:45-13:00',
                rnd
                    ? subject
                    : 'Свободно',
                rnd
            );
        }

    );

  //const double tileHeight = 90;
  //const double tileWidth = 90;
    //
    //


    final buttonsList = [
      ['Включить свет','assets/Lights_bulb_001_on.svg',MeetingButtonType.OnOff],
      ['Жалюзи','assets/002_blinds.svg',MeetingButtonType.IncDec],
      ['Вентиляция','assets/climate_ventilation.svg',MeetingButtonType.IncDec],
      ['Температура','assets/temperature.svg',MeetingButtonType.IncDec],
      ['ТВ панель','assets/001_Multimedia_power.svg',MeetingButtonType.OnOff],
      ['Звук','assets/001_Multimedia_volume.svg',MeetingButtonType.VUpVDown],
      ['Чай/кофе','assets/001_coffee.svg',MeetingButtonType.OnOff],
      ['Требуется уборка','assets/001_cleaning.svg',MeetingButtonType.OnOff],
      ['Помощь ИТ','assets/ITSupport.svg',MeetingButtonType.OnOff],
      ['Гостевой Wi-Fi','assets/001_wifi.svg',MeetingButtonType.OnOff],
      ['Переключить ОС','assets/winAndroid.svg',MeetingButtonType.OnOff],
      ['Навигация','assets/routing.svg',MeetingButtonType.OnOff],
      ['Ассистент','assets/voice-assistant.svg',MeetingButtonType.OnOff],
    ];
    final monitoringCardsList = [
      ['29 '+ '\u2103','assets/Climate_temperature_001_Celcius.svg',MeetingButtonType.IncDec],
      ['689 ppm','assets/co2.svg',MeetingButtonType.OnOff],
      ['45 %','assets/climate_humidity.svg'],
      ['9 человек','assets/people.svg',MeetingButtonType.IncDec],
      ['Техническая поддержка \n+7 495 911-01-01','assets/info.svg',MeetingButtonType.IncDec],
      ['Ресепшен \n+7 904 123-34-56','assets/info.svg',MeetingButtonType.OnOff],
    ];

  final buttonItems = List<Widget>.generate(
    buttonsList.length,
        (i) =>
        InkWell(
            onTap: () => {
              //Navigator.of(context).pushNamed("/test")
            },//_showToast(context), // Handle your callback
            child: Container(
              child: Stack(
                children: [
                  Ink(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                      //color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF151518),
                            Color(0xFF545353),
                          ],
                          begin: FractionalOffset(0.0, 1.0),
                          end: FractionalOffset(0.0, 0.0),
                          stops: [0.0, 0.8],
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child:  Column(
                      children: [
                       const SizedBox(
                         height: 48,
                       ),
                     Padding(
                       padding: EdgeInsets.all(6.0),
                       child: Text(
                           i<buttonsList.length
                               ? buttonsList[i][0].toString()
                               : '---',
                         textAlign: TextAlign.center,
                         style: const TextStyle(
                           fontSize: 16,
                           height: 1.1,
                           fontWeight: FontWeight.w500,
                           color: Colors.white70
                         ),
                       ),
                     ),
                     if (i<buttonsList.length && buttonsList[i][2]==MeetingButtonType.IncDec)
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           TextButton(
                             style: TextButton.styleFrom(
                               foregroundColor: Colors.white,
                               padding: const EdgeInsets.only(left: 1),
                               textStyle: const TextStyle(fontSize: 20),
                             ),
                             onPressed: () {},
                             child: SvgPicture.asset(
                               'assets/arrows_up.svg',
                               height: 10,
                               width: 10,
                               colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                             )
                           ),

                           TextButton(
                               style: TextButton.styleFrom(
                                 foregroundColor: Colors.white,
                                 padding: const EdgeInsets.only(left: 1),
                                 textStyle: const TextStyle(fontSize: 20),
                               ),
                               onPressed: () {},
                               child: SvgPicture.asset(
                                 'assets/arrows_down.svg',
                                 height: 10,
                                 width: 10,
                                 colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                               )
                           ),

                         ]
                        ),
                        if (i<buttonsList.length && buttonsList[i][2]==MeetingButtonType.VUpVDown)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.only(left: 1),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: SvgPicture.asset(
                                      'assets/001_speakerUp.svg',
                                      height: 30,
                                      width: 30,
                                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                    )
                                ),

                                TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.only(left: 1),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {},
                                    child: SvgPicture.asset(
                                      'assets/001_speakerDown.svg',
                                      height: 30,
                                      width: 30,
                                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                    )
                                ),

                              ]
                          )

                   ],
                  ),
                ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: SvgPicture.asset(
                                 i<buttonsList.length
                                     ? buttonsList[i][1].toString()
                                 : 'assets/System_undefined.svg',
                              height: 35,
                              width: 35,
                              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                             ),
                           ),
                      ])
                    ],
                  )
                ] //Stack children
              ),
            )),
  );

  return Scaffold(
    //appBar: AppBar(title: const Text('SingleChildScrollView + Wrap')),
    appBar: AppBar(
        title: const Text( //заголовок
          'Переговорная Бештау (544)',
          style: TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Container(
            child: Row( //Название переговорки и время в городах
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 160.0,
                    child: const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Москва",style: TextStyle(fontSize: 20,color: Colors.white70),)]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("17:56",style: TextStyle(fontSize: 18,color: Colors.white70),)]
                      )],
                    ),
                  ),
                  Container(width: 160.0,
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Новосибирск",style: TextStyle(fontSize: 20,color: Colors.white70),)]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("19:56",style: TextStyle(fontSize: 18,color: Colors.white70),)]
                        )],
                    ),
                  ),
                  Container(width: 160.0,
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Иркутск",style: TextStyle(fontSize: 20,color: Colors.white70),)]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("22:56",style: TextStyle(fontSize: 18,color: Colors.white70),)]
                        )],
                    ),
                  ),
              ],
            ),
          )
        ]
    ),

    body:  SafeArea(

      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible( //левая часть основного окна
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(right:5.0),
                color: Colors.black87,
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 20,bottom: 20),
                  itemCount: monitoringCardsList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) => ListTile(
                      //title: Text("List 1: $i"),
                      textColor: Colors.white,
                    leading: SvgPicture.asset(
                        i<monitoringCardsList.length
                    ? monitoringCardsList[i][1].toString()
                        : 'assets/System_undefined.svg',
                    colorFilter:ColorFilter.mode(Colors.white70, BlendMode.srcIn) ,
                    height: 90,
                    width: 90,
                  ),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                        i<monitoringCardsList.length
                            ? monitoringCardsList[i][0].toString()
                            : '---',
                        textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20
                      )
                    ),
                ), separatorBuilder: (context, index) => SizedBox(
                  height: 24,
                ),
                ),
              ),
            ),
            Flexible(//центральная область
              flex:7,
              child: GridView.count(
                  primary: false,
                  shrinkWrap: true, //false сверху
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                  crossAxisCount:MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 5,
                  physics: const ScrollPhysics(),
                  children: buttonItems.map((i) => i).toList()
              ),
            ),
            Flexible( //Сведения о встречах
              flex: 3, //вино, 5 букв, погоризонтали
              child: Container(
                margin: new EdgeInsets.only(left:5.0),
                color: Colors.black87,
                child: ListView.separated(
                  itemCount: items.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider(height: 0);
                  },

                  itemBuilder: (context, index) {

                    final item = items[index];

                    return ListTile(

                      title: item.buildTitle(context),
                      subtitle: item.buildSubtitle(context),
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black87,
      selectedItemColor: Colors.white70,
      unselectedItemColor: Colors.white30,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Badge(child: Icon(Icons.notifications_sharp)),
          label: 'Уведомления',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          label: 'Настройки',
        ),
      ],
      currentIndex: 0,
      //onTap: _onItemTapped,
    ),
  );
}
}