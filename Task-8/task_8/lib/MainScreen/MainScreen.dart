import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double wigthOfScreen = MediaQuery.of(context).size.width;
    final double heigthOfScreen = MediaQuery.of(context).size.height;
    const image = AssetImage('assets/aboutMe.jpg');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          Container(
            height: heigthOfScreen,
            width: wigthOfScreen,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 221, 161, 94)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: wigthOfScreen,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 40, 54, 24),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(85))),
                    padding: const EdgeInsetsDirectional.all(10),
                    child: Row(children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(75.0),
                          child: const Image(
                            image: image,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Гусаров\nФаддей\nГригорьевич',
                        style: TextStyle(
                            fontFamily: 'NeuePixelSans',
                            color: Colors.white,
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('О себе',
                        style: TextStyle(
                            fontFamily: 'saniretro-cyrillic',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: wigthOfScreen,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 40, 54, 24),
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(85))),
                        padding: const EdgeInsetsDirectional.all(10),
                        child: const Text(
                            'Привет, меня зовут Фаддей, 29-ти лет отроду. Живу в городе Ижевск - оружейной столице России.\nРаботаю уже 11-й год в ночных клубах города за барной стойкой, так что стрессоустойчивость - это про меня. Совсем недавно завел собаку породы Кеесхонд(советую погуглить) по кличке Степка. Так же имею супертолстого и пушистого кота Василия. Ах да, еще счастливо женат.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'saniretro-cyrillic',
                                color: Colors.white,
                                fontSize: 20)),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Увлечения',
                        style: TextStyle(
                            fontFamily: 'saniretro-cyrillic',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                          width: wigthOfScreen,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 40, 54, 24),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(85))),
                          padding: const EdgeInsetsDirectional.all(10),
                          child: const Text(
                              ' В данный момент увлечен мобильной разработкой, тк в планах в ближайший год изменить вид деятельности.\nТак же, люблю компьютерные игы, в частности ретро-гейминт.\nЛюблю автомобили, их устройство и историю.',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'pixelcyr_normal',
                                  color: Colors.white,
                                  fontSize: 15))),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Опыт в разработке',
                        style: TextStyle(
                            fontFamily: 'saniretro-cyrillic',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                          width: wigthOfScreen,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 40, 54, 24),
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(85))),
                          padding: const EdgeInsetsDirectional.all(10),
                          child: const Text(
                              'Имею полуторагодовалый опыт IOS-разработки, полгода из него - коммерческий. Так же прошел стажировку на место ручного тестировщика, но понял, что тестирование - это не мое.',
                              style: TextStyle(
                                  fontFamily: 'NeuePixelSans',
                                  color: Colors.white,
                                  fontSize: 15))),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: -15,
            bottom: 95,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: SvgPicture.asset(
                  'assets/Fighter.svg',
                  height: 150,
                  width: 300,
                )),
          ),
          Positioned(
            left: 5,
            top: 455,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: SvgPicture.asset(
                  'assets/game-console-pacman-svgrepo-com.svg',
                  height: 80,
                  width: 80,
                )),
          ),
          Positioned(
            right: 0,
            top: 220,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: SvgPicture.asset(
                  'assets/game-console-svgrepo-com.svg',
                  height: 80,
                  width: 80,
                )),
          ),
        ]),
      ),
    );
  }
}
