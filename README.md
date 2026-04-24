# GLMapSwift

Unlock a new realm of mapping capabilities with **GLMapSwift**. This robust framework brings you offline maps, lightning-fast search, and navigation functionalities. Whether you're crafting an iOS, macOS or Android application, **GLMapSwift** offer a seamless, high-performance experience.

## Features
- 🌍 *GLMap* - Offline Maps
- 🔍 *GLSearch* - Ultra-Fast Search
- 🚗 *GLRoute* - Turn-by-Turn Navigation
- 🎨 Customizable Styles via MapCSS
- 🗺 GeoJSON Support
- 📱 Cross-Platform (iOS, macOS & Android)
  
## Installation via Swift Package Manager (SPM)

Add the dependency in your `Package.swift`:

```swift
.package(url: "https://github.com/GLMap/GLMapSwift.git", from: "master")
```

## Getting Started

### Obtain API Key

Get your API key at [GLMap User Dashboard](https://user.globus.software/apps/).

### Initialize GLMap

In your `AppDelegate.swift`:

```swift
GLMapManager.activate(apiKey: <#API key#>)
```

### Add GLMapView to Your Project

In your ViewController:

```swift
let mapView = GLMapView()
view.addSubview(mapView)
```

## 📚 Documentation

Explore our example projects:
- 🍏 [iOS Demo Repository](https://github.com/GLMap/examples-ios)
- 🤖 [Android Demo Repository](https://github.com/GLMap/examples-android)

For detailed documentation and guides, visit [GLMap Documentation](https://globus.software/docs).

## License

Apache 2.0

## 🙋‍♂️ Need Assistance?

Run into issues? We've got you covered. Contact [support@globus.software](mailto:support@globus.software).

## 💌 Feedback

Love what you see? Share your thoughts at [hi@globus.software](mailto:hi@globus.software).

**Globus frameworks** is the key to unlocking a high-speed, customizable mapping experience. Get started today! 🌍⚡
