# UI Design Specification Guidelines (Flutter / Dart Target)

Dokumen ini berisi ekstraksi token desain dan panduan struktur komponen untuk mengimplementasikan halaman **Riwayat Kejadian (TaniPintar)** ke dalam kode Flutter/Dart[cite: 5].

---

## 1. Color Palette

* **Primary Accent Green:** `#34A853` / `#2E7D32` (Vibrant Leaf Green)[cite: 5]
    * Digunakan pada: Floating Action Button (FAB) navigasi bawah[cite: 5].
* **Background Canvas:** `#FFFFFF` (Pure White)[cite: 5]
    * Digunakan pada: Background utama layar/scaffold[cite: 5].
* **Card Background:** `#FFFFFF` (Pure White)[cite: 5]
    * Digunakan pada: Card container riwayat item[cite: 5].
* **Filter Dropdown Background:** `#FFFFFF` (White dengan Border)[cite: 5]
    * Digunakan pada: Tombol filter dropdown "Date" dan "Status"[cite: 5].
* **Bottom Navigation Bar Background:** `#F2EFEA` (Warm Off-White / Beige Tint)[cite: 5]
    * Digunakan pada: Container bottom navigation bar[cite: 5].
* **Status Badge Colors:**
    * **Alert / Danger ("Bahaya"):** `#FF2D55` / `#FF3B30` (Bright Red) — Background badge "Bahaya"[cite: 5].
* **Border Colors:**
    * **Card Border:** `#EAEAEA` / `#EEEEEE` (Soft Light Gray)[cite: 5].
    * **Filter Outline:** `#E0E0E0` (Light Gray)[cite: 5].
    * **Divider Card:** `#F5F5F5` (Hairline Divider dalam card)[cite: 5].
* **Text & Icon Colors:**
    * **Text Primary / Title:** `#1E1E1E` (Dark Charcoal / Near Black) — Digunakan untuk judul halaman "Riwayat Kejadian", teks dropdown ("Date", "Status"), label properti ("Area", "Sensor", "Status"), dan value ("2", "Kelembapan 16%")[cite: 5].
    * **Text Secondary / Date:** `#555555` / `#616161` (Muted Dark Gray) — Digunakan untuk header tanggal ("21 Juli 2026")[cite: 5].
    * **Status Badge Text:** `#FFFFFF` (Pure White) — Digunakan pada teks "Bahaya"[cite: 5].
    * **Nav Active Item:** `#8B5E34` / `#1E1E1E` (Dark Olive/Brownish Gray) — Digunakan untuk label & icon "Riwayat" yang terpilih[cite: 5].
    * **Nav Inactive Item:** `#B0BEC5` (Muted Gray/Silver) — Digunakan untuk icon dan teks non-aktif[cite: 5].

---

## 2. Typography Styles

| Role / Element | Font Weight | Approx Size (sp/dp) | Color (Hex) | Line Height / Spacing |
| :--- | :--- | :--- | :--- | :--- |
| **Page Header ("Riwayat Kejadian")**[cite: 5] | Bold (`FontWeight.w800`) | 20 | `#1E1E1E`[cite: 5] | Normal[cite: 5] |
| **Filter Text ("Date", "Status")**[cite: 5] | Medium (`FontWeight.w500`) | 13 | `#1E1E1E`[cite: 5] | Normal[cite: 5] |
| **Card Date Header ("21 Juli 2026")**[cite: 5] | SemiBold (`FontWeight.w600`) | 12 | `#555555`[cite: 5] | Normal[cite: 5] |
| **Field Label ("Area", "Sensor", "Status")**[cite: 5] | Bold (`FontWeight.w700`) | 12 | `#1E1E1E`[cite: 5] | 1.4[cite: 5] |
| **Field Value ("2", "Kelembapan 16%")**[cite: 5] | Regular (`FontWeight.w400`) | 12 | `#1E1E1E`[cite: 5] | 1.4[cite: 5] |
| **Badge Text ("Bahaya")**[cite: 5] | Bold (`FontWeight.w700`) | 11 | `#FFFFFF`[cite: 5] | Normal[cite: 5] |
| **Bottom Nav Label ("Riwayat")**[cite: 5] | Bold (`FontWeight.w700`) | 11 | `#8B5E34`[cite: 5] | Normal[cite: 5] |

