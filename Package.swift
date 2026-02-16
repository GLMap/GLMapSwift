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
            url: "https://globus.software/download/GLMapCore-1.13.0.zip",
            checksum: "77a348a7190506110a393b04b3cb71d4281008c66911b8b574cee67b27fc7670"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.13.0.zip",
            checksum: "77f8229282200de97d3b6162c7dc6fa32b1fae733db34f93aff0e5edf97f7417"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.13.0.zip",
            checksum: "aaeeea9feb197f7d25badd51b957a3aaaa77c204dbbea3b60b5ff2d5b9e45243"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.13.0.zip",
            checksum: "f8fb27fd29fd373c9e3eaee574ba82f549eeb39f26c871a8dd16fa9617d31d34"
        ),
    ]
)
