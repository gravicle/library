import XCTest
import Library
import Nimble

class DictionaryMergeTests: XCTestCase {

    func testMergingDictionariesWithoutConflictingKeys() {
        let left = [1: "one", 2: "two"]
        let right = [3: "three", 4: "four"]

        expect(left.merge(with: right)) == [1: "one", 2: "two", 3: "three", 4: "four"]
    }

    func testLeftMergingDictionariesWithConflictingKeys() {
        let left = [1: "one", 2: "two"]
        let right = [2: "otherTwo", 3: "three"]

        expect(left.merge(with: right)) == [1: "one", 2: "two", 3: "three"]
    }

}
