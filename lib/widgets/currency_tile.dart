import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import '../models/currency.dart';
import '../theme/app_theme.dart';

class CurrencyTile extends StatelessWidget {
  final String label;
  final Currency currency;
  final VoidCallback onTap;

  const CurrencyTile({
    super.key,
    required this.label,
    required this.currency,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
           BoxShadow(
           color: Colors.black.withValues(alpha: 0.2),
         blurRadius: 4,
        offset: const Offset(0, 2),
      )
    ]
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(14),
    child: Flag.fromString(
      currency.countryCode,
      height: 46,
      width: 46,
      fit: BoxFit.cover,
        ),
       ),
       ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    currency.code,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    currency.name,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}