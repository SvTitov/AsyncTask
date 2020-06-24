import XCTest
@testable import AsyncTask

final class AsyncTaskTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AsyncTask().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
