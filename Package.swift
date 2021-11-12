// swift-tools-version:5.4

import PackageDescription

let package = Package(name: "foto",
                      products: [
                        .executable(name: "foto", targets: ["foto"])
                      ],
                      dependencies: [
                        .package(url: "https://github.com/apple/swift-argument-parser", .branch("main")),
                        .package(url: "https://github.com/JohnSundell/ShellOut", .branch("master"))
                      ],
                      targets: [
                        .executableTarget(name: "foto", dependencies: [
                            .product(name: "ArgumentParser", package: "swift-argument-parser"),
                            .product(name: "ShellOut", package: "ShellOut")
                        ]
                        ),
                        .testTarget(name: "fotoTests", dependencies: ["foto"]),
                      ]
)
