
# Responsive Package

A Flutter package to easily manage responsive layouts across mobile, tablet, and desktop devices. With this package, you can create adaptive UI components that adjust based on screen size, making your app responsive across different devices.

## Features

- **Mobile Layout**: Define a widget specifically for mobile screen sizes.
- **Tablet Layout**: Optionally, define a widget for tablet screen sizes.
- **Desktop Layout**: Define a widget for desktop screen sizes.
- **Customizable Breakpoints**: Users can define custom screen width breakpoints for mobile, tablet, and desktop views.

## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  responsive_package: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

Wrap your app's layout with the `Responsive` widget to adjust the UI based on screen size:

```dart
import 'package:responsive_package/responsive.dart';

class MyResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileWidget(),
      tablet: TabletWidget(),
      desktop: DesktopWidget(),
    );
  }
}
```

### Custom Breakpoints

You can customize the breakpoints for mobile and tablet screen sizes:

```dart
Responsive(
  mobile: MobileWidget(),
  tablet: TabletWidget(),
  desktop: DesktopWidget(),
  mobileBreakpoint: 800, // Custom breakpoint for mobile
  tabletBreakpoint: 1200, // Custom breakpoint for tablet
)
```

### Helper Methods

You can also check the current device type using helper methods:

```dart
if (Responsive.isMobile(context)) {
  // Do something for mobile
} else if (Responsive.isTablet(context)) {
  // Do something for tablet
} else if (Responsive.isDesktop(context)) {
  // Do something for desktop
}
```

## Example

Here is a complete example of how to use the `Responsive` package:

```dart
import 'package:flutter/material.dart';
import 'package:responsive_package/responsive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsive Layout Example'),
        ),
        body: Responsive(
          mobile: Center(child: Text('This is Mobile View')),
          tablet: Center(child: Text('This is Tablet View')),
          desktop: Center(child: Text('This is Desktop View')),
        ),
      ),
    );
  }
}
```

## License

This package is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more details.
