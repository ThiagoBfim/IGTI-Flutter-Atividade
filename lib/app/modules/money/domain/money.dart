class Money {

  final double value;

  Money(this.value);

  Money.fromMap(Map<String, dynamic> map) :
      value = double.parse(map['high']);

  Map<String, dynamic> toMap() {
    return {
      'value': this.value,
    };
  }
}