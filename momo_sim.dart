// Student: Yasir Altaher Mohammad Ahmad
// Reg no: 26757
const String regNo = '26757';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// copied from D2
int momoFee(int amount) {
  // by YAMA
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String formatRwf(int amount) {
  // by YAMA
  bool negative = amount < 0;
  String digits = (negative ? -amount : amount).toString();
  String grouped = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    if (count > 0 && count % 3 == 0) {
      grouped = ',' + grouped;
    }
    grouped = digits[i] + grouped;
    count++;
    i--;
  }
  return '${negative ? '-' : ''}$grouped RWF';
}

bool isValidPin(String pin) {
  // by YAMA
  if (pin.length != 5) return false;
  int i = 0;
  while (i < pin.length) {
    int code = pin.codeUnitAt(i);
    if (code < 48 || code > 57) return false; // not '0'..'9'
    i++;
  }
  if (pin == '12345') return false;
  if (pin == pin[0] * 5) return false; // same digit five times
  return true;
}

int sendMoney(int balance, int amount) {
  // by YAMA
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

int buyAirtime(int balance, int amount) {
  // by YAMA
  if (amount < 100 || amount > 50000) {
    print('Failed: airtime must be between ${formatRwf(100)} and ${formatRwf(50000)}');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  // by YAMA
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN checks
  print("isValidPin('12345') = ${isValidPin('12345')}");
  print("isValidPin('77777') = ${isValidPin('77777')}");
  print("isValidPin('4821') = ${isValidPin('4821')}");
  print("isValidPin('48a21') = ${isValidPin('48a21')}");
  print("isValidPin('4821$d') = ${isValidPin('4821$d')}");

  // 2. starting balance
  int balance = 20000 + t * 500;
  print('Starting balance: ${formatRwf(balance)}');

  // 3. transactions, in order
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = sendMoney(balance, (d + 1) * 3000);
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. my own tests
  print(formatRwf(100));       // expect: 100 RWF
  print(formatRwf(100000));    // expect: 100,000 RWF
  print(formatRwf(1000000));   // expect: 1,000,000 RWF
  print(formatRwf(-100));      // expect: -100 RWF  (risky: no comma after the minus sign)
  print(isValidPin('01234'));  // expect: true  (leading zero must be allowed)
  print(isValidPin('00000'));  // expect: false (same digit five times)
  print(isValidPin('-1234'));  // expect: false (5 characters, but '-' is not a digit)
  print(isValidPin(''));       // expect: false (empty)
}
