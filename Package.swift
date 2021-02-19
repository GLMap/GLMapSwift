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
            checksum: "15338df0914fdd53ff26abd38919785b692719e313f3f3ec625e6e33c5915f80"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-1.4.0.zip",
            checksum: "092a198eb2e1083b5ad55f460d9c0c88f53236929186079efc5047529f3c64ff"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-1.4.0.zip",
            checksum: "88fdda92b207bf5f446299fb4c107a0a5129cc38a8525129f66c2ce73aa201b5"
       )
    ]
)
