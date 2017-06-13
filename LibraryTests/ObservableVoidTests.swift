import XCTest
import RxSwift
import Library
import RxTest
import Nimble

class ObservableVoidTests: XCTestCase {

    func testThatElemetnsAreVoided() {
        let scheduler = TestScheduler(initialClock: 0)
        let xs = scheduler
            .createColdObservable([next(1, 1), next(2, 2), next(3, 3), completed(4)])
            .asObservable()

        let values = scheduler
            .start { xs.void() }
            .events
            .map { $0.value }
            .flatMap { $0.element }

        let expectedValues = (0..<3).map { _ in Void() }

        zip(values, expectedValues).forEach { (arg) in
            expect(arg.0) == arg.1
        }
    }

}
