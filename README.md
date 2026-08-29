#Ini merupakan Project Mobile bersama via Github
#Tim beranggotakan:
 @Reinheart SIlalong Alinan (D121241064)
 @Andi Habibullah Masnawy (D1212410)
 @Chelsea Elysia Chandean (D121241073)


# 🚀 Panduan Kolaborasi Git & GitHub

Dokumen ini berisi standar alur kerja (*workflow*) Git & GitHub untuk mempermudah kolaborasi tim, menjaga kualitas kode, dan mencegah terjadinya *broken build* atau *merge conflict* di repository utama.

---

## 🚨 PERINGATAN WAJIB: Penggunaan AI Coding Assistant

> ### 🛑 **STOP & BACA INI SEBELUM MELAKUKAN PUSH!**
> Penggunaan AI (GitHub Copilot, Cursor, ChatGPT, Claude, dll.) diperbolehkan sebagai alat bantu, **DENGAN SYARAT TEGAS**:
> 
> 1. **DILARANG KERAS langsung melakukan commit & push kode hasil generate AI tanpa pengujian.**
> 2. **WAJIB BUILD & TEST DI LOKAL TERLEBIH DAHULU:**
>    - Pastikan proses build berhasil 100% tanpa error di perangkat Anda (misal: `npm run build`, `pnpm build`, `cargo build`, dsb.).
>    - Jalankan linter dan unit test lokal.
>    - Pastikan tidak ada dependensi asing/halusinasi, broken imports, atau perubahan file tak terduga.
> 3. **Hanya setelah build & test lokal dipastikan BERSIH dan BERJALAN**, Anda diizinkan melakukan `git push` ke remote branch masing-masing.

---

## 📌 Ringkasan Alur Cepat (TL;DR)

```text
1. git checkout main && git pull origin main
2. git checkout -b feat/nama-fitur
3. [Koding & Uji Coba AI]
4. TEST & BUILD LOKAL SAMPAI SUKSES! ⚠️
5. git add . && git commit -m "feat: deskripsi fitur"
6. git fetch origin && git merge origin/main
7. git push origin feat/nama-fitur
8. Buat Pull Request (PR) di GitHub
```

---

## 🌿 Struktur & Penamaan Branch

Jangan pernah langsung push ke branch `main` / `master`!

| Tipe Branch | Format Penamaan | Contoh |
| :--- | :--- | :--- |
| **Fitur Baru** | `feat/<nama-fitur>` / `feat/<nama>-<fitur>` | `feat/andi-auth-google` |
| **Perbaikan Bug** | `fix/<nama-bug>` | `fix/navbar-overflow` |
| **Dokumentasi** | `docs/<topik>` | `docs/api-endpoints` |
| **Refaktor/Optimasi**| `refactor/<modul>` | `refactor/database-query` |

---

## 🛠️ Langkah-Langkah Kolaborasi Tim

### 1. Persiapan Awal (Clone & Setup)
Jika baru pertama kali:
```bash
git clone https://github.com/<organisasi-atau-user>/<nama-repo>.git
cd <nama-repo>
# Install dependensi (sesuaikan dengan project)
npm install
```

---

### 2. Mulai Fitur Baru dari Versi Terbaru
Sebelum mulai koding, pastikan branch dasar selalu ter-update:
```bash
git checkout main
git pull origin main
git checkout -b feat/fitur-anda
```

---

### 3. Pengujian & Verifikasi Lokal
Setelah selesai menulis kode atau menggunakan AI:
```bash
# 1. Jalankan linter / format check
npm run lint

# 2. Jalankan test suite
npm run test

# 3. Jalankan build production lokal
npm run build
```
*(Ganti perintah di atas sesuai tech stack project)*

---

### 4. Commit Perubahan
Gunakan format **Conventional Commits**:
```bash
git status
git add .
git commit -m "feat(auth): implementasi login oauth google"
```
*Gunakan prefix yang sesuai: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`.*

---

### 5. Sinkronisasi & Hindari Conflict
Sebelum mengirim branch ke GitHub, gabungkan pembaruan terbaru dari `main`:
```bash
git fetch origin
git merge origin/main
```
Jika muncul konflik (*conflict*), selesaikan manual di VS Code / editor pilihan Anda, lalu simpan dan commit kembali.

---

### 6. Push ke Remote Branch Anda
```bash
git push origin feat/fitur-anda
```

---

### 7. Buat Pull Request (PR) & Code Review
1. Masuk ke halaman repository di GitHub.
2. Klik tombol **Compare & pull request**.
3. Isi checklist PR:
   - [ ] Deskripsi fitur/perbaikan sudah jelas.
   - [ ] Build lokal berhasil (`build pass`).
   - [ ] Tidak ada syntax error / import yang rusak.
4. Minta review minimal dari 1 anggota tim sebelum di-merge ke `main`.

---

## 💡 Best Practices Tambahan

- **Jangan Commit File Rahasia:** Jangan pernah commit file `.env`, kredensial API, token, atau folder dependensi (`node_modules/`, `.venv/`). Pastikan sudah ada di `.gitignore`.
- **Commit yang Rapi:** Buat commit secara berkala per komponen/logika yang selesai, bukan 1 commit raksasa di akhir.
- **Komunikasi:** Jika ada perubahan skema database atau dependensi baru, infokan ke rekan tim.