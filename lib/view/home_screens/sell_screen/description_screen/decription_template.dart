import 'package:wizmo/models/sell_car_model.dart';

String descriptionTemplate(SellCarModel carModel) {
  return "Introducing the ${carModel.year} ${carModel.model} ${carModel.variation}: A ${carModel.bodyType} for Your Every Adventure"
      "Experience the perfect blend of style, performance, and efficiency with the ${carModel.year} ${carModel.model} ${carModel.variation}. This ${carModel.bodyType} from ${carModel.make} combines sleek design elements with advanced features to create a driving experience that stands out from the crowd. With its impressive ${carModel.mileage} mileage, powerful ${carModel.engineSize} engine, and comfortable interior, the ${carModel.year} ${carModel.model} ${carModel.variation} is ready to take you on your next journey."
      "Powered by a ${carModel.engineSize} engine, the ${carModel.year} ${carModel.model} ${carModel.variation} delivers a thrilling performance with its ${carModel.enginePower} horsepower. Experience smooth acceleration as you go from 0 to 60 mph in just ${carModel.acceleration}, making every drive a joyous experience. Paired with an ${carModel.gearBox} gearbox and ${carModel.driveTrain} drive, this ${carModel.bodyType} offers effortless handling and a responsive driving experience."
      "Not only does the ${carModel.year} ${carModel.model} ${carModel.variation} offer impressive performance, but it also boasts excellent fuel efficiency. With a fuel consumption rate of ${carModel.consumption}, you can go further on each tank, saving you time and money at the pump. Enjoy the convenience of a range of up to ${carModel.range}, ensuring that you can embark on long journeys without worry."
      "Step inside the spacious cabin of the ${carModel.year} ${carModel.model} ${carModel.variation}, where comfort and convenience take center stage. With seating for up to ${carModel.seats} passengers across its ${carModel.doors} doors, this ${carModel.bodyType} offers ample space for everyone to relax and enjoy the ride. The ${carModel.colour} color adds a touch of elegance, while the premium materials and attention to detail create a refined ambiance."
      "The ${carModel.year} ${carModel.model} ${carModel.variation} is equipped with a range of features designed to enhance your driving experience. Stay connected and entertained with the intuitive infotainment system, allowing you to access your favorite music and apps effortlessly. With advanced safety features, including lane departure warning and adaptive cruise control, the ${carModel.model} ${carModel.variation} prioritizes your safety and peace of mind on the road."
      "Additionally, the ${carModel.year} ${carModel.model} ${carModel.variation} falls under insurance group ${carModel.insurance}, making it an affordable option to insure. The annual tax for this model is ${carModel.tax}, providing cost-effective ownership. With its low CO2 emissions of ${carModel.co2}, the ${carModel.model} ${carModel.variation} is also an environmentally friendly choice."
      "In summary, the ${carModel.year} ${carModel.model} ${carModel.variation} is a stylish ${carModel.bodyType} that combines performance, efficiency, and comfort. With its powerful engine, excellent fuel economy, and advanced features, this model is perfect for both urban commutes and long-distance journeys. Experience the joy of driving the ${carModel.year} ${carModel.model} ${carModel.variation} and embark on your next adventure with confidence and style.";
}