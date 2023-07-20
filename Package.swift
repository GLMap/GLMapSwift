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
            url: "https://globus.software/download/snapshot/GLMapCore-1.7.3-7fbf6e43c.zip",
            checksum: "3c44f7264b2d243b7fcc6b0872ed61fb3d72fd7c754b9bc56d294a79d83c53db"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.7.3-7fbf6e43c.zip",
            checksum: "f7122423fe160e7b91b249c73f22143bd3ae480bfc1f5a73f9c7a66968be800b"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.7.3-7fbf6e43c.zip",
            checksum: "13762b62088500a98c99e93222ee47abe2596e8dc984f01ab5ffa4a28f6af556"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.7.3-7fbf6e43c.zip",
            checksum: "ebeadc0d1146cb71c79ee6961cd727a7bdec621c255012a3765c354b0dc3f87f"
        ),
    ]
)
