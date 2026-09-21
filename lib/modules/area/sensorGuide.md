# UI Design Specification Guidelines (Flutter / Dart Target)

Dokumen ini berisi ekstraksi token desain dan panduan struktur komponen untuk mengimplementasikan halaman **Daftar Sensor (TaniPintar)** ke dalam kode Flutter/Dart[cite: 4].

---

## 1. Color Palette

* **Primary / Accent Green:** `#3B9E59` / `#34A853` (Medium Leaf Green)[cite: 4]
    * Digunakan pada: Tombol "Tambah Sensor", chip tab aktif ("Sensor"), label area ("Area 1") di bawah judul kartu, dan Floating Action Button bottom navigation bar[cite: 4].
* **Background Canvas:** `#FFFFFF` (Pure White)[cite: 4]
    * Digunakan pada: Background utama layar/scaffold[cite: 4].
* **Card Background:** `#FFFFFF` (Pure White)[cite: 4]
    * Digunakan pada: Container card sensor di dalam grid[cite: 4].
* **Image Placeholder Background:** `#F8F9FA` / `#F5F5F5` (Very Light Gray)[cite: 4]
    * Digunakan pada: Background kontainer thumbnail modul sensor (ESP32)[cite: 4].
* **Chip Unselected Background:** `#FFFFFF` (White dengan border)[cite: 4]
    * Digunakan pada: Chip tab non-aktif ("Area")[cite: 4].
* **Dropdown Filter Background:** `#FFFFFF` (White dengan outline)[cite: 4]
    * Digunakan pada: Filter dropdown "Area v" di pojok kanan atas[cite: 4].
* **Action Button Colors:**
    * **Edit Button Background:** `#FFE600` / `#FFD600` (Vibrant Warning Yellow)[cite: 4]
    * **Delete Button Background:** `#FF2D55` / `#E53935` (Bright Red)[cite: 4]
* **Bottom Navigation Bar Background:** `#F2EFEA` (Warm Off-White / Beige Tint)[cite: 4]
    * Digunakan pada: Background container bottom navigation bar[cite: 4].
* **Border Colors:**
    * **Card Outline:** `#E0E0E0` / `#EEEEEE` (Soft Light Gray)[cite: 4]
    * **Chip Unselected Border:** `#3B9E59` (Medium Green)[cite: 4]
    * **Dropdown Outline Border:** `#E0E0E0` (Light Gray)[cite: 4]
* **Text & Icon Colors:**
    * **Text Primary / Title:** `#1E1E1E` (Dark Charcoal / Near Black) — Digunakan untuk "Daftar Sensor", judul modul "ESP32", dropdown text, dan label tombol "Edit"[cite: 4].
    * **Text Secondary / Tag:** `#3B9E59` (Green) — Digunakan untuk label area "Area 1" dan icon pohon kecil di sampingnya[cite: 4].
    * **Text On Action (Delete / Add):** `#FFFFFF` (Pure White) — Digunakan untuk teks "Delete" dan "Tambah Sensor"[cite: 4].
    * **Nav Unselected Item:** `#B0BEC5` (Muted Gray)[cite: 4].
    * **Nav Selected Item:** `#8B5E34` / `#1E1E1E` (Dark Olive/Brownish Gray) — Digunakan pada label & icon "Area" aktif[cite: 4].

---

## 2. Typography Styles

| Role / Element | Font Weight | Approx Size (sp/dp) | Color (Hex) | Line Height / Spacing |
| :--- | :--- | :--- | :--- | :--- |
| **Page Header ("Daftar Sensor")**[cite: 4] | Bold (`FontWeight.w800`) | 20 | `#1E1E1E` | Normal[cite: 4] |
| **Filter Chip Text ("Area", "Sensor")**[cite: 4] | SemiBold (`FontWeight.w600`) | 13 | `#3B9E59` / `#FFFFFF` | Normal[cite: 4] |
| **Dropdown Text ("Area")**[cite: 4] | Medium (`FontWeight.w500`) | 13 | `#1E1E1E` | Normal[cite: 4] |
| **Card Item Title ("ESP32")**[cite: 4] | Bold (`FontWeight.w700`) | 15 | `#1E1E1E` | Normal[cite: 4] |
| **Card Item Subtitle ("Area 1")**[cite: 4] | Medium (`FontWeight.w500`) | 11 | `#3B9E59` | 1.2[cite: 4] |
| **Card Action Button ("Edit")**[cite: 4] | Bold (`FontWeight.w700`) | 11 | `#1E1E1E` | Normal[cite: 4] |
| **Card Action Button ("Delete")**[cite: 4] | Bold (`FontWeight.w700`) | 11 | `#FFFFFF` | Normal[cite: 4] |
| **Bottom Action ("Tambah Sensor")**[cite: 4] | Bold (`FontWeight.w700`) | 16 | `#FFFFFF` | Normal[cite: 4] |
| **Bottom Nav Label ("Area")**[cite: 4] | Bold (`FontWeight.w700`) | 11 | `#8B5E34` | Normal[cite: 4] |

