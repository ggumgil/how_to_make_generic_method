class Sample<T> {
  String getValue() {
    return '${T.toString()}타입입니다.';
  }
}

class Person<T> {
  int age;
  double height;

  Person({required this.age, required this.height});

  T? moreInfo;

  void setMoreInfo(T value) {
    moreInfo = value;
  }

  Future<String> sendGetLocation(T value) async {
    var temp = value;
    String result = '';

    if (value == null) {
      throw Exception();
    }

    if (value is Police) {
      temp as Police;
      result = temp.getLocation();
    }

    Future.delayed(const Duration(seconds: 2));
    return result;
  }
}

class Police {
  String location;
  String level;

  Police(this.location, this.level);

  String getLocation() {
    return location;
  }
}

class Marketer {
  String location;
  int salary;

  Marketer(this.location, this.salary);
}
