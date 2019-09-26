# APN-P8

If you were looking for solution to send a Push Notifications using Auth Key (P8), this repository may interest you.

> Special thanks to @ethanhuang13 and his https://github.com/ethanhuang13/CupertinoJWT which is heavily used in this project. Thanks!

## Installation

Just download `P8.playground` file and open it in Xcode.

## Usage

Change the following data in playground and run it.

```swift
PAYLOAD         // content of push notification
DEVICE_TOKEN    // device token to which the notification should be sent
KEY_ID          // get it from your developer account
TEAM_ID         // get it from your developer account
BUNDLE_ID       // your app bundle id
P8              // generated private key
```

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