---

## 3. Shape & Corner Radii

* **Sensor Card Corner Radius:** `BorderRadius.circular(16.0)`[cite: 4]
* **Image Container Radius:** `BorderRadius.circular(12.0)`[cite: 4]
* **Filter Chip Radius:** `BorderRadius.circular(20.0)` (Pill Shape)[cite: 4]
* **Dropdown Filter Radius:** `BorderRadius.circular(8.0)`[cite: 4]
* **Action Buttons Radius ("Edit" & "Delete"):** `BorderRadius.circular(16.0)` (Soft Pill Shape)[cite: 4]
* **"Tambah Sensor" Button Radius:** `BorderRadius.circular(24.0)` (Full Pill Shape)[cite: 4]
* **Bottom Navigation Bar Clip/Shape:** Custom Curved Bar dengan notch melingkar di tengah[cite: 4].

---

## 4. Spacing & Elevation

* **Screen Margin (Horizontal Padding):** `16.0 dp`[cite: 4]
* **Grid Layout:**
    * **Cross Axis Count:** `2`[cite: 4]
    * **Cross Axis Spacing:** `12.0 dp`[cite: 4]
    * **Main Axis Spacing:** `16.0 dp`[cite: 4]
    * **Child Aspect Ratio:** `~0.72` (Card vertikal portrait)[cite: 4]
* **Card Internal Padding:** `12.0 dp`[cite: 4]
* **Vertical Spacing Values:**
    * **Header to Filter Row:** `16.0 dp`[cite: 4]
    * **Filter Row to Sensor Grid:** `16.0 dp`[cite: 4]
    * **Image to Title ("ESP32"):** `8.0 dp`[cite: 4]
    * **Title to Subtitle ("Area 1"):** `4.0 dp`[cite: 4]
    * **Subtitle to Action Buttons Row:** `10.0 dp`[cite: 4]
    * **Between "Edit" & "Delete" Buttons:** `8.0 dp`[cite: 4]
    * **Grid to "Tambah Sensor" Button:** `16.0 dp`[cite: 4]
* **Elevations & Shadows:**
    * **Sensor Cards:** Subtle Elevation / Outline (`BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: Offset(0, 2))` atau border 1dp `#E0E0E0`)[cite: 4].
    * **Edit / Delete Buttons:** Flat (`0 dp`)[cite: 4].
    * **Tambah Sensor Button:** Flat / Elevation `1-2 dp`[cite: 4].

---

## 5. Layout & Component Structure (Dart/Flutter Architecture)

```text
Scaffold (backgroundColor: Colors.white)
 ├── AppBar / Header Section
 │    └── Row (Icon.arrow_back + Text("Daftar Sensor"))
 │
 ├── Body: Column
 │    ├── Padding(16dp) -> Row (MainAxisAlignment.spaceBetween)
 │    │    ├── Row (Filter Chips)
 │    │    │    ├── ChoiceChip (Selected: false, Label: "Area")
 │    │    │    └── ChoiceChip (Selected: true, Label: "Sensor")
 │    │    └── Container / DropdownButtonHideUnderline (Area Dropdown Filter)
 │    │         └── Row (Text("Area") + Icon.keyboard_arrow_down)
 │    │
 │    ├── Expanded -> GridView.builder (crossAxisCount: 2, childAspectRatio: 0.72)
 │    │    └── Container / Card (White, Rounded 16dp, Border/Shadow)
 │    │         └── Padding(12dp) -> Column (CrossAxisAlignment: CrossAxisAlignment.start)
 │    │              ├── Container (Rounded 12dp, ClipRRect) -> Image.asset("esp32.png")
 │    │              ├── SizedBox(height: 8)
 │    │              ├── Text("ESP32", style: TextStyle(fontWeight: FontWeight.bold))
 │    │              ├── Row -> Icon(eco_outlined, size: 12, color: Green) + Text("Area 1")
 │    │              ├── SizedBox(height: 10)
 │    │              └── Row (Expanded Buttons)
 │    │                   ├── Expanded -> ElevatedButton ("Edit", Yellow, Pill)
 │    │                   ├── SizedBox(width: 8)
 │    │                   └── Expanded -> ElevatedButton ("Delete", Red, Pill)
 │    │
 │    └── Padding(16dp)
 │         └── ElevatedButton ("Tambah Sensor", Green Full Pill)
 │
 └── BottomNavigationBar: CustomNotchedNavigationBar (#F2EFEA)
      ├── NavItem (Icon: home_outlined, Label: "Home")
      ├── NavItem (Icon: history, Label: "Riwayat")
      ├── Center FloatingActionButton (Icon: pie_chart, Green Circle)
      ├── NavItem (Icon: eco, Label: "Area", Selected: true)
      └── NavItem (Icon: person_outline, Label: "Profile")