import 'package:surf_dart_courses_template/surf_dart_courses_template.dart'
    as surf_dart_courses_template;

enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  /// Переопределяем оператор "==", чтобы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    return identical(this, other) ||
        (other is AgriculturalMachinery &&
            other.id == id &&
            other.releaseDate == releaseDate);
  }

  @override
  int get hashCode => Object.hashAll([id, releaseDate]);
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

void main() {
  final currentDate = DateTime.now().year;

  //Объебинение массивов территорий
  final ageOfMachineryBefore2010 =
      mapBefore2010.values.expand((terr) => terr).toList();
  final ageOfMachineryAfter2010 =
      mapAfter2010.values.expand((terr) => terr).toList();
  final terrytoriesOfAllTime =
      ageOfMachineryBefore2010 + ageOfMachineryBefore2010;

  //Получение всей техники 
  var machinesOfAllTime = terrytoriesOfAllTime
      .map((e) => e.machineries)
      .expand((machine) => machine).toSet();

  //Подсчет среднего возраста техники
  final meanAgeOfAllMachines = (currentDate -
      machinesOfAllTime.fold(
              0, (totalAge, element) => totalAge += element.releaseDate.year) /
          machinesOfAllTime.length).floor();

  print('Средний возраст техники равен $meanAgeOfAllMachines');

    //Сортировка техники по возрасту
  final sortedMachinesOfAllTime = machinesOfAllTime.toList();
  sortedMachinesOfAllTime.sort((machine, oldMachime) => machine.releaseDate.year.compareTo(oldMachime.releaseDate.year));
  
  //Подсчет среднего возраста половины старшей техники
  final meanAgeOfOldestMachines = sortedMachinesOfAllTime.getRange(0, (sortedMachinesOfAllTime.length / 2).floor());
  print(meanAgeOfOldestMachines);
}
