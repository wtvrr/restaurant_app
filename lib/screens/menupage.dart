import 'package:flutter/material.dart';

class Menupage extends StatefulWidget {
  const Menupage({super.key});

  @override
  _MenupageState createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  final Map<String, List<Map<String, dynamic>>> menuItems = {
    'meat': [
      {'name': 'Pepperoni Pizza', 'kcal': '650 kcal', 'price': '€12.99', 'image': 'assets/images/pepperoni_pizza.jpg'},
      {'name': 'BBQ Chicken Pizza', 'kcal': '700 kcal', 'price': '€13.99', 'image': 'assets/images/bbq_chicken_pizza.jpg'},
      {'name': 'Salami Supreme', 'kcal': '680 kcal', 'price': '€13.49', 'image': 'assets/images/salami_supreme.jpg'},
      {'name': 'Prosciutto Pizza', 'kcal': '720 kcal', 'price': '€14.49', 'image': 'assets/images/prosciutto_pizza.jpg'},
    ],
    'vegetarian': [
      {'name': 'Margherita Pizza', 'kcal': '500 kcal', 'price': '€9.99', 'image': 'assets/images/margherita_pizza.jpg'},
      {'name': 'Four Cheese Pizza', 'kcal': '620 kcal', 'price': '€11.99', 'image': 'assets/images/four_cheese_pizza.jpg'},
      {'name': 'Spinach Ricotta Pizza', 'kcal': '580 kcal', 'price': '€12.49', 'image': 'assets/images/spinach_ricotta_pizza.jpg'},
      {'name': 'Caprese Pizza', 'kcal': '540 kcal', 'price': '€11.49', 'image': 'assets/images/caprese_pizza.jpg'},
    ],
    'vegan': [
      {'name': 'Vegan Margherita', 'kcal': '420 kcal', 'price': '€10.99', 'image': 'assets/images/vegan_margherita.jpg'},
      {'name': 'Vegan Veggie Delight', 'kcal': '460 kcal', 'price': '€12.49', 'image': 'assets/images/vegan_veggie_delight.jpg'},
      {'name': 'Vegan Mushroom Spinach', 'kcal': '440 kcal', 'price': '€11.99', 'image': 'assets/images/vegan_mushroom_spinach.jpg'},
      {'name': 'Vegan BBQ Jackfruit Pizza', 'kcal': '480 kcal', 'price': '€13.49', 'image': 'assets/images/vegan_bbq_jackfruit.jpg'},
    ],
    'drinks': [
      {'name': 'Coca-Cola (0.33L)', 'kcal': '140 kcal', 'price': '€2.99', 'image': 'assets/images/coca_cola.jpg'},
      {'name': 'Still Water (0.5L)', 'kcal': '0 kcal', 'price': '€1.99', 'image': 'assets/images/still_water.jpg'},
      {'name': 'Fresh Lemonade', 'kcal': '120 kcal', 'price': '€3.99', 'image': 'assets/images/fresh_lemonade.jpg'},
      {'name': 'Iced Tea Peach', 'kcal': '110 kcal', 'price': '€3.49', 'image': 'assets/images/iced_tea_peach.jpg'},
    ],
    'desserts': [
      {'name': 'Tiramisu', 'kcal': '450 kcal', 'price': '€5.99', 'image': 'assets/images/tiramisu.jpg'},
      {'name': 'Chocolate Lava Cake', 'kcal': '520 kcal', 'price': '€6.49', 'image': 'assets/images/chocolate_lava_cake.jpg'},
      {'name': 'Panna Cotta (Vanilla)', 'kcal': '380 kcal', 'price': '€5.49', 'image': 'assets/images/panna_cotta.jpg'},
      {'name': 'Gelato (2 Scoops)', 'kcal': '300 kcal', 'price': '€4.99', 'image': 'assets/images/gelato.jpg'},
    ],
  };

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
              children: menuItems.keys.map((category) {
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
                    itemCount: menuItems[selectedCategory]!.length,
                    itemBuilder: (context, index) {
                      final item = menuItems[selectedCategory]![index];
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
                                  // Image with centered category icon overlay
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(item['image']),
                                              fit: BoxFit.cover,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black.withOpacity(0.6),
                                                  const Color(0xFF2F6B3D).withOpacity(0.4),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              categoryIcons[selectedCategory],
                                              size: 40,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16.0),
                                  // Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          'Kcal: ${item['kcal']}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['price'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF2F6B3D),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        // Info title with icon
                                        Container(
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
                                            content: Text('${item['name']} added!'),
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