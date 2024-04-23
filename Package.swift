// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GLMap",
    platforms: [
        .macOS(.v11), .iOS(.v12),
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
            url: "https://globus.software/download/snapshot/GLMapCore-1.7.6-22c1898a9.zip",
            checksum: "566108c5bdc7d802ab745b80988f271627b4e64ffd977003dc089ba3d4e073fb"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.7.6-22c1898a9.zip",
            checksum: "c264092ebe9e564b47e94b7afd403e2026ba41a1955f21b29a67086d1b6d3858"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.7.6-22c1898a9.zip",
            checksum: "41cbe3e313f7e4821a9c250f22aa4cb9c09145281ff2e77d72b6ab08b76d8eec"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.7.6-22c1898a9.zip",
            checksum: "18bd2d5396fe127bd88f4cf6c7243a4074f9676d293b3cfee0267ba265b95a8c"
        ),
    ]
)
