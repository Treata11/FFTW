// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FFTW",
    platforms: platforms,
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FFTW",
            targets: ["SwiftFFTW", "FFTW"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftFFTW",
            dependencies: ["FFTW"],
            path: "Sources/Swift"
        ),
        .target(
            name: "FFTW",
            dependencies: [
                .target(name: "fftw")
            ],
            path: "Sources/C"
        ),
        .binaryTarget(
            name: "fftw",
            path: "./Frameworks/fftw.xcframework"
        )
    ]
)

// MARK: -

fileprivate var platforms: [SupportedPlatform] = [.iOS(.v13), .macOS(.v12)]
