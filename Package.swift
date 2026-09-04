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
            url: "https://globus.software/download/GLMapCore-2.1.0.zip",
            checksum: "adb694ab70ce6aad96c7f747e1a61c7246b7170f0fb0271032c9cf987f54f9b2"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-2.1.0.zip",
            checksum: "817277c709bfb0026aadd8ce0325e27d33599dd2cd3174dd3f159cbe1652b30b"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-2.1.0.zip",
            checksum: "516a52a57736e7be8fe8d55d6855898334d542f4db1879ccae9525d80179ce91"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-2.1.0.zip",
            checksum: "a596c447f1b2573053f3fdc63c4eb620881111ee5185d13fb79591bd68317d61"
        ),
    ]
)
