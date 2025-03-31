import 'package:flutter/material.dart';

Container buildProfileDetails({
  required String title,
  required String description,
  required IconData icon,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.grey.shade200, // Light background
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.black54, size: 20), // Leading Icon
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            description.isNotEmpty ? description : "N/A",
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    ),
  );
}