---

## 3. Shape & Corner Radii

* **History Item Card:** `BorderRadius.circular(16.0)`[cite: 5]
* **Filter Dropdown Button:** `BorderRadius.circular(10.0)`[cite: 5]
* **Status Badge ("Bahaya"):** `BorderRadius.circular(6.0)` (Soft Pill / Rounded Rect)[cite: 5]
* **Bottom Navigation Bar Clip/Shape:** Custom Curved Bar dengan notch melingkar di tengah[cite: 5].
* **Center FAB Shape:** `BoxShape.circle`[cite: 5]

---

## 4. Spacing & Elevation

* **Screen Margin (Horizontal Padding):** `16.0 dp`[cite: 5]
* **Card Internal Padding:**
    * Header date padding: `12.0 dp horizontal, 10.0 dp vertical`[cite: 5]
    * Content body padding: `12.0 dp horizontal, 10.0 dp vertical`[cite: 5]
* **Vertical Spacing Values:**
    * **Page Header to Filters:** `16.0 dp`[cite: 5]
    * **Filters to Card List:** `16.0 dp`[cite: 5]
    * **Between History Cards:** `12.0 dp`[cite: 5]
    * **Between Rows Inside Card:** `6.0 dp`[cite: 5]
* **Horizontal Spacing:**
    * **Between Filter Buttons:** `10.0 dp`[cite: 5]
* **Elevations & Shadows:**
    * **History Card:** Subtle outline (`Border.all(color: #EAEAEA, width: 1.0)`) atau flat dengan soft shadow (`BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: Offset(0, 2))`)[cite: 5].
    * **Filter Buttons:** Flat (`0 dp`) dengan outline `1.0 dp`[cite: 5].

---

## 5. Layout & Component Structure (Dart/Flutter Architecture)

```text
Scaffold (backgroundColor: Colors.white)
 ├── AppBar / Header Section
 │    └── Row (Icon.arrow_back + Text("Riwayat Kejadian"))
 │
 ├── Body: Column
 │    ├── Padding(16dp horizontal) -> Row (Filters Row)
 │    │    ├── FilterButton (Icon: calendar_today_outlined, Text: "Date", Icon: keyboard_arrow_down)
 │    │    ├── SizedBox(width: 10)
 │    │    └── FilterButton (Icon: filter_alt_outlined, Text: "Status", Icon: keyboard_arrow_down)
 │    │
 │    └── Expanded -> ListView.builder (Padding: 16dp horizontal, ItemSpacing: 12dp)
 │         └── Container / Card (White, Rounded 16dp, Border: #EAEAEA)
 │              └── Column (CrossAxisAlignment: CrossAxisAlignment.start)
 │                   ├── Padding(12dp) -> Text("21 Juli 2026", style: DateStyle)
 │                   ├── Divider(height: 1, color: #F5F5F5)
 │                   └── Padding(12dp) -> Column
 │                        ├── Row (SpaceBetween)
 │                        │    ├── Text("Area", style: LabelStyle)
 │                        │    └── Text("2", style: ValueStyle)
 │                        ├── SizedBox(height: 6)
 │                        ├── Row (SpaceBetween)
 │                        │    ├── Text("Sensor", style: LabelStyle)
 │                        │    └── Text("Kelembapan 16%", style: ValueStyle)
 │                        ├── SizedBox(height: 6)
 │                        └── Row (SpaceBetween)
 │                             ├── Text("Status", style: LabelStyle)
 │                             └── BadgeContainer (Color: #FF2D55, Radius: 6dp)
 │                                  └── Text("Bahaya", style: BadgeStyle)
 │
 └── BottomNavigationBar: CustomNotchedNavigationBar (#F2EFEA)
      ├── NavItem (Icon: home_outlined, Label: "Home")
      ├── NavItem (Icon: history, Label: "Riwayat", Selected: true)
      ├── Center FloatingActionButton (Icon: pie_chart, Green Circle)
      ├── NavItem (Icon: eco_outlined, Label: "Area")
      └── NavItem (Icon: person_outline, Label: "Profile")