abstract class BaseModel<T> {
  // Define a method for deserialization
  T fromJson(Map<String, dynamic> json);

  // Define a method for serialization
  Map<String, dynamic> toJson();
}



//  final api = BaseConnect(header: header, baseUrl: baseUrl);

//   try {
//     final response = await api.requestWithResponse(
//       '/example',
//       fromJsonT: (json) => YourDataModel.fromJson(json),
//     );

//     print('Response: ${response.success}, ${response.message}, ${response.data}');
//   } catch (error) {
//     print('Error: $error');
//   }
//https://portfolio-visal.s3.eu-west-2.amazonaws.com/cart.json