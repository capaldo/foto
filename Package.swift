// https://www.avanderlee.com/swift/command-line-tool-package-manager/


import PackageDescription

let package = Package(
    name: "foto",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "foto",
            dependencies: []),
        .testTarget(
            name: "fotoTests",
            dependencies: ["foto"]),
    ]
)
