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
            url: "https://globus.software/download/GLMapCore-1.9.0.zip",
            checksum: "784ffd2df059f511412d82c6d041ced46838114b2cc958fab44fe713ecf493fb"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.9.0.zip",
            checksum: "c0d3a3c1c46d5d76c05cc8066c24d7f02bf64f774b692b2596dec6d027d7f3cd"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.9.0.zip",
            checksum: "de45b08fe934eed35a03500e4c5dace38d01215c2e3c9ff30d054d3e19406ddf"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.9.0.zip",
            checksum: "b8fa1207e412226bee670415ee032ee20f79cb6d8008bdef8e4b751666e7b394"
        ),
    ]
)
