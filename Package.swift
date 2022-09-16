// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS(.v10_11), .iOS(.v9),
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
            url: "https://globus.software/download/GLMapCore-1.6.4.zip",
            checksum: "d4a946b1dd9e5fd38aee413e7de6b0380fe2465e4ba22dc242213e93eb62e676"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.6.4.zip",
            checksum: "939109e00298aee0741f5e1d6fc4ca23966f85575dde52a6d370a238b472d23a"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.6.4.zip",
            checksum: "bc33050f117fae52f3f1b5ad7d4cd7b9f43a5647251ebb77cf69c71183a47e6a"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.6.4.zip",
            checksum: "c6d3b81722e937f3b1a0b7d31fe6d19dd976a17511ff32eb6c6951cc4e957cb0"
        ),
    ]
)
