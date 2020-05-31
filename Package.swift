// swift-tools-version:5.2

/// https://www.avanderlee.com/swift/command-line-tool-package-manager/
import PackageDescription

let package = Package(
    name: "foto",
    products: [
        .executable(name: "foto", targets: ["foto"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.0.1")),
    ],
    targets: [
        .target(name: "foto", dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(name: "fotoTests", dependencies: ["foto"]),
    ]
)
