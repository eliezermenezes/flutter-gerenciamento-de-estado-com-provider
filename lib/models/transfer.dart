class Transfer {
  final double value;
  final int accountNumber;

  Transfer(
    this.value,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }

  String toStringValue() {
    return 'R\$ $value';
  }

  String toStringAccountNumber() {
    return 'Account: $accountNumber';
  }
}
