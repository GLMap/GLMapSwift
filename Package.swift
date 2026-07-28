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
            url: "https://globus.software/download/GLMapCore-2.0.1.zip",
            checksum: "6af69ebd0a48dc0d4afe021a8da226d9dcd583369d263c4b3032ad20c31446ed"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/GLMap-2.0.1.zip",
            checksum: "e0917f61b0bb58b0745c813df6b1839a6f2597a0bd3257df7e58f9d6d1cddd8d"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/GLSearch-2.0.1.zip",
            checksum: "95718d0db9e8ac627c97376ee480fb06efb4a328318c39ca4947c5c04a419328"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/GLRoute-2.0.1.zip",
            checksum: "cf639ab65d225b152f43c122038881dd26e51eaa018089fb24c0ee74d72d83f4"
        ),
    ]
)
