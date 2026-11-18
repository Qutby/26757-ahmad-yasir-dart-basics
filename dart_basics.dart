// Student: Yasir Altaher Mohammad Ahmad
// Reg no: 26757
const String regNo = '26757';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// ---------- B2 ----------
int countVowels(String text) {
  // by YAMA
  String lower = text.toLowerCase(); // <- this line makes capital letters count
  int count = 0;
  int i = 0;
  while (i < lower.length) {
    if ('aeiou'.contains(lower[i])) {
      count++;
    }
    i++;
  }
  return count;
}

// ---------- B3 ----------
String initials(String fullName) {
  // by YAMA
  List<String> parts = fullName.trim().split(RegExp(r'\s+'));
  String result = '';
  int i = 0;
  while (i < parts.length) {
    if (parts[i].isNotEmpty) {
      result += parts[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

// ---------- C5 ----------
void drawTriangle(int height) {
  // by YAMA
  int row = 1;
  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    // spaces = height - row, so the last row has none
    print(' ' * (height - row) + symbol * row);
    row++;
  }
}

// ---------- D2 ----------
int momoFee(int amount) {
  // by YAMA
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

String maskPhone(String phone) {
  // by YAMA
  if (phone.length != 10) return 'INVALID';
  return phone.substring(0, 3) +
      '*' * (phone.length - 5) +
      phone.substring(phone.length - 2);
}

void main() {
  // by YAMA
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String fullName = 'Yasir Altaher Mohammad Ahmad';
  print('$fullName has ${countVowels(fullName)} vowels');

  // B3
  print(initials(fullName));
  print(initials('  ana uwase  '));
  print(initials('   '));

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  String phone = '0788123456';
  int totalFees = 0;
  int i = 1;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}
