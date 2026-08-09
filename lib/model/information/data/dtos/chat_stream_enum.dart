enum ChatStreamEnum {
  start,
  chunk,
  end;

  factory ChatStreamEnum.fromString(String value) {
    return ChatStreamEnum.values.firstWhere(
      (streamStatus) => streamStatus.name == value,
      orElse: () => ChatStreamEnum.end,
    );
  }
}
