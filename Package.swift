// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS(.v11), .iOS(.v13),
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
            url: "https://globus.software/download/snapshot/GLMapCore-1.10.0-617e0e401.zip",
            checksum: "7a899957d6fe0394f2343458c0328adcfb76a0d72d973225e21ac6c5f02ad644"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.10.0-617e0e401.zip",
            checksum: "d44593e131f19fd11e90632e727278def1baf460389b621a3704d8fbb5b2c331"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.10.0-617e0e401.zip",
            checksum: "e8ce03c32c10745dc408c0c74489ce31c2f12f29586a1ca73c1cb62846b5aac0"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.10.0-617e0e401.zip",
            checksum: "4a4cc468168150996d5917462c169b37cbd13dc734d300b0c0f9a7ce8847b6da"
        ),
    ]
)
