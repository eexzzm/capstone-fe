import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/colorScheme.dart';
import '../../../widgets/app_button.dart';
import '../providers/area_provider.dart';
import '../models/area_model.dart';
import '../models/sensor_model.dart';

class AreaScreen extends StatefulWidget {
  static const routeName = '/area';

  const AreaScreen({super.key});

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  int _selectedChipIndex = 0;

  @override
  void initState() {
    super.initState();
    // call fetchAreas and fetchSensors for a real app scenario later
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final provider = context.read<AreaProvider>();
    //   provider.fetchAreas();
    //   provider.fetchSensors();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final areaProvider = context.watch<AreaProvider>();

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
          // Filter Chips and Area Filter
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildChoiceChip("Area", 0),
                    const SizedBox(width: 8),
                    _buildChoiceChip("Sensor", 1),
                  ],
                ),
                if (_selectedChipIndex == 1) // Only show on Sensor tab
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: null, // Change to a state variable later if filtering is implemented
                        hint: const Text(
                          "Area",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.textPrimary),
                        isDense: true,
                        items: [
                          const DropdownMenuItem<int>(
                            value: 0,
                            child: Text("Semua Area"),
                          ),
                          ...areaProvider.areas.map(
                            (area) => DropdownMenuItem<int>(
                              value: area.id,
                              child: Text(area.name.isNotEmpty ? area.name : "Area ${area.id}"),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          // TODO: Apply filter when pressed
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // List of Areas or Sensors
          Expanded(
            child: _selectedChipIndex == 0
                ? _buildAreaList(areaProvider.areas)
                : _buildSensorList(areaProvider.sensors),
          ),
          // Tambah Button
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 20.0),
            child: AppButton(
              text: _selectedChipIndex == 0 ? "Tambah Area" : "Tambah Sensor",
              onPressed: () {},
              backgroundColor: AppColors.areaAccent,
              textColor: Colors.white,
              borderRadius: 24.0,
              elevation: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAreaList(List<AreaModel> areas) {
    if (areas.isEmpty) {
      return const Center(
        child: Text(
          "Belum ada data area.",
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: areas.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: _buildAreaCard(areas[index]),
        );
      },
    );
  }

  Widget _buildSensorList(List<SensorModel> sensors) {
    if (sensors.isEmpty) {
      return const Center(
        child: Text(
          "Belum ada data sensor.",
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.72,
      ),
      itemCount: sensors.length,
      itemBuilder: (context, index) {
        return _buildSensorCard(sensors[index]);
      },
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
      selectedColor: AppColors.areaAccent,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppColors.areaAccent,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: const BorderSide(
          color: AppColors.areaAccent,
        ),
      ),
      showCheckmark: false,
    );
  }

  Widget _buildAreaCard(AreaModel area) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
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
                area.name.isNotEmpty ? area.name : "Area ${area.id}",
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.check_circle,
                color: AppColors.accentGreen,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 12),
          // Metrics Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetricItem(Icons.sensors, "Total Sensor", "${area.sensorsCount}"),
              AppButton(
                text: "Detail",
                onPressed: () {},
                backgroundColor: AppColors.areaAccent,
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

  Widget _buildSensorCard(SensorModel sensor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Placeholder
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundCanvas, // Muted gray
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Icon(Icons.memory, size: 48, color: AppColors.textHint),
              ),
            ),
            const SizedBox(height: 8),
            // Title
            Text(
              sensor.name.isNotEmpty ? sensor.name : "Sensor ${sensor.id}",
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Subtitle
            Row(
              children: [
                const Icon(Icons.eco_outlined, size: 12, color: AppColors.areaAccent),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    "Area ${sensor.areaId}",
                    style: const TextStyle(
                      color: AppColors.areaAccent,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Actions
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: "Edit",
                    onPressed: () {},
                    backgroundColor: AppColors.actionEdit,
                    textColor: AppColors.textPrimary,
                    borderRadius: 16.0,
                    elevation: 0,
                    height: 28.0,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w700,
                    padding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppButton(
                    text: "Delete",
                    onPressed: () {},
                    backgroundColor: AppColors.actionDelete,
                    textColor: Colors.white,
                    borderRadius: 16.0,
                    elevation: 0,
                    height: 28.0,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w700,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textSecondary, size: 20),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textSecondary,
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
