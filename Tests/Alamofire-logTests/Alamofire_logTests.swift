import XCTest
@testable import Alamofire_log

final class Alamofire_logTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Alamofire_log().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
