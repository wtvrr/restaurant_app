import 'package:flutter/material.dart';
import '../data/dishes.dart';

class Menupage extends StatefulWidget {
  const Menupage({super.key});

  @override
  _MenupageState createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  final List<String> categories = ['meat', 'vegetarian', 'vegan', 'drinks', 'desserts'];

  final Map<String, IconData> categoryIcons = {
    'meat': Icons.dinner_dining,
    'vegetarian': Icons.grass,
    'vegan': Icons.eco,
    'drinks': Icons.local_drink,
    'desserts': Icons.cake,
  };

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final filteredDishes = selectedCategory != null ? allDishes.where((d) => d.category == selectedCategory).toList() : [];
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFE65A2E),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // Category buttons in horizontal scroll
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              children: categories.map((category) {
                bool isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? const Color(0xFF2F6B3D) : Colors.white,
                        border: Border.all(
                          color: const Color(0xFF2F6B3D).withOpacity(0.25),
                          width: 2.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected ? const Color(0xFF2F6B3D).withOpacity(0.3) : Colors.black12,
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categoryIcons[category],
                            color: isSelected ? Colors.white : const Color(0xFF2F6B3D),
                            size: 42,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category.toUpperCase(),
                            style: TextStyle(
                              color: isSelected ? Colors.white : const Color(0xFF2F6B3D),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore our menu',
                style: const TextStyle(
                  color: Color(0xFF2F6B3D),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Menu items list
          Expanded(
            child: selectedCategory != null
                ? ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    itemCount: filteredDishes.length,
                    itemBuilder: (context, index) {
                      final dish = filteredDishes[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Details without image
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dish.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          dish.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Kcal: ${dish.kcal}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          dish.price,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF2F6B3D),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        // Info title with icon
                                        GestureDetector(
                                          onTap: () => Navigator.pushNamed(context, '/dish_detail', arguments: dish),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFF8F5),
                                              borderRadius: BorderRadius.circular(6.0),
                                              border: Border.all(
                                                color: const Color(0xFF2F6B3D).withOpacity(0.2),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.info_outline,
                                                  size: 14,
                                                  color: const Color(0xFF2F6B3D),
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  'Nutritional Info',
                                                  style: const TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF2F6B3D),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Add button
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE65A2E),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 20),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('${dish.name} added!'),
                                            backgroundColor: const Color(0xFF2F6B3D),
                                            duration: const Duration(milliseconds: 1500),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant_menu,
                          size: 64,
                          color: const Color(0xFF2F6B3D).withOpacity(0.22),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Select a category',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}