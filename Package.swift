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
            url: "https://globus.software/download/GLMapCore-1.7.3.zip",
            checksum: "3151958d8dee627622a5f13ebcaa00058ed3ccbceb8b2fec7d95c95574fa87f7"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-1.7.3.zip",
            checksum: "28bba40e2f37c4b8490c34cb09d5da1516bff74ca93ede68fcbf24ce2fd03606"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.7.3.zip",
            checksum: "72418450bf15db9b3a35d9673f8c8ebbd0aa36e6d41e604c18971d1edc180122"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.7.3.zip",
            checksum: "347aacf7d73e71ada4e18f99f5479a415121e0337abdcd45bc69003bc3721afc"
        ),
    ]
)
