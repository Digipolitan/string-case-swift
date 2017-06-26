import XCTest
@testable import StringCase

class StringSnakeCaseTests: XCTestCase {
    func testSnakeCase() {
        XCTAssertEqual("i love swift".snakeCased(), "i_love_swift")
    }

    func testSnakeCaseTrim() {
        XCTAssertEqual(" i love swift  ".snakeCased(), "i_love_swift")
    }

    func testSnakeCaseTrimAndUpperLetter() {
        XCTAssertEqual(" iLove    Swift ".snakeCased(), "i_love_swift")
    }

    func testSnakeCaseUnderscoreAndWordCaps() {
        XCTAssertEqual("i_LOVE SWIFT".snakeCased(), "i_love_swift")
    }

    func testUpperSnakeCase() {
        XCTAssertEqual("i love swift".snakeCased(.upper), "I_LOVE_SWIFT")
    }

    func testUpperSnakeCaseTrim() {
        XCTAssertEqual(" i love swift  ".snakeCased(.upper), "I_LOVE_SWIFT")
    }

    func testUpperSnakeCaseTrimAndUpperLetter() {
        XCTAssertEqual(" iLove    Swift ".snakeCased(.upper), "I_LOVE_SWIFT")
    }

    func testUpperSnakeCaseUnderscoreAndWordCaps() {
        XCTAssertEqual("i_LOVE SWIFT".snakeCased(.upper), "I_LOVE_SWIFT")
    }

    func testCapitalizeSnakeCase() {
        XCTAssertEqual("i love swift".snakeCased(.capitalized), "I_Love_Swift")
    }

    func testCapitalizeSnakeCaseTrim() {
        XCTAssertEqual(" i love swift  ".snakeCased(.capitalized), "I_Love_Swift")
    }

    func testCapitalizeSnakeCaseTrimAndUpperLetter() {
        XCTAssertEqual(" iLove    Swift ".snakeCased(.capitalized), "I_Love_Swift")
    }

    func testCapitalizeSnakeCaseUnderscoreAndWordCaps() {
        XCTAssertEqual("i_LOVE SWIFT".snakeCased(.capitalized), "I_Love_Swift")
    }

    func testUpperSnakeCaseNumeric() {
        XCTAssertEqual("i3Swift".snakeCased(), "i_3_swift")
    }

    static var allTests: [(String, (StringSnakeCaseTests) -> () -> Void)] = [
        ("testSnakeCase", testSnakeCase),
        ("testSnakeCaseTrim", testSnakeCaseTrim),
        ("testSnakeCaseTrimAndUpperLetter", testSnakeCaseTrimAndUpperLetter),
        ("testSnakeCaseUnderscoreAndWordCaps", testSnakeCaseUnderscoreAndWordCaps),
        ("testUpperSnakeCase", testUpperSnakeCase),
        ("testUpperSnakeCaseTrim", testUpperSnakeCaseTrim),
        ("testUpperSnakeCaseTrimAndUpperLetter", testUpperSnakeCaseTrimAndUpperLetter),
        ("testUpperSnakeCaseUnderscoreAndWordCaps", testUpperSnakeCaseUnderscoreAndWordCaps),
        ("testCapitalizeSnakeCase", testCapitalizeSnakeCase),
        ("testCapitalizeSnakeCaseTrim", testCapitalizeSnakeCaseTrim),
        ("testCapitalizeSnakeCaseTrimAndUpperLetter", testCapitalizeSnakeCaseTrimAndUpperLetter),
        ("testCapitalizeSnakeCaseUnderscoreAndWordCaps", testCapitalizeSnakeCaseUnderscoreAndWordCaps),
        ("testUpperSnakeCaseNumeric", testUpperSnakeCaseNumeric)
    ]
}
