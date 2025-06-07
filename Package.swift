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
            url: "https://globus.software/download/snapshot/GLMapCore-1.12.0-ce886c9e3.zip",
            checksum: "152e6b69aa028cc05e56100d4bce0067e8804b59df7ef2511fb1755fcdc63c4c"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.12.0-ce886c9e3.zip",
            checksum: "8ff4ddcf59a14778bdbd9623af990a66992f27aad3e7d307eb9d27bf88630de7"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.12.0-ce886c9e3.zip",
            checksum: "1c8e1a00e77e64eacc0e9b522e9afed3ca51e5d1597a8c4184d99ab7df9fe903"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.12.0-ce886c9e3.zip",
            checksum: "ed8c498a602dd7bf19b870648ba3098d18ac0d67ae74bad7affe89944720ad73"
        ),
    ]
)
