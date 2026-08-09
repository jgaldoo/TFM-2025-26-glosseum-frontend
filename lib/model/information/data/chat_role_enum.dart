enum ChatRoleEnum {
  user,
  model;

  factory ChatRoleEnum.fromString(String value) {
    return ChatRoleEnum.values.firstWhere(
      (role) => role.name == value,
      orElse: () => ChatRoleEnum.model,
    );
  }
}
