# GLMap Swift Package

The official Swift Package Manager distribution of GLMap SDK 2.0. The package provides binary frameworks for map rendering, search, and routing together with the Swift extensions and resources needed to start an application.

Supported platforms:

- iOS 13 or later;
- macOS 11 or later.

## Add the package

In Xcode, select **File → Add Package Dependencies** and enter:

```text
https://github.com/GLMap/GLMapSwift.git
```

Select version `2.0.0` or later and add the products your application uses:

| Product | Purpose |
| --- | --- |
| `GLMap` | Map rendering, Swift extensions, default style, fonts, and world overview map |
| `GLSearch` | Online and offline search |
| `GLRoute` | Online and offline routing |

`GLSearch` and `GLRoute` are optional additions to the main `GLMap` product.

For a manifest-based project:

```swift
dependencies: [
    .package(url: "https://github.com/GLMap/GLMapSwift.git", from: "2.0.0"),
],
targets: [
    .target(
        name: "MyApp",
        dependencies: [
            .product(name: "GLMap", package: "GLMapSwift"),
            .product(name: "GLSearch", package: "GLMapSwift"),
            .product(name: "GLRoute", package: "GLMapSwift"),
        ]
    ),
]
```

## Show a map

Get an API key from the [GLMap User Dashboard](https://user.globus.software/apps/) and activate GLMap once during application startup, before creating a map view:

```swift
import GLMap
import GLMapSwift

GLMapManager.activate(apiKey: <#API key#>)
```

Then create `GLMapView` like a regular platform view:

```swift
final class MapViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let mapView = GLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.mapGeoCenter = GLMapGeoPoint(lat: 41.1579, lon: -8.6291)
        mapView.mapZoomLevel = 14
        view.addSubview(mapView)

        GLMapManager.shared.tileDownloadingAllowed = true
    }
}
```

`GLMapView` loads the packaged default style automatically. Setting `tileDownloadingAllowed` to `true` permits the SDK to download online map data; downloaded maps can also be used fully offline.

## Package resources

When installed through Swift Package Manager, `GLMapManager.activate(apiKey:)` automatically uses `Bundle.module`. The package includes:

- `DefaultStyle.bundle`;
- the default fonts;
- `world.vm`, used for the low-zoom world overview.

Pass a custom `resources` bundle or `storage` path to `activate(apiKey:resources:storage:)` only when your application intentionally overrides these defaults.

## Examples and documentation

- [iOS examples](https://github.com/GLMap/examples-ios) — compact UIKit and SwiftUI applications using this package;
- [GLMap documentation](https://globus.software/docs);
- [support@globus.software](mailto:support@globus.software).

## License

The Swift wrapper source is available under the Apache License 2.0. The bundled GLMap binary frameworks are distributed under the GLMap SDK license.
