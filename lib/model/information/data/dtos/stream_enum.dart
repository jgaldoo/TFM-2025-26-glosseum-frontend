enum StreamEnum {
  start,
  chunk,
  end;

  factory StreamEnum.fromString(String value) {
    return StreamEnum.values.firstWhere(
      (streamStatus) => streamStatus.name == value,
      orElse: () => StreamEnum.end,
    );
  }
}
