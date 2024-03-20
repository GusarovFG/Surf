void main() {
  final List<CSGOGamer> gamers = [];
  final List<Title> titles = [
    Title('Лучшая команда на Б', 'Лан в подвале'),
    Title('Лучшая команда на лане', 'Лан в игровом')
  ];
  final Team team = Team('ASD', gamers, 'Россия', titles, 234, 144, 90);
  final CSGOGamer gamer = CSGOGamer(
      'Фаддей', 'Гусаров', 29, 'Россия', team, 'GusarovFG', 144, 94, 50);

  gamer.descriptionOfGamer();
}

class Person {
  String name;
  String secondname;
  int age;
  String countryOfBirth;

  Person(
    this.name,
    this.secondname,
    this.age,
    this.countryOfBirth,
  );
}

class CSGOGamer extends Person {
  Team team;
  String nickName;
  int countOfgames;
  int wins;
  int defeats;
  int get percentOfWins => (wins / (countOfgames / 100)).round();

  CSGOGamer(
    super.name,
    super.secondname,
    super.age,
    super.countryOfBirth,
    this.team,
    this.nickName,
    this.countOfgames,
    this.wins,
    this.defeats,
  );

  void descriptionOfGamer() {
    print(
        'Имя: $name, Фамилия: $secondname, возраст: $age, рожден в $countryOfBirth, никнейм: $nickName, состоит в команде ${team.name}, сыграно матчей: $countOfgames, процент выйгрышей: $percentOfWins %.\nКоманда имеет титулы: ${team.titles.map((e) => e.nameOfTitle).toList().join(', ')}');
  }
}

class Team {
  String name;
  List<CSGOGamer> commandStructure;
  String country;
  List<Title> titles;
  int countOfGames;
  int wins;
  int defeats;

  Team(
    this.name,
    this.commandStructure,
    this.country,
    this.titles,
    this.countOfGames,
    this.wins,
    this.defeats,
  );
}

class Title {
  String nameOfTitle;
  String event;

  Title(this.nameOfTitle, this.event);
}
