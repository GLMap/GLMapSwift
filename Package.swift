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
            url: "https://globus.software/download/snapshot/GLMapCore-1.7.3-954d77879.zip",
            checksum: "207498721e5486925b86d88ddd0303ac0cff03b80df90ae192ff108c3b43225a"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.7.3-954d77879.zip",
            checksum: "cc54aafe5e269ec7e32bf8b9aac538d15b80fe42e7795239f8f373b4d5ca9838"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.7.3-954d77879.zip",
            checksum: "92a80a748b7a8ed421f825e56b2aa10f828cf3ad7d656b67c5b7b2aa165849c6"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.7.3-954d77879.zip",
            checksum: "e542d8c7303d47d0792111a4e0dd5b0e68e1a16604f6fc79a38d1485448f4278"
        ),
    ]
)
