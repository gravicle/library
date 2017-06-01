import XCTest
import Nimble
import Library

class BoolArrayTests: XCTestCase {

    func testAtLeastOneTrue() {
        let bools = [false, false, false, true]
        expect(bools.constainsAtleastOneTrue) == true
    }

    func testAtLeastOneTrueWhenThereAreNone() {
        let bools = [false, false, false, false]
        expect(bools.constainsAtleastOneTrue) == false
    }

}
