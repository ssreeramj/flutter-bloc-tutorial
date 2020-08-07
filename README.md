# BLoC Pattern

BLoC stands for Business Logic Components. The gist of BLoC is that everything in the app should be represented as stream of events: widgets submit events; other widgets will respond. BLoC sits in the middle, managing the conversation. Dart even comes with syntax for working with streams that is baked into the language!

The goal of this library is to make it easy to separate presentation from business logic, facilitating testability and reusability.

![](screenshots/bloc_architecture.png)

