import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITextField {

    public var isEditing: ControlEvent<Bool> {
        let beginEvents = base.rx.controlEvent(.editingDidBegin).map { return true }
        let endEvents = base.rx.controlEvent([.editingDidEnd, .editingDidEndOnExit]).map { return false }
        let source = Observable.merge(beginEvents, endEvents)

        return ControlEvent(events: source)
    }

}
