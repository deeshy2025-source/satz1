import 'package:flutter/material.dart';
import 'package:satz1/core/classes/expertise_data.dart';
import 'package:satz1/core/classes/precesion_section_data.dart';

class ConstHomePage{
  // -------- HERO --------
  static const String heroSub1 =
      'Innovative Electrical & Mechanical Engineering Solutions';
  static const String heroSub2 =
      'Electrical and Mechanical Engineering consultation for the Future of Defense and Space applications';
  static const String heroHighText =
      'Cutting edge solutions for the design and implementation of microwave components and assemblies.';
  static const String heroHighlight =
      "Leading corporate in the design and the assessment of microwave systems.";

  // -------- Satz Projects --------
  static const String satzProjectsTitle  = "SATZ projects";
  static const String satzProjectsBody   =
      "SATZ-Tech specializes in high-reliability design and prototyping for defense and Space "
      "communication systems, ensuring superior accuracy and innovation.";
  static const String satzProjectsButton = "Our Projects";
  static const String satzProjectsImage  = "assets/images/home_satz_projects.jpg";

  // -------- UnderHero --------
  static const String underHeroText =
      "Electrical and Mechanical Engineering consultation for the Future of Defense and Space applications";

// -------- Expertise section --------

  static const String ourExpertise= "Capabilities";
  static const String ourExpertiseSubHead="Electrical and Mechanical Engineering consultation for the Future of Defense and Space applications";
  static List<ExpertiseData> card=[

    ExpertiseData(
      title: "Electrical Engineering for Satellite Communication",
      points: [
        "High-reliability microwave components and assembly design.",
        "Satellite feed designs",
        "Ferrite-based components",
        "mm-wave components",
        "Antenna Systems",
      ],
    ),
    ExpertiseData(
      title: "Mechanical Engineering Solutions",
      points: [
        "3D Modeling",
        "PIM analysis",
        "Assembly design",
        "Thermal Analysis",
      ],
    ),
     ExpertiseData(
      title: "System Analysis, scoping, and Documentation",
      points: [
        "Preliminary design documents (PDR) preparation.",
        "Critical design documents (CDR) preparation",
        "Technical Proposals assessment",
        "Conducting scientific research",
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
      text: '3D Components modeling, PIM analysis, precision assembly design.',
    ),
   PrecisionSectionData(
      icon: Icons.precision_manufacturing_outlined,
      title: 'Systems analysis',
      text: 'System proposals, scoping, assessment".',
    ),
   PrecisionSectionData(
      icon: Icons.fact_check_outlined,
      title: 'Validation and Documentation',
      text: 'Compliance checks, PDR/CDR preparation and assessment.',
    ),
  ];


}