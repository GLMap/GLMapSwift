// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS(.v11), .iOS(.v11),
    ],
    products: [
        .library(
            name: "GLMapSwift",
            targets: ["GLMapCore", "GLMapSwift"]
        ),
        .library(
            name: "GLMapCore",
            targets: ["GLMapCore"]
        ),
        .library(
            name: "GLMap",
            targets: ["GLMap"]
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
            url: "https://globus.software/download/snapshot/GLMapCore-1.7.3-76c88f20b.zip",
            checksum: "b0fe479abdea07f21e85d1b5e39851bf7335aa0215536a3d65f20b00c2df8760"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.7.3-76c88f20b.zip",
            checksum: "f2e5efe3679799135a77006b25b82d4c61dc27cb681ef70880e03b87fdcc4739"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.7.3-76c88f20b.zip",
            checksum: "7e813402684802e09c2adc1713f66bc85cb25e8328e85bfc384800791904651a"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.7.3-76c88f20b.zip",
            checksum: "23f16b58a3b5d228a05940a22265c0430ef88fd447c7e0bd680b6e2515294352"
        ),
    ]
)
