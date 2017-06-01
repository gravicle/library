import Library
import RxSwift
import XCTest
import RxTest
import Nimble

class ReplaceNilTests: XCTestCase {

    func testReplacingNilInAStream() {
        let scheduler = TestScheduler(initialClock: 0)
        let xs = scheduler
            .createColdObservable([next(1, 1), next(2, nil), next(3, 3), completed(4)])
            .asObservable()

        let res = scheduler
            .start { xs.replaceNil(with: 2) }
            .events
        let expectedRes = [next(201, 1), next(202, 2), next(203, 3), completed(204)]

        XCTAssertEqual(res, expectedRes)
    }
    
}
