import 'package:satz1/core/classes/products_data_class.dart';

class ProductsPageStrings{

  static const String productsHeroBody =
      "Precision Engineering for Aerospace & Defense\n"
      "At SATZ Tech, we specialize in end-to-end electrical and mechanical solutions for satellite systems, "
      "RF/microwave components, and advanced prototyping. From design to fabrication, we ensure performance, "
      "reliability, and compliance with industry standards.";
  static const String productsHeroButton = "Contact Us for Custom Solutions";

  static const String productsHeroImage="assets/images/satEarth2.jpeg";

  static List<ProductDataClass> products=[
    ProductDataClass(
        image: "assets/images/product1.jpg",
        title:  "SSPA Power Amplifiers",
        description:"SSPAs use solid-state devices like GaN for high efficiency and compact size.They are common in satellites, radar, and broadcasting. They provide stable, wideband, and reliable power.Used in both CW and pulsed high-power systems."),
     ProductDataClass(
        image:  "assets/images/product2.jpg",
        title: "Mono-Pulse Comparators" ,
        description:    "Mono-Pulse Comparators enable accurate radar target tracking. They create SUM and DIFF signals for angle measurement. "
            "Performance depends on low loss, phase, and amplitude balance. Widely used in radar and satellite systems."
    ),
     ProductDataClass(
        image: "assets/images/product3.png",
        title: "Full Band High Power Isolators",
        description: "High power isolators protect sensitive RF equipment from signal reflections. They allow one-way signal flow with very low insertion loss.Full band isolators cover entire waveguide bands with stable performance.They are used in radar, satellite, and communication systems."
    ),
     ProductDataClass(
        image: "assets/images/product4.jpg",
        title: "Ferrite Switch Matrix",
        description: "Ferrite switch matrices route RF signals between multiple inputs and outputs.They use ferrite devices for fast, reliable, and contact-less switching.Low loss and high isolation make them ideal for complex RF networks.They are used in satellites, radar, and advanced communication systems."
    ),
    ProductDataClass(
        image: "assets/images/product5.jpeg",
        title: "Engineering Consultants",
        description: "Engineering consultants provide expert guidance in technical projects.They support design, testing, and optimization of engineering systems.Their role reduces risks, costs, and improves project efficiency.They work across fields like RF, aerospace, and industrial solutions."
    ),
  ];
}