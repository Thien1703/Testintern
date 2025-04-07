class MyBigNumber {
  String sum(String stn1, String stn2) {
    int len1 = stn1.length;
    int len2 = stn2.length;
    int maxLength = len1 > len2 ? len1 : len2;

    // Bổ sung thêm các số 0 để 2 số có độ dài bằng nhau
    stn1 = stn1.padLeft(maxLength, '0');
    stn2 = stn2.padLeft(maxLength, '0');

    int carry = 0;
    String result = '';

    print("==> Bắt đầu cộng $stn1 + $stn2");

    for (int i = maxLength - 1; i >= 0; i--) {
      int digit1 = int.parse(stn1[i]);
      int digit2 = int.parse(stn2[i]);
      int tempSum = digit1 + digit2 + carry;

      int digitResult = tempSum % 10;
      int currentCarry = carry; // lưu giá trị nhớ cũ
      carry = tempSum ~/ 10;

      result = digitResult.toString() + result;

      if (i == maxLength - 1) {
        // Bước đầu tiên
        print("➤ $digit1 + $digit2 = $digitResult (nhớ: $carry)");
      } else {
        if (currentCarry > 0) {
          print(
              "➤ $digit1 + $digit2 + nhớ $currentCarry = $digitResult (nhớ: $carry)");
        } else {
          print("➤ $digit1 + $digit2 = $digitResult (nhớ: $carry)");
        }
      }
    }

    if (carry > 0) {
      result = carry.toString() + result;
      print("➤ Thêm phần nhớ cuối cùng: $carry");
    }

    print("==> Kết quả cuối cùng: $result ✅");
    return result;
  }
}
