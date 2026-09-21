# UI Design Specification Guidelines (Flutter / Dart Target)

Dokumen ini berisi ekstraksi token desain dan panduan struktur komponen untuk mengimplementasikan halaman **Dashboard (TaniPintar)** ke dalam kode Flutter/Dart[cite: 2].

---

## 1. Color Palette

* **Primary / Brand Accent:** `#34A853` / `#2E7D32` (Vibrant Leaf Green)[cite: 2]
    * Digunakan pada: Floating Action Button (FAB) navigasi bawah[cite: 2].
* **Card Background / Tint:** `#E8F5E9` (Soft Light Mint Green)[cite: 2]
    * Digunakan pada: Background 4 kartu ringkasan (Area, Kejadian Hari Ini, Tanaman Sehat, Tanaman Sakit)[cite: 2].
* **Background Canvas:** `#FFFFFF` (Pure White)[cite: 2]
    * Digunakan pada: Background utama layar/scaffold[cite: 2].
* **Bottom Navigation Bar Background:** `#F2EFEA` (Warm Off-White / Beige Tint)[cite: 2]
    * Digunakan pada: Background container bottom navigation bar[cite: 2].
* **Status Badge Colors:**
    * **Danger / Alert (Bahaya):** `#FF3B30` / `#FF2D55` (Bright Red) — Background badge "Bahaya"[cite: 2].
    * **Warning / Caution (Waspada):** `#FFE600` / `#FFCC00` (Bright Yellow) — Background badge "Waspada"[cite: 2].
* **Text & Icon Colors:**
    * **Text Primary / Headings:** `#1E1E1E` (Dark Charcoal / Near Black) — Digunakan untuk Judul "Dashboard", "Ringkasan Kebun", "Kejadian Terbaru", angka metrik utama, dan header tabel[cite: 2].
    * **Text Secondary:** `#4A4A4A` (Medium Gray) — Digunakan untuk label kartu ringkasan dan isi baris tabel[cite: 2].
    * **Status Text:** `#FFFFFF` (White) pada badge Bahaya, `#333333` (Dark Gray) pada badge Waspada[cite: 2].
    * **Nav Unselected Item:** `#B0BEC5` (Muted Gray/Silver) — Digunakan untuk icon dan label navigasi non-aktif[cite: 2].
    * **Nav Selected FAB Icon:** `#1E1E1E` / Dark Green[cite: 2].
* **Divider / Border Color:** `#EEEEEE` (Very Light Gray) — Digunakan pada garis bawah header tabel[cite: 2].

---

## 2. Typography Styles

| Role / Element | Font Weight | Approx Size (sp/dp) | Color (Hex) | Line Height / Spacing |
| :--- | :--- | :--- | :--- | :--- |
| **Page Header ("Dashboard")**[cite: 2] | Bold (`FontWeight.w800`) | 20 | `#1E1E1E` | Normal[cite: 2] |
| **Section Title ("Ringkasan Kebun", dll)**[cite: 2] | Bold (`FontWeight.w700`) | 18 | `#1E1E1E` | 1.3[cite: 2] |
| **Metric Card Label ("Area", "Tanaman Sehat")**[cite: 2] | SemiBold (`FontWeight.w600`) | 13 | `#4A4A4A` | 1.2[cite: 2] |
| **Metric Card Value ("6", "43", "4")**[cite: 2] | Bold (`FontWeight.w800`) | 24 | `#1E1E1E` | Normal[cite: 2] |
| **Table Header ("No", "Area", "Sensor", "Status")**[cite: 2] | Bold (`FontWeight.w700`) | 12 | `#1E1E1E` | Normal[cite: 2] |
| **Table Row Content**[cite: 2] | Regular (`FontWeight.w400`) | 12 | `#333333` | Normal[cite: 2] |
| **Badge Text ("Bahaya", "Waspada")**[cite: 2] | Bold (`FontWeight.w700`) | 11 | `#FFFFFF` / `#333333` | Normal[cite: 2] |
| **Bottom Nav Label ("Home", "Riwayat", dll)**[cite: 2] | Medium (`FontWeight.w500`) | 11 | `#B0BEC5` | Normal[cite: 2] |

---

## 3. Shape & Corner Radii

