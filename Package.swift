// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ManagedConfigFilesDemo",
    platforms: [
        .macOS(.v14)
    ],
    targets: [
        .executableTarget(
            name: "ManagedConfigFilesDemo",
            dependencies: [
                "ManagedConfigurationFilesShim"
            ]
        ),
        .target(
            name: "ManagedConfigurationFilesShim",
            linkerSettings: [
                .linkedLibrary("ManagedConfigurationFiles")
            ]
        )
    ]
)
