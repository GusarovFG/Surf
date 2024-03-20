void main() {

  final List<Car> cars = [Car('Toyota', 'Corolla', 'WJUHFIUHU3325OUH', 1998, BodyType.coupe, 'Blue', SteeringWheelocation.left, WheelDrive.fwd, 85, TypeOfEngine.gas, 1.3)];

  final Owner owner = Owner.withACar('Faddey', 'Gusrov', '+79126543222', cars);

  owner.sellACar(cars, cars.first.vin);
}

class Car {
  String brand;
  String model;
  String vin;
  int year;
  Owner? owners;
  int? mileage;
  BodyType bodyType;
  String color;
  SteeringWheelocation steeringWheelocation;
  WheelDrive wheelDrive;
  int power;
  double? engineCapacity;
  TypeOfEngine typeOfEngine;

  Car(this.brand, this.model, this.vin, this.year, this.bodyType, this.color, this.steeringWheelocation, this.wheelDrive, this.power, this.typeOfEngine, this.engineCapacity);
  Car.electro(this.brand, this.model, this.vin, this.year, this.bodyType, this.color, this.steeringWheelocation, this.wheelDrive, this.power, this.typeOfEngine);
  Car.previouslUsed(this.brand, this.model, this.vin, this.year, this.bodyType, this.color, this.steeringWheelocation, this.wheelDrive, this.power, this.typeOfEngine, this.engineCapacity, this.mileage, this.owners);

  void drive() {
    print('Car is drive');
  }

  String description() {
    return 'Car:\n Model - ${this.brand} ${this.model}\n vin - ${this.vin}\n Production year - ${this.year}\n Body type - ${this.bodyType}\n Color - ${this.color}\n Steerin wheel location - ${this.steeringWheelocation}\n Wheel drive - ${this.wheelDrive}\n Power - ${this.power} hp\n Type of engine - ${this.typeOfEngine}\n Engine capacity - ${this.engineCapacity}';
  }
}

class Owner {
  String name;
  String secondname;
  String numberOfPhone;
  List<Car>? carIsPossession;

  Owner(this.name, this.secondname, this.numberOfPhone);
  Owner.withACar(this.name, this.secondname, this.numberOfPhone, List<Car> cars);

  void sellACar(List<Car>? cars, String vin) {
    if(cars != null) {
      print('Продам авто:\n ${cars.where((element) => element.vin == vin).first.description()}');
    }
  }
}

enum WheelDrive {
  fourWheelDrive('AWD'), fwd('FWD'), rwd('RWD');

  const WheelDrive(this.wheelDrive);
  final String wheelDrive;
}

enum BodyType {
  sedan('sedan'), combi('sedan'), hatchback('sedan'), pickup('sedan'), suv('sedan'), coupe('sedan');

  const BodyType(this.bodyType);
  final String bodyType;
}


enum SteeringWheelocation {
  left('left'), rigth('left');

  const SteeringWheelocation(this.location);
  final String location;
}

enum TypeOfEngine {
  disel('disel'), gas('gas'), electro('electro'), hybrid('hybrid');

  const TypeOfEngine(this.type);
  final String type;
}