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
            url: "https://globus.software/download/GLMapCore-2.3.0.zip",
            checksum: "4654dbb0e2687482fd4cdce2ca0b99db0728a8aafe5222ec16c12f01fadcff49"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-2.3.0.zip",
            checksum: "073f0362dfd4eae4bb8d041f02cfdf8f3d61fb7d0bf4b47ae8ac314cbd245f64"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-2.3.0.zip",
            checksum: "2897202603a5ad1e0b1ac157f511351190fc5b09d3a1c6a822bb431ac38839bc"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-2.3.0.zip",
            checksum: "9e4d86af0a10460964946b5c6a2a99ff665bc1fe4aa94d2cc0ba8a42fa6769e4"
        ),
    ]
)
