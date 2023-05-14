import XCTest
@testable import Thunderstorm

final class ClearSkyFormatterTests: XCTestCase {

    func testFormatWindSpeed() throws {
        let locale = Locale(identifier: "nl-BE")
        let formatter = ClearSkyFormatter(locale: locale)

        XCTAssertEqual(formatter.formatWindSpeed(12.35), "20 km/u")
    }

    func testFormatTemperature() throws {
        let locale = Locale(identifier: "nl-BE")
        let formatter = ClearSkyFormatter(locale: locale)

        XCTAssertEqual(formatter.formatTemperature(32.0), "0 °C")
    }

}
