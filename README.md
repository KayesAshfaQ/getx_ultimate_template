# getx_ultimate_template

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

dart line length: 999 (for now)

## Git Commit Message Conventions

When committing changes, we follow certain conventions to make our commit messages more readable and useful. Here are the types of commits we must use:

- `feat`: A new feature is introduced with the changes.
- `fix`: A bug fix has occurred.
- `chore`: Changes that do not relate to a fix or feature and don't modify src or test files (for example updating dependencies).
- `refactor`: Refactored code that neither fixes a bug nor adds a feature.
- `docs`: Updates to documentation such as the README or other markdown files.
- `style`: Changes that do not affect the meaning of the code, likely related to code formatting such as white-space, missing semi-colons, and so on.
- `test`: Including new or correcting previous tests.
- `perf`: Performance improvements.
- `ci`: Continuous integration related.
- `build`: Changes that affect the build system or external dependencies.
- `revert`: Reverts a previous commit.

By following these conventions, we can maintain a clean and understandable commit history.

## Using FlutterGen for Asset Management

FlutterGen is a tool that generates type-safe asset paths for your Flutter project. To use FlutterGen, follow these steps:

````bash
dart run build_runner build
````

or

```bash
flutter pub run build_runner build
```

By using `build_runner` , we can generate asset paths in your Dart code to refer to your assets in a type-safe manner.

## Build apk with flavors enabled

To build an APK for Android with flavors enabled, run the following command:

```bash
flutter build apk -t [targetFile] --[BuildType] --flavor [Flavor Name]
```
