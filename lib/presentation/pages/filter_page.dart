import 'package:aimuse/core/config/design_config.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/section_tile.dart';
import 'date_page.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> whenOptions = [
    'Today',
    'Tomorrow',
    'This weekend',
    'Choose date',
  ];
  String selectedWhen = 'Today';

  double minDistance = 0.7;
  double maxDistance = 6.0;
  RangeValues distanceRange = RangeValues(0.7, 6.0);

  final List<String> categories = [
    'Arts',
    'Theater',
    'Gallery',
    'Museum',
    'Park',
    'Music',
    'Show',
    'Cinema',
    'Exhibition',
  ];
  final Set<String> selectedCategories = {};

  bool onlyFree = false;

  final List<String> sortOptions = ['Date', 'Relevance'];
  String selectedSort = 'Date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text('Filter', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: clearAll,
            child: Text(
              'Clear all',
              style: TextStyle(color: DesignConfig.buttonColor),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListView(
                children: [
                  SectionTitle('When'),
                  Wrap(
                    spacing: 8,
                    children: whenOptions.map((opt) {
                      final bool isChoose = opt == 'Choose date';
                      final bool selected = selectedWhen == opt;
                      return ChoiceChip(
                        selectedColor: DesignConfig.selectedColor,
                        label: Text(opt),
                        selected: selected,
                        onSelected: (_) {
                          if (isChoose) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => DateRangePage()),
                            );
                            return;
                          }
                          setState(() => selectedWhen = opt);
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24),

                  SectionTitle('Destination range'),
                  RangeSlider(
                    activeColor: DesignConfig.sliderActiveColor,
                    min: minDistance,
                    max: maxDistance,
                    values: distanceRange,
                    onChanged: (r) => setState(() => distanceRange = r),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Min ${distanceRange.start.toStringAsFixed(1)} km'),
                      Text('Max ${distanceRange.end.toStringAsFixed(1)} km'),
                    ],
                  ),
                  SizedBox(height: 24),

                  SectionTitle('Categories'),
                  Wrap(
                    spacing: 8,
                    children: categories.map((cat) {
                      final bool selected = selectedCategories.contains(cat);
                      return FilterChip(
                        selectedColor: DesignConfig.selectedColor,
                        label: Text(cat),
                        selected: selected,
                        onSelected: (v) => setState(() {
                          if (v) {
                            selectedCategories.add(cat);
                          } else {
                            selectedCategories.remove(cat);
                          }
                        }),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24),

                  SectionTitle('Price'),
                  SwitchListTile(
                    activeColor: DesignConfig.sliderActiveColor,
                    contentPadding: EdgeInsets.zero,
                    title: Text('Only free events'),
                    value: onlyFree,
                    onChanged: (v) => setState(() => onlyFree = v),
                  ),
                  SizedBox(height: 24),

                  SectionTitle('Sort'),
                  Wrap(
                    spacing: 8,
                    children: sortOptions.map((opt) {
                      final bool selected = selectedSort == opt;
                      return ChoiceChip(
                        selectedColor: DesignConfig.selectedColor,
                        label: Text(opt),
                        selected: selected,
                        onSelected: (_) => setState(() => selectedSort = opt),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Static Apply Filter button
          Padding(
            padding: const EdgeInsets.only(left: 20, right:20, bottom: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignConfig.buttonColor,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Apply Filter',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, onTap: (_) {}),
    );
  }

  void clearAll() {
    setState(() {
      selectedWhen = 'Today';
      distanceRange = RangeValues(minDistance, maxDistance);
      selectedCategories.clear();
      onlyFree = false;
      selectedSort = 'Date';
    });
  }
}
