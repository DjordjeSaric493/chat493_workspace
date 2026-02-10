import 'package:flutter/material.dart';
import '../const/colors.dart'; // Proveri da li su ovde definisane tvoje boje

class BusWidget extends StatelessWidget {
  final Widget child; // Sadržaj (forma)
  final String topText; // Tekst na tabli (npr. "493 MLADENOVAC")
  final double? width;

  const BusWidget({
    super.key,
    required this.child,
    required this.topText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Postavljamo širinu autobusa
    final busWidth = width ?? (screenWidth > 450 ? 400.0 : screenWidth * 0.9);

    return Container(
      width: busWidth,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.red, // Glavna boja autobusa
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. GORNJA TABLA (Linija autobusa)
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white10, width: 1),
            ),
            alignment: Alignment.center,
            child: Text(
              topText,
              style: const TextStyle(
                color: AppColors.lightYellow,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontFamily: 'Courier', // Daje onaj retro digitalni izgled table
              ),
            ),
          ),

          const SizedBox(height: 25),

          // 2. ŠOFERŠAJBNA / SADRŽAJ (Tvoja forma ide ovde)
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: child,
          ),

          const SizedBox(height: 25),

          // 3. DONJA MASKA (Farovi i branik)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeadlight(), // Levi far
              // Središnji logo ili rešetka
              const Icon(
                Icons.directions_bus,
                size: 40,
                color: AppColors.lightGrey,
              ),
              _buildHeadlight(), // Desni far
            ],
          ),
        ],
      ),
    );
  }

  // Pomoćni widget za farove autobusa
  Widget _buildHeadlight() {
    return Container(
      width: 45,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightYellow.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
    );
  }
}