* **Metric Grid Cards Corner Radius:** `BorderRadius.circular(16.0)`[cite: 2]
* **Status Badges Corner Radius:** `BorderRadius.circular(6.0)` (Pill / Soft Rectangle)[cite: 2]
* **Bottom Navigation Bar Clip/Shape:** Custom Curved Bar / `BorderRadius.vertical(top: Radius.circular(20.0))` dengan notch melingkar di tengah[cite: 2].
* **Center FAB Shape:** `BoxShape.circle`[cite: 2]

---

## 4. Spacing & Elevation

* **Screen Margin (Horizontal Padding):** `16.0 dp`[cite: 2]
* **Grid Spacing (Between Metric Cards):** `12.0 dp` (CrossAxis & MainAxis Spacing)[cite: 2]
* **Card Internal Padding:** `12.0 dp - 16.0 dp`[cite: 2]
* **Vertical Spacing Values:**
    * **Top Bar to Section Title:** `20.0 dp`[cite: 2]
    * **Section Title to Grid Cards:** `12.0 dp`[cite: 2]
    * **Grid Cards to Next Section Title:** `28.0 dp`[cite: 2]
    * **Table Title to Table Header:** `12.0 dp`[cite: 2]
    * **Between Table Rows:** `12.0 dp`[cite: 2]
* **Table Column Layout Width Ratio:**
    * `No`: `Flex 1` (~30dp)[cite: 2]
    * `Area`: `Flex 1` (~40dp)[cite: 2]
    * `Sensor`: `Flex 4` (Flexible fill)[cite: 2]
    * `Status`: `Flex 2` (~70dp)[cite: 2]
* **Elevations & Shadows:**
    * **Metric Cards:** Elevation `0` (Flat with color fill)[cite: 2].
    * **Bottom Navigation Bar:** Mild top shadow (`BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2))`)[cite: 2].
    * **Center FAB:** Medium Shadow (`BoxShadow(color: Color(0x4034A853), blurRadius: 10, offset: Offset(0, 4))`)[cite: 2].

---

## 5. Layout & Component Structure (Dart/Flutter Architecture)

```text
Scaffold (backgroundColor: Colors.white)
 ├── AppBar / Header Section
 │    └── Row (Icon.arrow_back + Text("Dashboard"))
 │
 ├── Body: SingleChildScrollView + Padding(16dp)
 │    └── Column (CrossAxisAlignment: CrossAxisAlignment.start)
 │         ├── Text("Ringkasan Kebun", style: SectionTitleStyle)
 │         ├── SizedBox(height: 12)
 │         │
 │         ├── GridView.count (crossAxisCount: 2, childAspectRatio: 1.3, spacing: 12)
 │         │    ├── MetricCard (Icon: home_outlined, Label: "Area", Value: "6")
 │         │    ├── MetricCard (Icon: calendar_today, Label: "Kejadian Hari Ini", Value: "2")
 │         │    ├── MetricCard (Icon: crop_free_heart, Label: "Tanaman Sehat", Value: "43")
 │         │    └── MetricCard (Icon: crop_free_alert, Label: "Tanaman Sakit", Value: "4")
 │         │
 │         ├── SizedBox(height: 28)
 │         ├── Text("Kejadian Terbaru", style: SectionTitleStyle)
 │         ├── SizedBox(height: 12)
 │         │
 │         └── Table / Custom Column (Kejadian Terbaru)
 │              ├── TableHeaderRow ("No", "Area", "Sensor", "Status")
 │              ├── Divider(color: #EEEEEE)
 │              ├── TableDataRow ("1", "2", "Kelambapan tanah 20%", Badge(text: "Bahaya", color: Red))
 │              └── TableDataRow ("2", "1", "Kelambapan tanah 10%", Badge(text: "Waspada", color: Yellow))
 │
 └── BottomNavigationBar: CustomNotchedNavigationBar (#F2EFEA)
      ├── NavItem (Icon: home, Label: "Home")
      ├── NavItem (Icon: history, Label: "Riwayat")
      ├── Center FloatingActionButton Position: FloatingActionButtonLocation.centerDocked
      │    └── FAB (#34A853, Circle) -> Icon(pie_chart_outlined / analytics)
      ├── NavItem (Icon: eco_outlined, Label: "Area")
      └── NavItem (Icon: person_outline, Label: "Profile")