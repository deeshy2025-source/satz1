import 'package:satz1/core/classes/products_data_class.dart';

class ProductsPageStrings{

  static const String productsHeroBody =
      "Precision Engineering for Defense and Space\n"
      "At SATZ-Tech, we specialize in end-to-end electrical and mechanical solutions for defense and satellite systems, "
      "RF/microwave components, and advanced prototyping. From design to fabrication, we ensure performance, "
      "reliability, and compliance with industry standards.";
  static const String productsHeroButton = "Contact Us for Custom Solutions";

  static const String productsHeroImage="assets/images/satEarth2.jpeg";

  static List<ProductDataClass> products=[

     ProductDataClass(
        image:  "assets/images/mono.jpeg",
        title: "Mono-Pulse Comparators" ,
        description:    "Mono-Pulse Comparators enable accurate radar target tracking. They create SUM and DIFF signals for angle measurement. "
            "Performance depends on low loss, phase, and amplitude balance. Widely used in radar and satellite systems."
    ),
     ProductDataClass(
        image: "assets/images/Duplexer.jpeg",
        title: "Full Band High Power Duplexers",
        description: "High power isolators protect sensitive RF equipment from signal reflections. They allow one-way signal flow with very low insertion loss.Full band isolators cover entire waveguide bands with stable performance.They are used in radar, satellite, and communication systems."
    ),
     ProductDataClass(
        image: "assets/images/ferrite_v2.jpeg",
        title: "Ferrite Switch Matrix",
        description: "Ferrite switch matrices route RF signals between multiple inputs and outputs.They use ferrite devices for fast, reliable, and contact-less switching.Low loss and high isolation make them ideal for complex RF networks.They are used in satellites, radar, and advanced communication systems."
    ),
    ProductDataClass(
        image: "assets/images/horn.jpeg",
        title:  "Antenna Systems",
        description:"We provide stable, wideband, and high power antenna systems.We design state of the art antennas and antenna feeding structures based on waveguide and printed technology."),
    ProductDataClass(
        image: "assets/images/product5.jpeg",
        title: "Engineering Consultants",
        description: "Engineering consultants provide expert guidance in technical projects.We support design, testing, and optimization of microwave systems.We reduce risks, costs, and improve project efficiency.We work across fields like RF, Space, and defense applications."
    ),
  ];
}