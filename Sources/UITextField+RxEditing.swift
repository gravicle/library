import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITextField {

    public var isEditing: ControlEvent<Bool> {
        let beginEvents = base.rx.controlEvent(.editingDidBegin).map { _ in return true }
        let endEvents = base.rx.controlEvent([.editingDidEnd, .editingDidEndOnExit]).map { _ in return false }
        let source = Observable.merge(beginEvents, endEvents)

        return ControlEvent(events: source)
    }

}

extension Reactive where Base: UITextView {

    public var isEditing: ControlEvent<Bool> {
        let beginEvents = base.rx.didBeginEditing.map { _ in return true }
        let endEvents = base.rx.didEndEditing.map { _ in return false }
        let source = Observable.merge(beginEvents, endEvents)

        return ControlEvent(events: source)
    }
    
}
