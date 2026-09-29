// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS("12.0"), .iOS("15.0"),
    ],
    products: [
        // Binary-only products let plugin hosts give Swift conveniences one owner.
        .library(name: "GLMapBinary", targets: ["GLMap"]),
        .library(name: "GLSearchBinary", targets: ["GLSearch"]),
        .library(name: "GLRouteBinary", targets: ["GLRoute"]),
        .library(name: "GLMapCore", targets: ["GLMapCore", "GLMapCoreSwift"]),
        .library(
            name: "GLMap",
            targets: ["GLMap", "GLMapCore", "GLMapSwift"]
        ),
        .library(
            name: "GLSearch",
            targets: ["GLSearch", "GLMapCore", "GLMapCoreSwift"]
        ),
        .library(
            name: "GLRoute",
            targets: ["GLRoute", "GLMapCore", "GLMapCoreSwift"]
        ),
    ],
    targets: [
        .target(
            name: "GLMapCoreSwift",
            dependencies: ["GLMapCore"],
            path: ".",
            exclude: ["SwiftExtensions.swift", "README.md", "LICENSE.txt"],
            sources: ["CoreSwiftExtensions.swift"],
            resources: [
                .copy("Resources/world.vm"),
                .copy("Resources/fonts"),
                .copy("Resources/DefaultStyle.bundle"),
            ],
            swiftSettings: [.define("SWIFT_PACKAGE")]
        ),
        .target(
            name: "GLMapSwift",
            dependencies: ["GLMap", "GLMapCore", "GLMapCoreSwift"],
            path: ".",
            exclude: ["CoreSwiftExtensions.swift", "Resources", "README.md", "LICENSE.txt"],
            sources: ["SwiftExtensions.swift"]
        ),
        .binaryTarget(
            name: "GLMapCore",
            url: "https://globus.software/download/GLMapCore-2.2.0.zip",
            checksum: "766bb41975ded79b938e2f89ddf2a23430dc881973af96d1004958683438e496"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-2.2.0.zip",
            checksum: "35eb22f723470b1011730d986ffda75058add5c040233a24d1d513d23955b192"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-2.2.0.zip",
            checksum: "f333b4c0b3db437c8a0c77c9c60d7e23c8229e91234b2d6481e8f24faf49df53"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-2.2.0.zip",
            checksum: "67ef0b6b81ab53ad7e44dff4188e9a102dc38041a2fa527b29d48d7a3bd2bb23"
        ),
    ]
)
