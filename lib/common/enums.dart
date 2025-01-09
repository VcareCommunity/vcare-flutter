
enum GenderEnum {
  /// 未知
  unknown(value: 0, name: '未知'),

  /// 男
  male(value: 1, name: '男'),

  /// 女
  female(value: 2, name: '女');

  final int value;
  final String name;

  const GenderEnum({required this.value, required this.name});

  static GenderEnum fromValue(int value) {
    switch (value) {
      case 0:
        return GenderEnum.unknown;
      case 1:
        return GenderEnum.male;
      case 2:
        return GenderEnum.female;
      default:
        return GenderEnum.unknown;
    }
  }
}
