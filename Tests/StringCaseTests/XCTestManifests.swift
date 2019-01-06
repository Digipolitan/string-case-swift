import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(StringCamelCaseTests.allTests),
        testCase(StringSnakeCaseTests.allTests)
    ]
}
#endif
