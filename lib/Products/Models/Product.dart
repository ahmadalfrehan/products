import 'package:freezed_annotation/freezed_annotation.dart';
part 'Product.freezed.dart';
@Freezed()
class Product with _$Product{
  const factory Product({
    required String title,
    required int id,
    required String imageUrl,
    required int price,
    required String desscription,
    required String category,
  }) = _Product;
  //factory Product.formJson(Map<String,dynamic> json) =>_$ProductFromJson(json);
}

/*
* [{id: 9, title: WD 2TB Elements Portable External Hard Drive - USB 3.0 , price: 64, description: USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system, category: electronics, image: https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg, rating: {rate: 3.3, count: 203}}, {id: 10, title: SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s, price: 109, description: Easy upgrade for faster boot up, shutdown, application load and response (As compared to 5400 RPM SATA 2.5” hard drive; Based on published specifications and internal benchmarking tests using PCMark vantage scores) Boosts burst write performance, making it ideal for typical PC workloads The perfect balance of performance and reliability Read/write speeds of up to 535MB/s/450MB/s (Based on internal
* */
