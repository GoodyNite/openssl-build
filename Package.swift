// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "openssl",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14)],
    products: [
        .library(name: "openssl", targets: ["_openssl"]),
    ],
    targets: [
        // Need a dummy target to embedded correctly.
        // https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "_openssl",
            dependencies: ["Libssl", "Libcrypto"],
            path: "Sources/_Dummy"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libssl",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libssl.xcframework.zip",
            checksum: "a8bf0a562a782150fc3da6bd4a9dad726b27da9a67b4fde7b611b0711515b749"
        ),
        .binaryTarget(
            name: "Libcrypto",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libcrypto.xcframework.zip",
            checksum: "b90a39a7d1809411f4399e217d0707f7bc4c4ce3402c9c23380a8ffbabd7d0da"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
