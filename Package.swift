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
            url: "https://globus.software/download/snapshot/GLMapCore-1.11.0-6fb5847d7.zip",
            checksum: "172d2ae0d1efbf773e19d39cc205682be83ffe43fd3e8556ea1b4d424c297f94"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.11.0-6fb5847d7.zip",
            checksum: "1e930923e383122d0e140437c9aad9cc880edb68a8f8050f7a5c9a014fe6cc5e"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.11.0-6fb5847d7.zip",
            checksum: "1e7567720678dbf12025ead42ff3584458c672daf84f82bfea56cc1bad26b239"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.11.0-6fb5847d7.zip",
            checksum: "e5da5287d529e9ab6f7b0fac1a56837a3c4b2980dc073691df4c64f748804e3f"
        ),
    ]
)
