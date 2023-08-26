abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance,);

  void deposit(double amount) {
    balance = balance+amount;
    print('Deposited: \$${amount.toStringAsFixed(2)}');
    print('New Balance: \$${balance.toStringAsFixed(2)}');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance + interestRate >= amount) {
      balance = balance-amount;
      balance = balance+balance * (interestRate/100);
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
      print('New Balance after adding interest rate: \$${balance.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance + overdraftLimit >= amount) {
      balance = balance-amount;
      print('Withdrawn: \$${amount.toStringAsFixed(2)}');
      print('New Balance: \$${balance.toStringAsFixed(2)}');
    } else {
      print('Insufficient funds');
    }
  }
}

void main() {

  var savings = SavingsAccount(500, 2000.00, 2.00);
  print('\nSavingsAccount : Basic Balance= \$${savings.balance.toStringAsFixed(2)}');
  savings.deposit(500.0);
  savings.withdraw(200.0);

  var current = CurrentAccount(1000, 2000.00, 3000.0);
  print('\nCurrent Account : Basic Balance= \$${current.balance.toStringAsFixed(2)}');
  current.deposit(300.0);
  current.withdraw(500.0);
}

