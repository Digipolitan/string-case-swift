import XCTest
@testable import StringCase

class StringCamelCaseTests: XCTestCase {
    func testCamelCase() {
        XCTAssertEqual("i love swift".camelCased(), "iLoveSwift")
    }

    func testCamelCaseTrim() {
        XCTAssertEqual(" i love swift  ".camelCased(), "iLoveSwift")
    }

    func testCamelCaseTrimAndUpperLetter() {
        XCTAssertEqual(" I Love    Swift ".camelCased(), "iLoveSwift")
    }

    func testCapitalizeCamelCase() {
        XCTAssertEqual("i3 love swift".camelCased(.capitalized), "I3LoveSwift")
    }

    func testCapitalizeCamelCaseTrim() {
        XCTAssertEqual(" i love swift  ".camelCased(.capitalized), "ILoveSwift")
    }

    func testCapitalizeCamelCaseTrimAndUpperLetter() {
        XCTAssertEqual(" I Love    Swift ".camelCased(.capitalized), "ILoveSwift")
    }

    static var allTests: [(String, (StringCamelCaseTests) -> () -> Void)] = [
        ("testCamelCase", testCamelCase),
        ("testCamelCaseTrim", testCamelCaseTrim),
        ("testCamelCaseTrimAndUpperLetter", testCamelCaseTrimAndUpperLetter),
        ("testCapitalizeCamelCase", testCapitalizeCamelCase),
        ("testCapitalizeCamelCaseTrim", testCapitalizeCamelCaseTrim),
        ("testCapitalizeCamelCaseTrimAndUpperLetter", testCapitalizeCamelCaseTrimAndUpperLetter)
    ]
}
