# cooler_alerts

A Flutter package to display animated alert dialogs

**Please note - the origin [author](https://github.com/emrade) of the [cool_alert](https://pub.dev/packages/cool_alert) hasn't provided updates for an extended period of time.** This package serves to support, and enhance the existing package.

## Usage

To use this package, add the package as dependency in your `pubspec.yaml` file.

```dart
cooler_alerts: ^2.1.0
```

Then, add this import to your dart file.

```dart
import 'package:cooler_alerts/cooler_alerts.dart';
```

### Coming from the original `cool_alert` package?

The transition is simple: 
1. change the package name in `pubspec.yaml` from `cool_alert` to `cooler_alerts`
2. replace all package references from
```dart
package:cool_alert/cool_alert.dart;
```
to
```dart
package:cooler_alerts/cooler_alerts.dart;
```

## Image
![Screenshot  Gif](screenshots/gif.gif)

### Example

```dart
CoolAlert.show(
   context: context,
   type: CoolAlertType.success,
   text: "Your transaction was successful!",
);
```

### CoolAlert Class

| Attribute            | Data type         | Description                                                                     |                               Default Value                               |
|:---------------------|:------------------|:--------------------------------------------------------------------------------|:-------------------------------------------------------------------------:|
| context              | BuildContext      | @required                                                                       |                                   Null                                    |
| type                 | CoolAlertType     | @required - Type of alert dialog, ex: CoolAlertType.success for success dialogs |                                   Null                                    |
| title                | String            | Set a custom title for dialog                                                   |                    Based on the CoolAlertType selected                    |
| text                 | String            | Set the description text of the dialog.                                         |                                   Null                                    |
| widget               | Widget            | Set any you expect widget of the dialog.                                        |                                   Null                                    |
| confirmBtnText       | String            | Text of confirm button                                                          |                                   'Ok'                                    |
| confirmBtnTap        | void Function(BuildContext)? | Function that handle click of confirm button, provides dialog context parameter. |                          (c) => Navigator.pop(c)                          |
| confirmBtnColor      | Color             | Color of confirm Button                                                         |                      Theme.of(context).primaryColor                       |
| cancelBtnText        | String            | Text of cancel button                                                           |                                 'Cancel'                                  |
| cancelBtnTap         | void Function(BuildContext)? | Function that handle click of cancel button, provides dialog context parameter.  |                          (c) => Navigator.pop(c)                          |
| barrierDismissible   | bool              | Dismiss dialog on touch overlay                                                 |                                   true                                    |
| animType             | CoolAlertAnimType | Type of dialogue enter animation                                                |                          CoolAlertAnimType.scale                          |
| backgroundColor      | Color             | Background color of the animation                                               |                             Color(0xFF515C6F)                             |
| confirmBtnTextStyle  | TextStyle         | Confirm button text theme                                                       | TextStyle(color: Colors.white, fontWeight:FontWeight.w600,fontSize: 18.0) |
| cancelBtnTextStyle   | TextStyle         | Cancel button text theme                                                        | TextStyle(color: Colors.grey, fontWeight:FontWeight.w600,fontSize: 18.0)  |
| flareAsset           | String            | Custom flare asset                                                              |                              "animation.flr"                              |
| flareAnimationName   | String            | The name of the flare animation to play                                         |                                  "play"                                   |
| lottieAsset          | String            | Custom lottie asset                                                             |                             "animation.json"                              |
| autoCloseDuration    | Duration          | Determines how long the dialog stays open for before closing                    |                                   Null                                    |
| width                | double            | Dialog width                                                                    |                     MediaQuery.of(context).size.width                     |
| loopAnimation        | boolean           | Determines if the animation should loop or not                                  |                                   false                                   |
| closeOnConfirmBtnTap | boolean           | Detemines if dialog closes when the confirm button is tapped                    |                                   true                                    |
| reverseBtnOrder      | boolean           | Reverse the order of the buttons                                                |                                   false                                   |
| titleTextAlign       | TextAlign         | Text alignment for title                                                        |                             TextAlign.center                              |
| titleOverflow        | TextOverflow      | Text overflow for title                                                         |                                   Null                                    |
| textTextAlign        | TextAlign         | Text alignment for text                                                         |                             TextAlign.center                              |
| textOverflow         | TextOverflow      | Text overflow for text                                                          |                                   Null                                    |
| canPop               | boolean                      | Prevents undesired navigation unless explicitly desired.                         |                                   true                                    |
| onPopInvoked         | void Function(bool)?         | Notifies of whether the context was popped with `didPop` parameter               |                                   Null                                    |

### Popping the dialog

To pop the dialog from one of the buttons, you have the following options.

1. Using `closeOnConfirmBtnTap: true` will automatically pop the dialog when the confirm button is tapped.
2. Using `confirmBtnTap` or `cancelBtnTap` functions to pop the dialog manually. This should be done with the context provided (see notes below)
```dart
CoolAlert.show(
   context: context,
   type: CoolAlertType.success,
   text: "Your transaction was successful!",
   confirmBtnTap: (dialogContext) {
      Navigator.pop(dialogContext);
   }
);
```
**Notes:** 

- if you have have `closeOnConfirmBtnTap: true` while calling `Navigator.pop(dialogContext)` in the above example, you'll pop twice and may run into some issues. Have either one or the other.
- If you have `autoCloseDuration` set, this is a wrapper for `Navigator.pop(coolAlertParentContext, rootNavigator: true)` after the duration is up. In the above example, if the user taps "confirm" and the dialog auto closes, it will pop twice and you may run into issues.





