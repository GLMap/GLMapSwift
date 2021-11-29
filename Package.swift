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
            targets: ["GLMap", "GLMapSwift"]
        ),
        .library(
            name: "GLSearch",
            targets: ["GLSearch", "GLMap"]
        ),
        .library(
            name: "GLRoute",
            targets: ["GLRoute", "valhalla_micro", "GLMap"]
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
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.5.0.zip",
            checksum: "d0bcb7d6db14e9dbfcdd1af8efa2f8a03eb8e6420967436ecfd4dacdd5491aa6"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.5.0.zip",
            checksum: "b284d40fd4ce727111892b4b7414eae1494b4c269957301788c31cb7ca0b4b01"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.5.0.zip",
            checksum: "90a6c9f57011d7327f3684c66a0cef4dfec3b16e48ea487ff9ea1f4e59b1f09e"
        ),
        .binaryTarget(
            name: "valhalla_micro",
            url: "https://globus.software/download/valhalla_micro-3.1.4.zip",
            checksum: "d62c5a8c3ee639e3d4297a6363dcbd4c4a59f640f1f2115cf2460f33e5c20cad"
        ),
    ]
)
