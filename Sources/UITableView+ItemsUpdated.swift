import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITableView {

    public var itemsUpdated: ControlEvent<Void> {
        let itemChangeEvents = [
            base.rx.itemDeleted.map { _ in Void() },
            base.rx.itemInserted.map { _ in Void() },
            base.rx.itemMoved.map { _ in Void() }
        ]

        /* 
         Included becasue selection can involve changing size of cells,
         which affects content layout.
        */
        let selectionEvents = [
            base.rx.itemSelected.map { _ in Void() },
            base.rx.itemDeselected.map { _ in Void() }
        ]

        let events = Observable.merge(itemChangeEvents + selectionEvents)
        return .init(events: events)
    }

}
