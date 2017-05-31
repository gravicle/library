import RxSwift
import RxCocoa
import Library
import XCTest
import Nimble

class UIStackViewArrangedSubviewsTests: XCTestCase {

    func testArrangedSubviewsIsEventedWhenAnArrangedSubviewIsAdded() {
        let exp = expectation(description: "")

        var eventNumber = 1
        let stack = UIStackView()
        _ = stack.rx.arrangedSubviews
            .drive(onNext: {
                switch eventNumber {
                case 1:
                    expect($0.count) == 0
                    eventNumber += 1
                case 2:
                    expect($0.count) == 1
                    exp.fulfill()
                default:
                    fatalError("No more events should be dispatched")
                }
            })

        stack.addArrangedSubview(UIView())

        wait(for: [exp], timeout: 1.0)
    }

    func testArrangedSubviewsIsEventedWhenAnArrangedSubviewIsRemoved() {
        let exp = expectation(description: "")

        let view = UIView()
        var eventNumber = 1
        let stack = UIStackView(arrangedSubviews: [view])
        _ = stack.rx.arrangedSubviews
            .drive(onNext: {
                switch eventNumber {
                case 1:
                    expect($0.count) == 1
                    eventNumber += 1
                case 2:
                    expect($0.count) == 0
                    exp.fulfill()
                default:
                    fatalError("No more events should be dispatched")
                }
            })

        stack.removeArrangedSubview(view)

        wait(for: [exp], timeout: 1.0)
    }

}
