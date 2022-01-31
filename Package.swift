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
            targets: ["GLRoute", "valhalla_micro", "GLMapCore"]
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
            url: "https://globus.software/download/GLMapCore-1.6.0.zip",
            checksum: "5f1467ea288fa408166cfef500f00e6b5b7fca51c7811bd6e767cf9fa3c358c6"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.6.0.zip",
            checksum: "7f5a173344bdb79750b10be9de6a763350c7bf5b80e37763beb79b571c6206e4"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.6.0.zip",
            checksum: "d575e6a1b6e1c24c714229263d8a16b7a96d4072ecbbbe82f923dcce8808c26c"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.6.0.zip",
            checksum: "ea02e43e16d121bc8ecde5f19f2f26b8587bd4be340cb966e3b4f999a47d527a"
        ),
        .binaryTarget(
            name: "valhalla_micro",
            url: "https://globus.software/download/valhalla_micro-3.1.4.zip",
            checksum: "d62c5a8c3ee639e3d4297a6363dcbd4c4a59f640f1f2115cf2460f33e5c20cad"
        ),
    ]
)
