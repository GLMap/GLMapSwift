// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS(.v11), .iOS(.v11),
    ],
    products: [
        .library(
            name: "GLMap",
            targets: ["GLMap", "GLMapCore", "GLMapSwift"]
        ),
        .library(
            name: "GLSearch",
            targets: ["GLSearch", "GLMapCore"]
        ),
        .library(
            name: "GLRoute",
            targets: ["GLRoute", "GLMapCore"]
        ),
    ],
    targets: [
        .target(
            name: "GLMapSwift",
            path: ".",
            exclude: ["README.md", "LICENSE.txt", "GLMapSwift.podspec", "GLMapSwift-Info.plist"],
            sources: ["SwiftExtensions.swift"],
            resources: [
                .copy("Resources/world.vm"),
                .copy("Resources/fonts"),
                .copy("Resources/DefaultStyle.bundle"),
            ],
            swiftSettings: [.define("SWIFT_PACKAGE")]
        ),
        .binaryTarget(
            name: "GLMapCore",
            url: "https://globus.software/download/snapshot/GLMapCore-1.7.3-a0807bf19.zip",
            checksum: "ba6dea5fe4d23f9555e2dcf265185ff5042f98862d871be1eee1ede4bff2a5c4"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.7.3-a0807bf19.zip",
            checksum: "1bb8892687d8375aa12e43c1f061f01ddb60e1807526f6225fb5ed3a43310ff8"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.7.3-a0807bf19.zip",
            checksum: "e71d890139884b2cef03129e96bba5c9cf7b7c1d7dc39853c12e03a77e7ed7cb"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.7.3-a0807bf19.zip",
            checksum: "07a13da06dca33280f7c7c3854b537ee1a9640589cfefffa10a763655ec63bec"
        ),
    ]
)
