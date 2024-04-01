import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_8/MainScreen/Widgets/ColorContainer.dart';
import 'package:task_8/MyColors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final double widthOfScreen = MediaQuery.of(context).size.width;
    final double heigthOfScreen = MediaQuery.of(context).size.height;

    const image = AssetImage('assets/aboutMe.jpg');

    const textName = 'Гусаров\nФаддей\nГригорьевич';
    const textAboutMe =
        'Привет, меня зовут Фаддей, 29-ти лет отроду. Живу в городе Ижевск - оружейной столице России.\nРаботаю уже 11-й год в ночных клубах города за барной стойкой, так что стрессоустойчивость - это про меня. Совсем недавно завел собаку породы Кеесхонд(советую погуглить) по кличке Степка. Так же имею супертолстого и пушистого кота Василия. Ах да, еще счастливо женат.';
    const textHobby =
        ' В данный момент увлечен мобильной разработкой, тк в планах в ближайший год изменить вид деятельности.\nТак же, люблю компьютерные игы, в частности ретро-гейминт.\nЛюблю автомобили, их устройство и историю.';
    const textExperience =
        'Имею полуторагодовалый опыт IOS-разработки, полгода из него - коммерческий. Так же прошел стажировку на место ручного тестировщика, но понял, что тестирование - это не мое.';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            Container(
              width: widthOfScreen,
              height: heigthOfScreen,
              decoration: BoxDecoration(
                color: AppColors().backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: ColorContainer.leftWithImage(
                        width: widthOfScreen,
                        text: textName,
                        font: 'NeuePixelSans',
                        image: image),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'О себе',
                        style: TextStyle(
                            fontFamily: 'saniretro-cyrillic',
                            color: AppColors().blackTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ColorContainer.right(
                            width: widthOfScreen,
                            text: textAboutMe,
                            font: 'saniretro-cyrillic'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Увлечения',
                        style: TextStyle(
                            fontFamily: 'saniretro-cyrillic',
                            color: AppColors().blackTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ColorContainer.left(
                            width: widthOfScreen,
                            text: textHobby,
                            font: 'pixelcyr_normal'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Опыт в разработке',
                          style: TextStyle(
                              fontFamily: 'saniretro-cyrillic',
                              color: AppColors().blackTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ColorContainer.right(
                            width: widthOfScreen,
                            text: textExperience,
                            font: 'NeuePixelSans'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: -15,
              bottom: 125,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: SvgPicture.asset(
                  'assets/Fighter.svg',
                  height: 150,
                  width: 300,
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 415,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: SvgPicture.asset(
                  'assets/game-console-pacman-svgrepo-com.svg',
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 240,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(15 / 360),
                child: SvgPicture.asset(
                  'assets/game-console-svgrepo-com.svg',
                  height: 80,
                  width: 80,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
