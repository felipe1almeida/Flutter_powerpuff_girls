# powerpuff_girls

# Introduction

The "powerpuff_girls" project is a Flutter application that displays information about the tv show Powerpuff Girls. 
The application displays some information about the series such as the cover of the series, description, start date, status of the show, rating, and the complete list of all episodes.

This project was built using flutter version 3.3.10, Dart 2.18.6

# Project structure
The project is structured as follows:

Using the concept of Clean Architecture pattern for project architecture, splitting responsibilities into layers.

lib/: Contains the source files for the application.
    lis/bindings/: Contains classes that help connect code from different layers of the application.
    lis/components/: Contains reusable UI components.
    lis/controllers/: Contains controllers that implement presentation layer-specific business logic.
    lis/models/: Contains data models and business entities.
    lis/pages/: Contains individual pages of the application.
    lis/repositories/: Contains classes that implement data access logic.
    lis/routes/: Used to centralize all application routes and inject some component if necessary through dependency injection using bindings.
    lis/utils/: Contains a function used in more than one place in the app, avoiding rewriting, theme configuration for the entire application and a constants file, which Contains the baseurl, used in the requests and the id of the show powerpuff girls in the api used.
main.dart: The entry point of the Flutter application



# Dependencies
The project depends on the following external libraries:

dio: Communication with the rest api
get: State management, dependency injection, route management
transparent_image: A simple transparent image
google_fonts: Use an external font globally in the application
intl: formatting and parsing dates
styled_text: makes it easy to format tags, example <b> inside a string with different styles


The application consists of two screens, the first of which contains general information about the show and a list of episodes. All data on this screen is obtained from an HTTP request to an API, which is initially called through the use of the FutureBuilder widget. This widget calls a function in the page's controller, which has an instance of a repository that makes the request. While the data is being loaded, a circular progress indicator is displayed in the center of the screen. When there is a response from the API with data, the screen is updated through reactivity, where the FutureBuilder is wrapped in an Obx, which updates the state of the screen and displays the show's information. After this request, the same controller makes a request to the second endpoint, which retrieves the list of series episodes, and updates the ListView component with all existing episodes.

If there is a connection failure, no information about the series is displayed. Only a message in the center of the screen indicating that there was a failure and a button to try the request again are shown.

In the ListView, there is a list of episodes, where you can tap on the desired episode and be redirected to the next screen that contains detailed information about the episode. This transition is done through named routes, and the only argument passed to the next screen is a model of an episode.

On the second screen, you have access to an image of the episode, a button to return to the previous screen, season, episode number and name, as well as the air date and duration of the episode. Below, you can read the description of the episode.



# Why GetX
Firstly, because it is a lightweight state manager, which allows for a lot of agility in the development.
The possibility of maintaining a simple architecture, but well organized, without much coupling. 
Navigation by named routes and injection/inversion of dependency in a simple way, isolating each component in a different class, 
facilitating the addition of new pages, controllers, repositories and etc.

# Usage
To use the project, clone the repository and run the flutter run command in the root of the project. Make sure you have Flutter installed on your machine.