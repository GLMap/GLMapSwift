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
            checksum: "312e737eed2ef456177ec7f2e9a3f701b4eda261262335fc86cf091c057f5828"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.6.4.zip",
            checksum: "8fb525f17efd440d2741ae02b3fa6d027c58eb1a70a3a142c76cc2029874c342"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.6.4.zip",
            checksum: "f6605b6f5ac8211020521724e65e4f9581cb867c76b126dc7b3bf30d62a6dbe9"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.6.4.zip",
            checksum: "8de69e7fd6d86159e8146317860985665f04b637f3bda1c37d3869235d364800"
        ),
    ]
)
