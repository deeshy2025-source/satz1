import 'package:flutter/material.dart';
import '../../../core/constants/const_size.dart';
import '../../../core/constants/const_strings.dart';
import '../../../core/constants/const_text.dart';
import 'our_values_image.dart';
import 'our_values_list.dart';


class SectionOurValues extends StatelessWidget {
  const SectionOurValues({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWide =
        MediaQuery.of(context).size.width >= ConstSize.valuesBreakpoint;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(ConstSize.valuesPadding),
      margin: const EdgeInsets.all(ConstSize.valuesPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: ConstSize.valuesMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                ConstStrings.valuesTitle,
                style: ConstText.sectionTitle(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),


              if (isWide)
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(flex: 5, child: ValuesImage()),
                    SizedBox(width: ConstSize.valuesGap),

                    Expanded(flex: 7, child: ValuesList()),
                  ],
                )
              else
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ValuesImage(),
                    SizedBox(height: ConstSize.valuesGap),
                    ValuesList(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}