// swift-tools-version:5.4

import PackageDescription

let package = Package(name: "foto",
                      products: [
                        .executable(name: "foto", targets: ["foto"])
                      ],
                      dependencies: [
                        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "1.1.0")),
                        .package(url: "https://github.com/JohnSundell/ShellOut", .upToNextMinor(from: "2.3.0"))
                      ],
                      targets: [
                        .executableTarget(name: "foto", dependencies: [
                            .product(name: "ArgumentParser", package: "swift-argument-parser"),
                            .product(name: "ShellOut", package: "ShellOut")
                        ]),
                        .testTarget(name: "fotoTests", dependencies: ["foto"]),
                      ])
