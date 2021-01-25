// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BogusApp-Common-Utils",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BogusApp-Common-Utils",
            targets: ["BogusApp-Common-Utils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Realm/SwiftLint", from: "0.28.1"),
        .package(url: "https://github.com/orta/Komondor", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BogusApp-Common-Utils",
            dependencies: []),
        .testTarget(
            name: "BogusApp-Common-UtilsTests",
            dependencies: ["BogusApp-Common-Utils"]),
    ]
)

#if canImport(PackageConfig)
    import PackageConfig

    let config = PackageConfiguration([
        "komondor": [
            "pre-push": "swift test",
            "pre-commit": [
                "swift test",
                "swift run swiftlint autocorrect --path Sources/",
                "git add .",
            ],
        ],
    ]).write()
#endif
