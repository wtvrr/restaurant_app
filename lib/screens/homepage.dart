import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Logo - centered and symmetrical
            Center(
              child: Image.asset(
                'assets/pizzalogo.png',
                width: 280,
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 32),
            // Italian quote
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                '"La Pizza è Amore"',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFE65A2E),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            // Description of offerings
            const Text(
              'Pizza • Drinks • Desserts',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFF2F6B3D),
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Restaurant description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: const Text(
                'Experience authentic Italian cuisine crafted with passion. Fresh, premium ingredients combined with traditional recipes.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.7,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            // Opening Hours Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2F6B3D).withOpacity(0.14),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Text(
                        'Opening Hours',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildHourRow('Monday - Friday', '11:00 AM - 10:00 PM'),
                      const SizedBox(height: 12),
                      _buildHourRow('Saturday - Sunday', '12:00 PM - 11:00 PM'),
                      const SizedBox(height: 12),
                      const Text(
                        'Closed on holidays',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // View Menu Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/menupage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE65A2E),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 6,
                    shadowColor: const Color(0xFFE65A2E).withOpacity(0.22),
                  ),
                  child: const Text(
                    'View Menu',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildHourRow(String day, String hours) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          hours,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF2F6B3D),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}