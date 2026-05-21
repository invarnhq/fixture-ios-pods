import XCTest
@testable import IosPodsDemo

final class IosPodsDemoTests: XCTestCase {
    func testGreeterReturnsExpectedString() {
        XCTAssertEqual(Greeter.greet("Invarn"), "Hello, Invarn!")
    }

    func testGreeterHandlesEmptyName() {
        XCTAssertEqual(Greeter.greet(""), "Hello, !")
    }
}
