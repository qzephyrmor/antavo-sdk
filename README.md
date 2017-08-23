# Antavo Loyalty Swift SDK

![](https://img.shields.io/cocoapods/p/AFNetworking.svg)

## Overview

The Antavo Loyalty Swift SDK makes it easy for mobile developers to build Antavo-powered applications. With the Swift SDK you can leverage the power of Antavo API functionality.

There are many resources to help you build your first loyalty application with the Swift SDK:

- Read the [Readme](README.md)
- Browse the [Documentation](https://antavo.com)

## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0+
- Alamofire 4.4+

## Installation

### Installing dependencies

We recommend using CocoaPods to manage dependecies and build the Swift SDK for your application.

You can install CocoaPods with:

```bash
$ sudo gem install cocoapods
```

To use Swift SDK in your application, specify Alamofire in your `Podfile` targets as dependency:

```bash
pod 'Alamofire', '~> 4.4'
```

Then run the following command:

```bash
$ pod install
```

### Installing Swift SDK

Coming soon.

## Initialization

You will need to provide an Antavo API key for initializing Swift SDK, for example:

```swift
import AntavoSDK
let antavo = AntavoSDK(apiKey: "YOUR_API_KEY")
```

## SDK Reference

The following methods will present API responses asynchronously. We recommend using Swift completion handler capabilities.
See [Completion Handlers](https://thatthinginswift.com/completion-handlers) for more information on getting started with Swift completion handlers.

### Getting brand settings

Mechanism for fetching initialized brand settings.

```swift
antavo.getSettings() { response, error in
  // Implement your application behavior...
}
```

Return values:
- response: brand settings as `NSDictionary?`
- error: API errors as `Error?`

### Getting customer data

Capability to getting customer data by given identifier.

```swift
antavo.getCustomer("CUSTOMER_ID") { customer, error in
  // Implement your application behavior...
}
```

Return values:
- customer: customer object as `ANTCustomer?`
- error: API errors as `Error?`

### Authenticating customer

Mechanism for authenticating an already existing loyalty customer for a SDK session.

```swift
antavo.authenticateCustomer("CUSTOMER_ID") { customer, error in
  // Implement your application behavior...
}
```

Return values:
- customer: authenticated customer as `ANTCustomer?`
- error: API errors as `Error?`

### Sending event for an authenticated customer

Mechanism for performing a POST request through the Antavo Events API.

```swift
// Defining request parameters.
let parameters = ["points": 30]

sdk.authenticateCustomer("bence5") { customer, error in
  do {
    try sdk.sendEvent("point_add", parameters: parameters) { response, error in
      // Implement your application behavior...
    }
  } catch {
    // Implement your error handler mechanism...
  }
}
```

Return values:
- response: Events API response as `NSDictionary?`
- error: API errors as `Error?`
