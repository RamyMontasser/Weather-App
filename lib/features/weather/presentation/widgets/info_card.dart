import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.icon, required this.title, required this.value, });

  final String icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(icon,color: Colors.white54, width: 18),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}