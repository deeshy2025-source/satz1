import 'package:flutter/material.dart';
import 'package:satz1/core/classes/expertise_data.dart';
import 'package:satz1/core/classes/precesion_section_data.dart';

class ConstHomePage{
  // -------- HERO --------
  static const String heroSub1 =
      'Innovating Electrical & Mechanical Engineering';
  static const String heroSub2 =
      'Precision Engineering for the Future of Aerospace & Beyond';
  static const String heroHighText =
      'Pioneering the design and implementation of cutting-edge, blending excellence.';
  static const String heroHighlight =
      "Pioneering the design and implementation of cutting-edge, blending excellence.";

  // -------- Satz Projects --------
  static const String satzProjectsTitle  = "SATZ projects";
  static const String satzProjectsBody   =
      "SATZ Tech specializes in high-reliability design and prototyping for aerospace "
      "communication systems, ensuring superior accuracy and innovation.";
  static const String satzProjectsButton = "Our Projects";
  static const String satzProjectsImage  = "assets/images/sat1.jpeg";

  // -------- UnderHero --------
  static const String underHeroText =
      "Pioneering the design and implementation of cutting-edge, blending excellence.";

// -------- Expertise section --------

  static const String ourExpertise= "Our Expertise";
  static const String ourExpertiseSubHead="Pioneering the design and implementation of cutting-edges, stems";
  static List<ExpertiseData> card=[

    ExpertiseData(
      title: "Electrical Engineering for Satellite Communication",
      points: [
        "High-reliability Microwave components design",
        "Satellite feed designs",
        "Ferrite-based components",
        "mm-wave components",
        "Corrugated horn antennas",
      ],
    ),
    ExpertiseData(
      title: "Mechanical Engineering Solutions",
      points: [
        "Components Modeling",
        "PIM analysis",
        "Assembly design",
      ],
    ),
     ExpertiseData(
      title: "Prototyping & Testing",
      points: [
        "Fabless company with strong ties to machine shops",
        "Fabrication accuracy up to 0.0005-inch tolerances",
      ],
    ),
  ];

  // -------- Precision section --------
  static List<PrecisionSectionData> items=
 [
   PrecisionSectionData(
      icon: Icons.satellite_alt_outlined,
      title: 'RF & Microwave Components',
      text: 'High-reliability microwave design, satellite feed designs, mm-wave components.',
    ),
   PrecisionSectionData(
      icon: Icons.settings_suggest_outlined,
      title: 'Mechanical Engineering Solutions',
      text: 'Components modeling, PIM analysis, precision assembly design.',
    ),
   PrecisionSectionData(
      icon: Icons.precision_manufacturing_outlined,
      title: 'Prototyping & Fabrication',
      text: 'Fabless model; accuracy up to 0.0005".',
    ),
   PrecisionSectionData(
      icon: Icons.fact_check_outlined,
      title: 'Testing & Validation',
      text: 'Thermal analysis, space-grade reliability tests, compliance checks.',
    ),
  ];


}