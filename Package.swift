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
            url: "https://globus.software/download/snapshot/GLMapCore-1.7.3-ec71ff0e8.zip",
            checksum: "41924bf297dcd3748c2fbe3f808028c01d1d04c48651f2da78feee7110815db5"
        ),
        .binaryTarget(
            name: "GLMap",
            url: "https://globus.software/download/snapshot/GLMap-1.7.3-ec71ff0e8.zip",
            checksum: "afa610717272731faa138e865dce550ed68bba33d1de3e1184e10a5168860c93"
        ),
        .binaryTarget(
            name: "GLSearch",
            url: "https://globus.software/download/snapshot/GLSearch-1.7.3-ec71ff0e8.zip",
            checksum: "501cd059ef81e3e2c5a3a63a71c02e701eae077317cb0820c05fc9ab7eb98f74"
        ),
        .binaryTarget(
            name: "GLRoute",
            url: "https://globus.software/download/snapshot/GLRoute-1.7.3-ec71ff0e8.zip",
            checksum: "b9bb4bf6ae1bad6d6597d84dbcb89b368df3c19423a7e5426a8f711326d21aaf"
        ),
    ]
)
