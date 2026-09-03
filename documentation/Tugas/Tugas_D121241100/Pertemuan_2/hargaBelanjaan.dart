checkDiscount(subtotal) {
  // var totalBelanjaan = hitungSubtotal(daftarHarga, daftarBelanjaan);

  if (subtotal >= 100000) {
    return subtotal * 10 ~/ 100;
  } else if (subtotal >= 75000) {
    return subtotal * 5 ~/ 100;
  } else {
    return 0;
  }
}

hitungSubtotal(Map<String, int> daftarHarga, Map<String, int> daftarBelanjaan) {

  var subtotal = 0;

  for (var barang in daftarBelanjaan.keys) {
    if (daftarHarga.containsKey(barang)) {
      subtotal += daftarHarga[barang]! * daftarBelanjaan[barang]!;
    }
  }

  return subtotal;
}


void main() {
  var daftarHarga = <String, int> {
    'Apel': 5000,
    'Pisang': 3000,
    'Jeruk': 4000,
    'Mangga': 6000,
  };
  var daftarBelanjaan = <String, int> {
    'Apel': 10,
    'Pisang': 5,
    'Jeruk': 7,
    'Mangga': 4,
  };

  var subtotal = hitungSubtotal(daftarHarga, daftarBelanjaan);
  var diskon = checkDiscount(subtotal);


  print('Subtotal: Rp. $subtotal');
  print('Diskon: Rp. $diskon');
  print('Harga setelah diskon: Rp. ${subtotal - diskon}');
}
