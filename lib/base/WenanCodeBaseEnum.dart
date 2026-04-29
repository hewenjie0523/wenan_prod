class BaseEnum {
  /// This enum's integer value, as specified in the .proto file.
  final int value;

  /// This enum's name, as specified in the .proto file.
  final String name;

  /// Returns a new constant ProtobufEnum using [value] and [name].
  const BaseEnum(this.value, this.name);

  /// Returns a Map for all of the [BaseEnum]s in [byIndex], mapping each
  /// [BaseEnum]'s [value] to the [BaseEnum].
  static Map<int, T> initByValue<T extends BaseEnum>(List<T> byIndex) {
    var byValue = Map<int, T>();
    for (T v in byIndex) {
      byValue[v.value] = v;
    }
    return byValue;
  }

  // Subclasses will typically have a private constructor and a fixed set of
  // instances, so `Object.operator==()` will work, and does not need to
  // be overridden explicitly.
  bool operator ==(Object o);

  int get hashCode => value;

  /// Returns this enum's [name].
  String toString() => name;
}