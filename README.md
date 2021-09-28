# rainbow_challenge


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

- **BottomMenuWidget()** - a buttom navigation bar that uses the built-in MaterialApp BottomNavigationBar widget. The built-in widget has limited options for visual effects (item border is not available at the moment), but it's easier to implement than a widget made from scratch. Perhaps there are possibilities to add more visual flexibility (further research is needed).

- **ColoredAreaWidget({ backgroundColor, required content })** - this widget adds an area with background and rounded corners. Background color has a default value.

- **HeadingLinedWidget({ required title })** - this widget displays a centered heading that contains a centered heading surrounded by horizontal lines

- **HeadlineWidget({ required title, subtitle })** - this widget adds a styled headline that consists of the main title and subtitle (optional) of the page/screen.

- **HtmlWidget({ required data, center })** - this widget uses html rendering with some styles added to it. It uses package [flutter_html](https://pub.dev/packages/flutter_html). The idea behind this widget is to add some visual consistency wherever html will be rendered in the app. Especially useful for various descriptions (e.g. challenges) and news articles.

- **ImageExternalWidget({ required url, width, height, borderRadius })** - this widget adds an external image with some styling and clipping added to it. 

- **ImageLocalWidget({ required url, width, height, borderRadius })** - this widget adds a local image with some styling and clipping added to it.

- **MessageWidget( { icon, title, message })** - displays a vertically and horizontally centered area that contains an icon, title and message. In the future we will probably add some illustrations to it.

- **WrapperSimpleWidget({ required mainArea, bodyBackgroundColor })** - displays a Scaffold structure with minimal setup with fullscreen body.

- **WrapperMainWidget( { required mainArea, bodyBackgroundColor })** - displays a Scaffold structure with standard setup.