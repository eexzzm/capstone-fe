# UI Design Specification Guidelines (Flutter / Dart Target)

Dokumen ini berisi ekstraksi token desain dan panduan struktur komponen untuk mengimplementasikan halaman **Daftar Akun Baru (TaniPintar)** ke dalam kode Flutter/Dart.

---

## 1. Color Palette

* **Primary / Brand Color:** `#1B5E20` (Dark Forest Green)
    * Digunakan pada: Header title, tombol utama, teks navigasi kembali, teks aksi "Masuk di sini", dan icon daun.
* **Primary Light / Background Circle:** `#E8F5E9` (Light Mint Green)
    * Digunakan pada: Background lingkaran logo icon di atas header.
* **Background Canvas:** `#F8F9FA` (Off-White / Very Light Gray)
    * Digunakan pada: Background utama layar/scaffold.
* **Card Background:** `#FFFFFF` (Pure White)
    * Digunakan pada: Background container/card formulir.
* **Input Background:** `#FAFAFA` (Light Gray Neutral)
    * Digunakan pada: Fill color field text input.
* **Border Color:** `#E0E0E0` (Light Gray Border)
    * Digunakan pada: Border terluar dari text input field dan garis pembatas header.
* **Text Colors:**
    * **Text Primary:** `#212121` (Dark Gray / Almost Black) — Digunakan untuk Label Input.
    * **Text Secondary:** `#616161` (Medium Gray) — Digunakan untuk Subtitle dan Teks "Sudah punya akun?".
    * **Text Hint / Placeholder:** `#9E9E9E` (Muted Gray) — Digunakan untuk placeholder teks di dalam input.
    * **Text On Primary:** `#FFFFFF` (White) — Digunakan untuk teks & icon di dalam tombol utama.

---

## 2. Typography Styles

| Role / Element | Font Weight | Approx Size (sp/dp) | Color (Hex) | Line Height / Spacing |
| :--- | :--- | :--- | :--- | :--- |
| **Header Nav ("Kembali")** | Bold (`FontWeight.w700`) | 16 | `#1B5E20` | Normal |
| **Page Title ("Daftar Akun Baru")** | Bold (`FontWeight.w800`) | 22 | `#1B5E20` | 1.2 |
| **Subtitle Description** | Regular (`FontWeight.w400`) | 14 | `#616161` | 1.4 |
| **Input Label** | SemiBold (`FontWeight.w600`) | 14 | `#212121` | Normal |
| **Input Placeholder / Hint** | Regular (`FontWeight.w400`) | 14 | `#9E9E9E` | Normal |
| **Button Text ("Daftar Sekarang")**| Bold (`FontWeight.w700`) | 16 | `#FFFFFF` | Normal |
| **Footer Text ("Sudah punya...")**| Regular (`FontWeight.w400`) | 14 | `#616161` | Normal |
| **Footer Action ("Masuk di sini")**| Bold (`FontWeight.w700`) | 14 | `#1B5E20` | Normal |

---

## 3. Shape & Corner Radii

* **Main Card Container Radius:** `BorderRadius.circular(16.0)`
* **Input Field Radius:** `BorderRadius.circular(10.0)`
* **Primary Button Radius:** `BorderRadius.circular(12.0)`
* **Logo Badge Circle:** `BoxShape.circle` (Diameter ~64dp)

---

## 4. Spacing & Elevation

* **Screen Margin (Horizontal Padding):** `16.0 dp`
* **Card Internal Padding:** `24.0 dp` (All Sides)
* **Vertical Spacing Values:**
    * **Header Icon to Title:** `16.0 dp`
    * **Title to Subtitle:** `8.0 dp`
    * **Subtitle to First Input:** `24.0 dp`
    * **Input Label to Input Box:** `8.0 dp`
    * **Between Input Fields:** `16.0 dp`
    * **Last Input Field to Submit Button:** `24.0 dp`
    * **Submit Button to Footer:** `20.0 dp`
* **Elevations & Shadows:**
    * **Main Card Elevation:** Mild Shadow (`BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 4))`).
    * **Input Fields:** Flat / Elevation `0` with border `1.0 dp`.
    * **Button Elevation:** Flat or subtle depth (`Elevation 1-2`).

---

## 5. Layout & Component Structure (Dart/Flutter Architecture)

```text
Scaffold (backgroundColor: #F8F9FA)
 ├── AppBar / Custom Header
 │    └── Row (Icon.arrow_back + Text("Kembali"))
 └── Body: SingleChildScrollView + Center / Padding
      └── Card / Container (White, Rounded 16dp, Soft Shadow)
           └── Column (CrossAxisAlignment: CrossAxisAlignment.start)
                ├── Align Center
                │    └── CircleAvatar (#E8F5E9) -> Icon (Leaf / #1B5E20)
                ├── Align Center -> Text("Daftar Akun Baru")
                ├── Align Center -> Text("Mari bergabung bersama TaniPintar...")
                │
                ├── Text("Nama Lengkap")
                ├── TextField (Icon: person_outline, Hint: "Masukkan nama Anda")
                │
                ├── Text("Nomor HP / WhatsApp")
                ├── TextField (Icon: phone_android / smartphone, Hint: "08...")
                │
                ├── Text("Lokasi Sawah / Desa")
                ├── TextField (Icon: location_on_outlined, Hint: "Nama desa atau kecamatan")
                │
                ├── ElevatedButton ("Daftar Sekarang", Icon: person_add / account_check)
                │
                └── Row (MainAxisAlignment.center)
                     ├── Text("Sudah punya akun? ")
                     └── TextButton / InkWell ("Masuk di sini")