# UI Design Specification Guidelines (Flutter / Dart Target)

Dokumen ini berisi ekstraksi token desain dan panduan struktur komponen untuk mengimplementasikan halaman **Profil (TaniPintar)** ke dalam kode Flutter/Dart.

---

## 1. Color Palette

* **Background Canvas:** `#F8F9FA` (Off-White / Light Gray)
    * Digunakan pada: Background utama layar/scaffold.
* **Card Background:** `#FFFFFF` (Pure White)
    * Digunakan pada: Card profil utama, card pengaturan akun, dan card bantuan.
* **Primary Accent Green:** `#34A853` (Vibrant Leaf Green)
    * Digunakan pada: Background tombol "Edit", background lingkar ikon pada list (Notifikasi, Bahasa, Keamanan, dll).
* **Danger / Logout Red:** `#FF2D55` / `#E53935` (Bright Red)
    * Digunakan pada: Background tombol "Logout".
* **Text Primary (Titles/Labels):** `#1E1E1E` (Dark Charcoal)
    * Digunakan pada: Judul halaman "Profil", nama user, header section ("Pengaturan Akun", "Bantuan"), dan label list.
* **Text Secondary (Subtitles):** `#616161` (Muted Gray)
    * Digunakan pada: Email user, value teks tambahan (misal: "Indonesia" pada pilihan bahasa).
* **Text On-Primary:** `#FFFFFF` (Pure White)
    * Digunakan pada: Ikon di dalam lingkaran hijau, teks tombol "Edit", teks tombol "Logout".
* **Icon Trailing:** `#9E9E9E` / `#616161` (Gray)
    * Digunakan pada: Ikon panah kanan (chevron) pada setiap item list.

---

## 2. Typography Styles

| Role / Element | Font Weight | Approx Size (sp/dp) | Color (Hex) | Line Height / Spacing |
| :--- | :--- | :--- | :--- | :--- |
| **Page Header ("Profil")** | Bold (`FontWeight.w800`) | 18 - 20 | `#1E1E1E` | Normal |
| **User Name ("Slamet Riyadi")** | Bold (`FontWeight.w700`) | 16 | `#1E1E1E` | 1.2 |
| **User Email ("slamet...gmail.com")**| Regular (`FontWeight.w400`) | 12 | `#616161` | 1.4 |
| **Button Text ("Edit")** | Medium (`FontWeight.w500`) | 12 | `#FFFFFF` | Normal |
| **Section Header ("Pengaturan...")** | Bold (`FontWeight.w700`) | 14 | `#1E1E1E` | 1.5 |
| **List Label ("Notifikasi")** | SemiBold (`FontWeight.w600`) | 14 | `#1E1E1E` | Normal |
| **List Trailing Text ("Indonesia")** | Regular (`FontWeight.w400`) | 12 | `#616161` | Normal |
| **Logout Text ("Logout")** | Bold (`FontWeight.w700`) | 16 | `#FFFFFF` | Normal |

---

## 3. Shape & Corner Radii

* **Profile Main Card:** `BorderRadius.circular(16.0)`
* **Settings/Menu Card:** `BorderRadius.circular(12.0)`
* **Profile Picture (Avatar):** `BoxShape.circle` (Catatan: Gunakan avatar/gambar default ilustrasi user/petani karena tidak ada fitur upload custom).
* **Icon Background (Green Circle):** `BoxShape.circle`
* **Edit Button:** `BorderRadius.circular(20.0)` (Pill shape)
* **Logout Button:** `BorderRadius.circular(24.0)` (Large Pill shape)
* **Shadows:** Sangat halus (`blurRadius: 8, color: Colors.black.withOpacity(0.04)`) pada card profil dan card menu.

---

## 4. Spacing & Elevation

* **Screen Margin (Horizontal Padding):** `16.0 dp`
* **Vertical Spacing Values:**
    * **Header ke Profile Card:** `20.0 dp`
    * **Profile Card ke Section "Pengaturan Akun":** `24.0 dp`
    * **Section Header ke Item Pertama:** `12.0 dp`
    * **Jarak antar Menu Card:** `12.0 dp`
    * **Bawah list ke Tombol Logout:** `32.0 dp`
* **Internal Padding (Profile Card):** `16.0 dp` (all sides)
* **Internal Padding (Menu Card):** `12.0 dp` (vertical), `16.0 dp` (horizontal)
* **Jarak Ikon Lingkaran ke Label Menu:** `16.0 dp`

---

## 5. Layout & Component Structure (Dart/Flutter Architecture)

```text
Scaffold (backgroundColor: #F8F9FA)
 ├── AppBar
 │    └── Row (Icon.arrow_back + Text("Profil"))
 │
 ├── Body: SingleChildScrollView
 │    └── Padding (16dp horizontal)
 │         ├── ProfileCardContainer (White, Rounded 16dp, soft shadow)
 │         │    └── Row
 │         │         ├── CircleAvatar (Default User/Farmer Image)
 │         │         ├── SizedBox(width: 12)
 │         │         ├── Column (CrossAxisAlignment.start)
 │         │         │    ├── Text("Slamet Riyadi", style: NameStyle)
 │         │         │    └── Text("slamet87@gmail.com", style: EmailStyle)
 │         │         ├── Spacer()
 │         │         └── EditButton (Green, Pill Shape, Text: "Edit")
 │         │
 │         ├── SizedBox(height: 24)
 │         ├── Text("Pengaturan Akun", style: SectionHeaderStyle)
 │         ├── SizedBox(height: 12)
 │         │
 │         ├── MenuCardWidget (Notifikasi)
 │         │    └── Row -> CircleIcon(Bell) + Text("Notifikasi") + Spacer + Icon(ChevronRight)
 │         ├── SizedBox(height: 12)
 │         ├── MenuCardWidget (Pilihan Bahasa)
 │         │    └── Row -> CircleIcon(Globe) + Text("Pilihan Bahasa") + Spacer + Text("Indonesia") + Icon(ChevronRight)
 │         ├── SizedBox(height: 12)
 │         ├── MenuCardWidget (Keamanan)
 │         │
 │         ├── SizedBox(height: 24)
 │         ├── Text("Bantuan", style: SectionHeaderStyle)
 │         ├── SizedBox(height: 12)
 │         │
 │         ├── MenuCardWidget (Pusat Bantuan)
 │         ├── SizedBox(height: 12)
 │         ├── MenuCardWidget (Tentang Kami)
 │         │
 │         ├── SizedBox(height: 32)
 │         └── LogoutButtonWidget (Red, Full Width, Text: "Logout")
 │
 └── BottomNavigationBar: CustomNotchedNavigationBar (#F2EFEA)
      ├── NavItem (Icon: home_outlined, Label: "Home")
      ├── NavItem (Icon: history, Label: "Riwayat")
      ├── Center FloatingActionButton (Icon: pie_chart, Green Circle)
      ├── NavItem (Icon: eco_outlined, Label: "Area")
      └── NavItem (Icon: person, Label: "Profile", Selected: true)
```
