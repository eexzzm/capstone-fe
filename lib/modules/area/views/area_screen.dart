import 'package:flutter/material.dart';
import '../../../utils/colorScheme.dart';
import '../../../widgets/app_button.dart';

class AreaScreen extends StatefulWidget {
  static const routeName = '/area';

  const AreaScreen({super.key});

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  int _selectedChipIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCanvas,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCanvas,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          "Daftar Area",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          // Filter Chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                _buildChoiceChip("Area", 0),
                const SizedBox(width: 8),
                _buildChoiceChip("Sensor", 1),
              ],
            ),
          ),
          // List of Areas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: 3, // Mock data
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildAreaCard(index + 1),
                );
              },
            ),
          ),
          // Tambah Area Button
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 20.0),
            child: AppButton(
              text: "Tambah Area",
              onPressed: () {},
              backgroundColor: const Color(0xFF3B9E59), // Primary/Accent Green
              textColor: Colors.white,
              borderRadius: 24.0,
              elevation: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(String label, int index) {
    final isSelected = _selectedChipIndex == index;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedChipIndex = index;
        });
      },
      selectedColor: const Color(0xFF3B9E59),
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : const Color(0xFF3B9E59),
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: Color(0xFF3B9E59),
        ),
      ),
      showCheckmark: false,
    );
  }

  Widget _buildAreaCard(int index) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: const Color(0xFFF0F0F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header (Title and check icon)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Area $index",
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.check_circle,
                color: Color(0xFF34A853),
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: Color(0xFFF0F0F0), height: 1),
          const SizedBox(height: 12),
          // Metrics Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetricItem(Icons.water_drop, "Kelembaban", "67%"),
              _buildMetricItem(Icons.thermostat, "Suhu", "32°C"),
              AppButton(
                text: "Detail",
                onPressed: () {},
                backgroundColor: const Color(0xFF3B9E59),
                textColor: Colors.white,
                borderRadius: 20.0,
                elevation: 0,
                height: 32.0,
                isFullWidth: false,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF555555), size: 20),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF555555),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
