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
            dependencies: ["GLMap", "GLMapCore"],
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
            url: "https://globus.software/download/GLMapCore-2.0.2.zip",
            checksum: "af0c9549b4d61497b805044558318d65dd7565ef94e2813a336b15a7df66d178"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-2.0.2.zip",
            checksum: "12d2922372afb5fac21414967ea2dc4e57fe85aa2612d5ac1c676c1e66da83fc"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-2.0.2.zip",
            checksum: "f9869120240716235caf75bbc3011303ea2b0b025c963d774df97d2a57a98bb6"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-2.0.2.zip",
            checksum: "6b932842a0b286d8e3e7562a86c431aa5cb1a414d499d10654f171d706c93792"
        ),
    ]
)
