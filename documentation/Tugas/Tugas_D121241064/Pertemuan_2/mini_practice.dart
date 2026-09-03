void main() {
  final daftarHarga = <String, int>{
    'Beras 5 kg': 75000,
    'Minyak goreng 2 L': 36000,
    'Gula 1 kg': 18000,
    'Telur 1 kg': 30000,
  };

  final daftarBelanjaan = <String>[
    'Beras 5 kg',
    'Minyak goreng 2 L',
    'Gula 1 kg',
    'Telur 1 kg',
  ];

  final subtotal = hitungSubtotal(daftarHarga, daftarBelanjaan);
  final diskon = tentukanDiskon(subtotal);
  final totalAkhir = subtotal - diskon;

  print('=== DAFTAR BELANJAAN ===');
  for (final barang in daftarBelanjaan) {
    print('$barang: ${formatRupiah(daftarHarga[barang]!)}');
  }
  print('------------------------');
  print('Subtotal : ${formatRupiah(subtotal)}');
  print('Diskon   : ${formatRupiah(diskon)}');
  print('Total    : ${formatRupiah(totalAkhir)}');
}

int hitungSubtotal(Map<String, int> daftarHarga, List<String> daftarBelanjaan) {
  var subtotal = 0;

  for (final barang in daftarBelanjaan) {
    final harga = daftarHarga[barang];
    if (harga != null) {
      subtotal += harga;
    }
  }

  return subtotal;
}

int tentukanDiskon(int subtotal) {
  if (subtotal >= 150000) {
    return subtotal * 15 ~/ 100;
  } else if (subtotal >= 100000) {
    return subtotal * 10 ~/ 100;
  } else if (subtotal >= 50000) {
    return subtotal * 5 ~/ 100;
  } else {
    return 0;
  }
}

String formatRupiah(int nominal) {
  final angka = nominal.toString();
  final hasil = StringBuffer();
  var jumlahDigit = 0;

  for (var indeks = angka.length - 1; indeks >= 0; indeks--) {
    hasil.write(angka[indeks]);
    jumlahDigit++;
    if (jumlahDigit == 3 && indeks > 0) {
      hasil.write('.');
      jumlahDigit = 0;
    }
  }

  return 'Rp${hasil.toString().split('').reversed.join()}';
}