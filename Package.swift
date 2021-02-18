// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS(.v10_11), .iOS(.v9)
    ],
    
    products: [
        .library(
            name: "GLMap",
            targets: ["GLMapSwift"]),
        .library(
            name: "GLSearch",
            targets: ["GLSearch", "GLMap"]),
        .library(
            name: "GLRoute",
            targets: ["GLRoute", "GLMap"])
    ],
    //dependencies: [
        // Dependencies declare other packages that this package depends on.
    //],
    targets: [
        .target(
            name: "GLMapSwift",
            path: ".",
            exclude: ["README.md", "LICENSE.txt", "GLMapSwift.podspec", "GLMapSwift-Info.plist", "GLMap.xcframework", "GLSearch.xcframework", "GLRoute.xcframework"],
            sources: ["SwiftExtensions.swift"],
            resources: [
                .copy("Resources/world.vm"),
                .copy("Resources/fonts"),
                .copy("Resources/DefaultStyle.bundle")
            ],
            swiftSettings: [.define("SWIFT_PACKAGE")]
        ),
        .binaryTarget(
            name: "GLMap",
            path: "GLMap.xcframework"
        ),
        .binaryTarget(
            name: "GLSearch",
            path: "GLSearch.xcframework"
        ),
        .binaryTarget(
            name: "GLRoute",
            path: "GLRoute.xcframework"
        )
//        .binaryTarget(
//            name: "GLMap",
//            url: "https://globus.software/download/GLMap-1.4.0.zip",
//            checksum: "cfa2cb87a498fa7e93c655dbec2834b365714b16491e33863a95eaa17cb04a81"
//        ),
//        .binaryTarget(
//            name: "GLSearch",
//            url: "https://globus.software/download/GLSearch-1.4.0.zip",
//            checksum: "8c035bad67d5ee326d898228cdef0c1afe79c11589a8025b188ec1a1e6fd7fce"
//        ),
//        .binaryTarget(
//            name: "GLRoute",
//            url: "https://globus.software/download/GLRoute-1.4.0.zip",
//            checksum: "f8466a57d15055d1ec4961af31fcd91c7dedb2895f468de5b06b162a1f0bce94"
//        )
    ]
)
