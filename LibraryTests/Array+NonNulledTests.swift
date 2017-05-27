import XCTest
import Nimble

class ArryNonNulledTests: XCTestCase {

    func testNonNullingAnArrayOfOptionals() {
        let array: [Int?] = [1, 2, nil, 4]
        expect(array.nonNulled) == [1, 2, 4]
    }

}
