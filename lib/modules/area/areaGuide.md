# UI Design Specification Guidelines (Flutter / Dart Target)

Dokumen ini berisi ekstraksi token desain dan panduan struktur komponen untuk mengimplementasikan halaman **Daftar Area (TaniPintar)** ke dalam kode Flutter/Dart[cite: 3].

---

## 1. Color Palette

* **Primary / Accent Green:** `#3B9E59` / `#34A853` (Medium Leaf Green)[cite: 3]
    * Digunakan pada: Tombol "Tambah Area", chip tab aktif ("Area"), tombol "Detail", icon check list hijau, dan Floating Action Button bottom nav[cite: 3].
* **Background Canvas:** `#FFFFFF` (Pure White)[cite: 3]
    * Digunakan pada: Background utama layar/scaffold[cite: 3].
* **Card Background:** `#FFFFFF` (Pure White)[cite: 3]
    * Digunakan pada: Container card daftar area[cite: 3].
* **Chip Unselected Background:** `#FFFFFF` (White dengan Border)[cite: 3]
    * Digunakan pada: Chip tab non-aktif ("Sensor")[cite: 3].
* **Bottom Navigation Bar Background:** `#F2EFEA` (Warm Off-White / Beige Tint)[cite: 3]
    * Digunakan pada: Background container bottom navigation bar[cite: 3].
* **Border Color:**
    * **Card & Divider Border:** `#F0F0F0` / `#E0E0E0` (Very Light Gray) — Digunakan pada outline card dan garis pemisah header card[cite: 3].
    * **Chip Unselected Border:** `#3B9E59` (Green Border Line)[cite: 3].
* **Text & Icon Colors:**
    * **Text Primary / Title:** `#1E1E1E` (Dark Charcoal / Near Black) — Digunakan untuk "Daftar Area", "Area 1", dan angka indikator (67%, 32°C)[cite: 3].
    * **Text Secondary / Label:** `#555555` (Medium Gray) — Digunakan untuk label "Kelembaban", "Suhu", dan label bottom nav non-aktif[cite: 3].
    * **Nav Selected Item:** `#8B5E34` / `#1E1E1E` (Dark Olive/Brownish Gray) — Digunakan pada label & icon "Area" yang aktif di bottom nav[cite: 3].
    * **Text On Primary:** `#FFFFFF` (White) — Digunakan pada teks tombol "Tambah Area", chip aktif, dan tombol "Detail"[cite: 3].

---

## 2. Typography Styles

| Role / Element | Font Weight | Approx Size (sp/dp) | Color (Hex) | Line Height / Spacing |
| :--- | :--- | :--- | :--- | :--- |
| **Page Header ("Daftar Area")**[cite: 3] | Bold (`FontWeight.w800`) | 20 | `#1E1E1E` | Normal[cite: 3] |
| **Card Title ("Area 1")**[cite: 3] | Bold (`FontWeight.w700`) | 18 | `#1E1E1E` | Normal[cite: 3] |
| **Indicator Label ("Kelembaban", "Suhu")**[cite: 3] | Regular (`FontWeight.w400`) | 12 | `#555555` | 1.2[cite: 3] |
| **Indicator Value ("67%", "32°C")**[cite: 3] | Bold (`FontWeight.w700`) | 13 | `#1E1E1E` | 1.2[cite: 3] |
| **Chip Text ("Area", "Sensor")**[cite: 3] | SemiBold (`FontWeight.w600`) | 13 | `#FFFFFF` / `#3B9E59` | Normal[cite: 3] |
| **Button Text ("Detail")**[cite: 3] | SemiBold (`FontWeight.w600`) | 12 | `#FFFFFF` | Normal[cite: 3] |
| **Main Button ("Tambah Area")**[cite: 3] | Bold (`FontWeight.w700`) | 16 | `#FFFFFF` | Normal[cite: 3] |
| **Bottom Nav Label ("Area")**[cite: 3] | Bold (`FontWeight.w700`) | 11 | `#8B5E34` | Normal[cite: 3] |

---

## 3. Shape & Corner Radii

* **Area Card Corner Radius:** `BorderRadius.circular(16.0)`[cite: 3]
* **Filter Chip Radius:** `BorderRadius.circular(20.0)` (Pill Shape)[cite: 3]
* **"Detail" Button Radius:** `BorderRadius.circular(20.0)` (Pill Shape)[cite: 3]
* **"Tambah Area" Button Radius:** `BorderRadius.circular(24.0)` (Full Pill Shape)[cite: 3]
* **Bottom Navigation Bar Clip/Shape:** Custom Curved Bar dengan Notch melingkar di tengah[cite: 3].

---

## 4. Spacing & Elevation

* **Screen Margin (Horizontal Padding):** `16.0 dp`[cite: 3]
* **Card Internal Padding:** `16.0 dp` (All Sides)[cite: 3]
* **Vertical Spacing Values:**
    * **Header to Filter Chips:** `16.0 dp`[cite: 3]
    * **Filter Chips to Card List:** `16.0 dp`[cite: 3]
    * **Between Area Cards:** `12.0 dp`[cite: 3]
    * **Last Card to "Tambah Area" Button:** `20.0 dp`[cite: 3]
    * **Card Header to Divider Line:** `12.0 dp`[cite: 3]
    * **Divider Line to Metrics Row:** `12.0 dp`[cite: 3]
* **Elevations & Shadows:**
    * **Area Cards:** Soft Border Shadow (`BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: Offset(0, 2))`)[cite: 3].
    * **Tambah Area Button:** Flat / Slight Elevation (`1-2 dp`)[cite: 3].

---

## 5. Layout & Component Structure (Dart/Flutter Architecture)

```text
Scaffold (backgroundColor: Colors.white)
 ├── AppBar / Header Section
 │    └── Row (Icon.arrow_back + Text("Daftar Area"))
 │
 ├── Body: Column / ListView
 │    ├── Padding(16dp) -> Row (Filter Chips)
 │    │    ├── ChoiceChip (Selected: true, Label: "Area")
 │    │    └── ChoiceChip (Selected: false, Label: "Sensor")
 │    │
 │    ├── Expanded -> ListView.builder (ItemCount: 3)
 │    │    └── Container / Card (White, Rounded 16dp, Soft Shadow)
 │    │         └── Column
 │    │              ├── Row (SpaceBetween) -> Text("Area 1") + Icon(CheckCircle, Green)
 │    │              ├── Divider(color: #F0F0F0)
 │    │              └── Row (SpaceBetween)
 │    │                   ├── Row -> Icon(water_drop) + Column("Kelembaban", "67%")
 │    │                   ├── Row -> Icon(thermostat) + Column("Suhu", "32°C")
 │    │                   └── ElevatedButton / TextButton ("Detail", Green Pill)
 │    │
 │    └── Padding(16dp)
 │         └── ElevatedButton ("Tambah Area", Green Full Pill)
 │
 └── BottomNavigationBar: CustomNotchedNavigationBar (#F2EFEA)
      ├── NavItem (Icon: home_outlined, Label: "Home")
      ├── NavItem (Icon: history, Label: "Riwayat")
      ├── Center FloatingActionButton (Icon: pie_chart, Green Circle)
      ├── NavItem (Icon: eco, Label: "Area", Selected: true)
      └── NavItem (Icon: person_outline, Label: "Profile")@