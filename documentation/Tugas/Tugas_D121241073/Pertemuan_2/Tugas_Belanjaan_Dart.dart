void main() {
  // Daftar barang dan harga
  Map<String, int> daftarBarang = {
    "Boneka Kucing": 75000,
    "Boneka Beruang": 85000,
    "Boneka Kelinci": 65000,
    "Boneka Hamster": 55000,
    "Boneka Penguin": 90000,
  };

  // Barang yang dibeli
  Map<String, int> barangDibeli = {
    "Boneka Kucing": 2,
    "Boneka Kelinci": 1,
    "Boneka Penguin": 2,
  };

  var total = hitungTotal(daftarBarang, barangDibeli);
  var diskon = tentukanDiskon(total);
  var totalAkhir = hitungTotalAkhir(total, diskon);

  print("=== TOKO BONEKA HEWAN ===");

  print("\nBarang yang Dibeli:");

  barangDibeli.forEach((nama, jumlah) {
    var harga = daftarBarang[nama]!;
    var subtotal = harga * jumlah;

    print("$nama x $jumlah = Rp$subtotal");
  });

  print("\nTotal Belanja : Rp$total");
  print("Diskon        : Rp$diskon");
  print("Total Akhir   : Rp$totalAkhir");
}


int hitungTotal(
    Map<String, int> daftarBarang,
    Map<String, int> barangDibeli) {

  var total = 0;

  barangDibeli.forEach((nama, jumlah) {
    var harga = daftarBarang[nama]!;
    total += harga * jumlah;
  });

  return total;
}

int tentukanDiskon(int total) {
  if (total >= 500000) {
    return total * 20 ~/ 100;
  } else if (total >= 300000) {
    return total * 15 ~/ 100;
  } else if (total >= 100000) {
    return total * 10 ~/ 100;
  } else {
    return 0;
  }
}

int hitungTotalAkhir(int total, int diskon) {
  return total - diskon;
}