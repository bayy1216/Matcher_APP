class DataUtils{
  static String majorAndStudentNumber(String major, int studentNumber){
    return '$major / $studentNumber학번';
  }

  static String convertXYToAlphabet(int row, int column){
    String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    final result = StringBuffer();

    while (row >= 0) {
      result.write(alphabet[row % 26]);
      row = (row / 26).floor() - 1; // 26진수에서 하나 줄임
    }

    return '${result.toString().split('').reversed.join()}${column+1}';
  }
}