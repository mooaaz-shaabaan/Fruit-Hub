import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  RangeValues _priceRange = const RangeValues(0, 300);


  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();

    _minPriceController = TextEditingController(text: _priceRange.start.round().toString());
    _maxPriceController = TextEditingController(text: _priceRange.end.round().toString());


    _minPriceController.addListener(() {
      final value = double.tryParse(_minPriceController.text);
      if (value != null && value >= 0 && value <= _priceRange.end) {
        setState(() {
          _priceRange = RangeValues(value, _priceRange.end);
        });
      }
    });

    _maxPriceController.addListener(() {
      final value = double.tryParse(_maxPriceController.text);
      if (value != null && value >= _priceRange.start && value <= 500) {
        setState(() {
          _priceRange = RangeValues(_priceRange.start, value);
        });
      }
    });
  }

  @override
  void dispose() {

    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    const Color darkGreen = Color(0xFF1E814B);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 10),


            const Text(
              'السعر:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),


            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minPriceController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'من',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: darkGreen, width: 1),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '-',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _maxPriceController, // ربط الـ controller
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: 'إلى',
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: darkGreen, width: 1),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Price Range Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4.0,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
                activeTrackColor: darkGreen,
                inactiveTrackColor: Colors.grey[300],
                thumbColor: darkGreen,
                overlayColor: darkGreen.withOpacity(0.2),
                valueIndicatorTextStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: RangeSlider(
                values: _priceRange,
                min: 0,
                max: 500,
                divisions: 500,
                labels: RangeLabels(
                  _priceRange.start.round().toString(),
                  _priceRange.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRange = values;

                    _minPriceController.text = values.start.round().toString();
                    _maxPriceController.text = values.end.round().toString();
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'تصفيه',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}