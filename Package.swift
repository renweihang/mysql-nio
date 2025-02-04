// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "mysql-nio",
    platforms: [
       .macOS(.v10_15),
       .iOS(.v13),
    ],
    products: [
        .library(name: "MySQLNIO", targets: ["MySQLNIO"]),
    ],
    dependencies: [
        .package(url: "https://github.com/renweihang/swift-crypto.git", "1.0.0" ..< "3.0.0"),
        .package(url: "https://github.com/renweihang/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/renweihang/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/renweihang/swift-nio-ssl.git", from: "2.14.0"),
    ],
    targets: [
        .target(name: "MySQLNIO", dependencies: [
            .product(name: "Crypto", package: "swift-crypto"),
            .product(name: "Logging", package: "swift-log"),
            .product(name: "NIO", package: "swift-nio"),
            .product(name: "NIOSSL", package: "swift-nio-ssl"),
        ]),
        .testTarget(name: "MySQLNIOTests", dependencies: [
            .target(name: "MySQLNIO"),
        ]),
    ]
)
