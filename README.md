# rainbow_challenge

## License

Rainbow Challenge is licensed by the MIT license. Full license in the LICENSE file

## About Rainbow Challenge

Rainbow challenge is a project meant to help young LGBTQIA+ activists to get involved in the activism and protection of LGBTQIA+ rights.

## Rainbow challenge app

This app helps people, especially youth to get involved in the LGBTQIA+ activism and support in a captivating and rewarding way.

## Backend of the app

Backend of the app is in another repository which is also licensed by the MIT license: [https://github.com/karina-klinkeviciute/rainbow-challenge](https://github.com/karina-klinkeviciute/rainbow-challenge) 

## Theme

Custom classes: 

- ThemeColors()  
- ThemeFonts()  
- ThemeHeadings()  

### Fonts 

Custom fonts for the project are described in `lib/theme/fonts.dart`.

### Colors 

Custom colors for the project are described in `lib/theme/colors.dart`.

Colors for various built-in widgets are described in `lib/theme/design_theme.dart`. Some descriptions are work-in-progress, the light mode is more complete than the dark mode.

## Custom Widgets 

Custom widgets can be found in `lib > widgets`. They can be reused in different places of the app.

- **BottomMenuWidget()** - a bottom navigation bar that uses the built-in MaterialApp BottomNavigationBar widget. The built-in widget has limited options for visual effects (item border is not available at the moment), but it's easier to implement than a widget made from scratch. Perhaps there are possibilities to add more visual flexibility (further research is needed).

- **ColoredAreaWidget({ backgroundColor, required content })** - this widget adds an area with background and rounded corners. Background color has a default value.

- **HeadingLinedWidget({ required title })** - this widget displays a centered heading that contains a centered heading surrounded by horizontal lines

- **HeadlineWidget({ required title, subtitle })** - this widget adds a styled headline that consists of the main title and subtitle (optional) of the page/screen.

- **HtmlWidget({ required data, center })** - this widget uses html rendering with some styles added to it. It uses package [flutter_html](https://pub.dev/packages/flutter_html). The idea behind this widget is to add some visual consistency wherever html will be rendered in the app. Especially useful for various descriptions (e.g. challenges) and news articles.

- **ImageExternalWidget({ required url, width, height, borderRadius })** - this widget adds an external image with some styling and clipping added to it. 

- **ImageLocalWidget({ required url, width, height, borderRadius })** - this widget adds a local image with some styling and clipping added to it.

- **MessageWidget( { icon, title, message })** - displays a vertically and horizontally centered area that contains an icon, title and message. In the future we will probably add some illustrations to it.

- **WrapperSimpleWidget({ required mainArea, bodyBackgroundColor })** - displays a Scaffold structure with minimal setup with fullscreen body.

- **WrapperMainWidget( { required mainArea, bodyBackgroundColor })** - displays a Scaffold structure with standard setup.

## Constants

A list of constants that can be used for navigation and API, and perhaps to store some other values. Can be found in `lib/constants` folder.

### AppRoute.routeName 
Can be used to access a named route constant 

## Json serialization

We can use JSON serialization and generate the factory methods automatically by using `json_serializable`, `build_runner` and `json_annotation` packages. 

Generate code 
`flutter pub run build_runner build`

Generate code and update it automatically while working with model
`flutter pub run build_runner serve --delete-conflicting-outputs`

