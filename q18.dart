enum Certificate { diploma, bachelor, master, phd }

mixin University {
  final List<String> _lessons = [];

  set lessons(List<String> lessons) => _lessons.addAll(lessons);

  List<String> get lessons => _lessons;
}

abstract class Person {
  final String _name;
  final String _nationalCode;
  final String _address;
  final String _phone;

  Person(this._name, this._nationalCode, this._address, this._phone);

  String get name => _name;

  String get nationalCode => _nationalCode;

  String get address => _address;

  String get phone => _phone;

  String userInfo();

  String getPersonJob();

  @override
  String toString() {
    return 'Person{_name: $_name, _nationalCode: $_nationalCode, _address: $_address, _phone: $_phone}';
  }
}

class Student extends Person with University {
  final String studentCode;
  final String field;

  Student(super._name, super._nationalCode, super._address, super._phone,
      {required this.field, required this.studentCode});

  Student.english(super._name, super._nationalCode, super._address,
      super._phone, this.studentCode)
      : field = 'English literature';

  @override
  String userInfo() {
    return 'name: $_name, nationalCode: $_nationalCode, address: $_address, phone: $_phone, studentCode: $studentCode, field: $field';
  }

  @override
  String getPersonJob() {
    return '$_name is a student';
  }
}

class Teacher extends Person with University {
  final int salary;
  final Certificate certificate;

  Teacher(super._name, super._nationalCode, super._address, super._phone,
      this.salary, this.certificate);

  @override
  String userInfo() {
    return 'name: $_name, nationalCode: $_nationalCode, address: $_address, phone: $_phone, certificate: $certificate, salary: $salary';
  }

  @override
  String getPersonJob() {
    return '$_name is a teacher';
  }
}