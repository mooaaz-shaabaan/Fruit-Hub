import 'package:flutter/material.dart';

class SortByScreen extends StatefulWidget {
  final String? initialSortOption;

  const SortByScreen({super.key, this.initialSortOption});

  @override
  State<SortByScreen> createState() => _SortByScreenState();
}

class _SortByScreenState extends State<SortByScreen> {
  String? _selectedSortOption;

  @override
  void initState() {
    super.initState();


    _selectedSortOption = widget.initialSortOption ?? 'newest';
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
                onPressed: () => Navigator.pop(context, _selectedSortOption),
              ),
            ),
            const SizedBox(height: 10),


            RadioListTile<String>(
              title: const Text(
                'الأقل في الأعلى',
                style: TextStyle(fontSize: 16),
              ),
              value: 'lowest_price',
              groupValue: _selectedSortOption,
              onChanged: (value) {
                setState(() {
                  _selectedSortOption = value;
                });
              },
              activeColor: darkGreen,
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile<String>(
              title: const Text(
                'الأعلى في الأسفل',
                style: TextStyle(fontSize: 16),
              ),
              value: 'highest_price',
              groupValue: _selectedSortOption,
              onChanged: (value) {
                setState(() {
                  _selectedSortOption = value;
                });
              },
              activeColor: darkGreen,
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile<String>(
              title: const Text(
                'الأحدث',
                style: TextStyle(fontSize: 16),
              ),
              value: 'newest',
              groupValue: _selectedSortOption,
              onChanged: (value) {
                setState(() {
                  _selectedSortOption = value;
                });
              },
              activeColor: darkGreen,
              contentPadding: EdgeInsets.zero,
            ),


            const SizedBox(height: 20),

            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.pop(context, _selectedSortOption);
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