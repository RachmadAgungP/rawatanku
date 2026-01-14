double evaluateFormula(
    Map<String, dynamic> variables, Map<String, dynamic> formula) {
  dynamic result;

  formula.forEach((key, value) {
    if (value is String) {
      String expression = value;

      // Ganti nilai variabel dalam ekspresi
      for (var entry in variables.entries) {
        expression = expression.replaceAll(entry.key, entry.value.toString());
      }

      // Evaluasi ekspresi dan simpan hasilnya
      result = Function.apply(
          (String expression) => num.parse(expression), [expression]);
    } else if (value is Map<String, dynamic>) {
      // Rekursif panggil fungsi untuk formula dalam bentuk map
      result = evaluateFormula(variables, value);
    }

    // Update variabel dengan hasil evaluasi
    variables[key] = result;
  });

  // Hasil akhir formula terletak di variabel terakhir
  return result.toDouble();
}

void main() {
  // Contoh penggunaan
  Map<String, dynamic> variables = {
    'wat': 2.0,
    'wkt': 5.0,
    'ttpan': 1000.0,
    'hg': 3.0
  };

  Map<String, dynamic> formula = {
    'var': {'wat': 0.0, 'wkt': 0.0, 'ttpan': 1000, 'hg': 0.0, 'langkah1': 0.0},
    'rumus': {'langkah1': '(wat*wkt)', 'langkah2': '(langkah1/ttpan)*hg'}
  };

  // Evaluasi rumus dengan nilai variabel yang diberikan
  double result = evaluateFormula(variables, formula['rumus']);

  // Cetak hasil
  print('Hasil dari rumus adalah $result');
}
