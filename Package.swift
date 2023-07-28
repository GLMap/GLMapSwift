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
            url: "https://globus.software/download/snapshot/GLMapCore-1.7.3-cd5ffed68.zip",
            checksum: "a55af14a865a3e3cc8cfcd6f133b8dfa369c7c50760e8597b0719eccd960b086"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.7.3-cd5ffed68.zip",
            checksum: "24503f4fb40195e3604eec3b4abaa716383024d752725b9f0490c8163e3f9326"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.7.3-cd5ffed68.zip",
            checksum: "5930ea32d00e3996f7d980629d707da221c72a750eb01505e918216884a33893"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.7.3-cd5ffed68.zip",
            checksum: "36f2f2c76845fb15b172738b6513c27b391d1a034747433a2bafff5412e9548a"
        ),
    ]
)
