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
            url: "https://globus.software/download/GLMapCore-2.0.0.zip",
            checksum: "5a30d5593b5963cac06c1d1c3a1bb09d71585ff993ab9209f9a0f505fb93b313"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-2.0.0.zip",
            checksum: "f03ef0c6d723647b229a64f41532d47d6f58c55fd27e9cba042b5425f9f73831"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-2.0.0.zip",
            checksum: "aa30104eacf3ad8fb74797881d195be741057dd828a36c60e4eeca6cdba03019"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-2.0.0.zip",
            checksum: "e48f5bbbbd54602862ae635648690ef447090c659a4b3b54c4690d5f52772587"
        ),
    ]
)
