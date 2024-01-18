# GETX BASE CLASSES

[![Pub Version](https://img.shields.io/pub/v/getx_base_classes)](https://pub.dev/packages/getx_base_classes)

A collection of base classes for GetX architecture in Flutter, providing common functionality for controllers, views, middleware, and more.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [BaseController](#basecontroller)
  - [BaseView](#baseview)
  - [BaseWidget](#basewidget)
  - [BaseMiddleware](#basemiddleware)
  - [BaseConnect](#baseconnect)
  - [BaseRequest](#baserequest)
  - [BaseResponse](#baseresponse)
  - [BaseModel](#basemodel)
  - [Responsive](#responsive)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

## Installation

To use this package, add `getx_base_classes` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  getx_base_classes: 
```

## Usage

### BaseController

`BaseController` provides common functionality for handling asynchronous operations and API calls. Extend this class to create custom controllers for different screens or functionalities.

```dart
// Example of using BaseController
class HomeController extends BaseController {
  // Your controller implementation
}
```

### BaseView

`BaseView` is an abstract class representing a base view in a GetX architecture with common functionality. Extend this class to create custom views for different screens or UI components.

```dart
// Example of using BaseView
class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget buildView() => Scaffold(
        appBar: AppBar(),
        body: Text('Getx Base Classes'),
      );
    }
```

### BaseWidget

`BaseWidget` is an abstract class representing a base widget in a GetX architecture with common functionality. Extend this class to create custom widgets for different UI components.

```dart
// Example of using BaseWidget
class MyWidget extends BaseWidget<MyController> {
  @override
  Widget buildView(BuildContext context) {
    // Your widget implementation
    return Container(
      child: Text('Custom Widget'),
    );
  }
}
```

### BaseMiddleware

`BaseMiddleware` is a base class for handling navigation and page lifecycle events in GetX.

```dart
// Example of using BaseMiddleware
class MyMiddleware extends BaseMiddleware {
  // Your middleware implementation
}
```

### BaseConnect

`BaseConnect` is a class that extends `GetConnect` for making HTTP requests with common functionality such as setting base URL, headers, and handling authentication.

```dart
// Example of using BaseConnect
class MyApiService extends BaseConnect {
  // Your API service implementation
}
```

### BaseRequest

`BaseRequest` is a simple class representing a request with common properties like `deviceId` and `tokenId`.

```dart
// Example of using BaseRequest
BaseRequest request = BaseRequest(deviceId: '123', tokenId: '456');
```

### BaseResponse

`BaseResponse` is a generic class representing a response with common properties such as `success`, `message`, and `data`.

```dart
// Example of using BaseResponse
BaseResponse<String> response = BaseResponse(success: true, message: 'Success', data: 'Hello');
```

### BaseModel

`BaseModel` is an abstract class defining the contract for model classes in the application, providing methods for serialization and deserialization.

```dart
// Example of using BaseModel
class MyModel extends BaseModel<MyModel> {
  @override
  MyModel fromJson(Map<String, dynamic> json) {
    // Your deserialization logic
    return MyModel();
  }

  @override
  Map<String, dynamic> toJson() {
    // Your serialization logic
    return {};
  }
}
```

### Responsive

`Responsive` is a widget that adjusts its child based on the screen size and orientation, providing utility methods to check the current screen type.

```dart
// Example of using Responsive
Widget responsiveWidget = Responsive(
    mobile: const Text('Mobile'),
    mobileLandscape: const Text('Mobile Landscape'),
    tablet: const Text('Tablet'),
    tabletLandscape: const Text('Tablet Landscape'),
    desktop: const Text('Desktop'),
);
```


## Contributing

Feel free to contribute to this project. If you find any issues or have suggestions, please create an issue or pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

This example includes code snippets and explanations for each of your base classes, making it easier for users to understand how to use them in their projects.

  
