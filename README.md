# powerpuff_girls

# Introduction

<p>The "powerpuff_girls" project is a Flutter application that displays information about the tv show Powerpuff Girls. 
The application displays some information about the series such as the cover of the series, description, start date, status of the show, rating, and the complete list of all episodes.</p>

This project was built using **flutter version 3.3.10, Dart 2.18.6**

# Project structure
The project is structured as follows:

Using the concept of Clean Architecture pattern for project architecture, splitting responsibilities into layers.


**lib/**: Contains the source files for the application.<br>
**lib/bindings/**: Contains classes that help connect code from different layers of the application.<br>
**lib/components/**: Contains reusable UI components.<br>
**lib/controllers/**: Contains controllers that implement presentation layer-specific business logic.<br>
**lib/models/**: Contains data models and business entities.<br>
**lib/pages/**: Contains individual pages of the application.<br>
**lib/repositories/**: Contains classes that implement data access logic.<br>
**lib/routes/**: Used to centralize all application routes and inject some component if necessary through dependency injection using bindings.<br>
**lib/utils/**: Contains a function used in more than one place in the app, avoiding rewriting, theme configuration for the entire application and a constants file, which Contains the baseurl, used in the requests and the id of the show powerpuff girls in the api used.<br>

main.dart: The entry point of the Flutter application



# Dependencies
The project depends on the following external libraries:

**dio**: Communication with the rest api
**get**: State management, dependency injection, route management
**transparent_image**: A simple transparent image
**google_fonts**: Use an external font globally in the application
**intl**: formatting and parsing dates
**styled_text**: makes it easy to format tags, example <b> inside a string with different styles


<p>The application consists of two screens, the first of which contains general information about the show and a list of episodes. All data on this screen is obtained from an HTTP request to an API, which is initially called through the use of the FutureBuilder widget. This widget calls a function in the page's controller, which has an instance of a repository that makes the request. While the data is being loaded, a circular progress indicator is displayed in the center of the screen. When there is a response from the API with data, the screen is updated through reactivity, where the FutureBuilder is wrapped in an Obx, which updates the state of the screen and displays the show's information. After this request, the same controller makes a request to the second endpoint, which retrieves the list of series episodes, and updates the ListView component with all existing episodes.</p>

<p>If there is a connection failure, no information about the series is displayed. Only a message in the center of the screen indicating that there was a failure and a button to try the request again are shown.</p>

<p>In the ListView, there is a list of episodes, where you can tap on the desired episode and be redirected to the next screen that contains detailed information about the episode. This transition is done through named routes, and the only argument passed to the next screen is a model of an episode.</p>

<p>On the second screen, you have access to an image of the episode, a button to return to the previous screen, season, episode number and name, as well as the air date and duration of the episode. Below, you can read the description of the episode.</p>



# Why GetX
<p>Firstly, because it is a lightweight state manager, which allows for a lot of agility in the development.
The possibility of maintaining a simple architecture, but well organized, without much coupling. 
Navigation by named routes and injection/inversion of dependency in a simple way, isolating each component in a different class, 
facilitating the addition of new pages, controllers, repositories and etc.</p>

# Tests

**TvShowController**:   
This test is important because it ensures that the formatShowInfo method is working correctly and returning the expected output for a given set of input values.


**TvShowRepository**:
This test is for the TV show repository in the Flutter application. The test case is checking the behavior of the endpoints of the repository when making HTTP requests to the TV Maze API. There are three test cases in this group:

The first test case is checking that the repository can make a successful request to the TV Maze API and receive a response in the expected format. It is checking that the name field of the response data is equal to 'The Powerpuff Girls'.

The third test case is checking that the repository can correctly retrieve a list of episodes for a TV show. It is making a request for a TV show with a valid ID and checking that the length of the list of episodes in the response data is equal to 78.

These test cases are important because they ensure that the TV show repository is working correctly and making the expected HTTP requests to the TV Maze API.




**Shared function**:

The test case is checking the behavior of the formatDate function in two different scenarios:

The first test case is calling the formatDate function with a valid date string and a format string and checking that the returned value is the expected formatted date string.

The second test case is calling the formatDate function with an invalid date string and a format string and using the throwsFormatException function from the flutter_test library to check that the function throws a FormatException error.

These test cases are important because they ensure that the formatDate function is working correctly and handling both valid and invalid input values correctly.


# Usage
<p>To use the project, clone the repository and run the flutter run command in the root of the project. Make sure you have Flutter installed on your machine.</p>

![MacBook Pro 16_ - 1](https://user-images.githubusercontent.com/54601019/211058174-00f5024e-ebe5-4969-a33f-1fe8927f1c62.png)

