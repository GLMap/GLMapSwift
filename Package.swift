// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS(.v10_11), .iOS(.v9)
    ],
    products: [
        .library(
            name: "GLMap",
            targets: ["GLMap", "GLMapSwift"]),
        .library(
            name: "GLSearch",
            targets: ["GLSearch", "GLMap"]),
        .library(
            name: "GLRoute",
            targets: ["GLRoute", "GLMap"])
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
                .copy("Resources/DefaultStyle.bundle")
            ],
            swiftSettings: [.define("SWIFT_PACKAGE")]
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.4.0.zip",
            checksum: "92037b26ee76f7480757ac322a626a78c958428e109b82b8888981bd874eabee"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.4.0.zip",
            checksum: "e44a3932d0703d1741b30786781934664b89a857346451a6040e8ba3055ab637"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.4.0.zip",
            checksum: "321f2bced7ff51083d9e26096d23e5c5657a0ec6a6713d94afc029071a7b085b"
       )
    ]
)
