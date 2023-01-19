enum Status {
  waiting("Aguardando"),
  received("Recebido"),
  delivered("Entregue");

  final String value;

  const Status(this.value);

  static Status getEnum(String name) =>
      Status.values.firstWhere((element) => element.name == name);
}
