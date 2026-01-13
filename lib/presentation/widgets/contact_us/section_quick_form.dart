import 'package:flutter/material.dart';
import 'package:satz1/presentation/widgets/contact_us/quick_badge.dart';
import 'package:satz1/presentation/widgets/contact_us/quick_form_card.dart';
import '../../../core/constants/const_size.dart';

class SectionQuickForm extends StatelessWidget {
  const SectionQuickForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: ConstSize.padding_16,
        vertical: 32,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuickBadge(),
              SizedBox(width: 24),
              Expanded(child: QuickFormCard()),
            ],
          ),
        ),
      ),
    );
  }
}