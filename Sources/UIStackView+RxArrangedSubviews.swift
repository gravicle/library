import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base == UIStackView {

    public var arrangedSubviews: Driver<[UIView]> {
        let added = base.rx.methodInvoked(#selector(Base.addArrangedSubview(_:)))
        let removed = base.rx.methodInvoked(#selector(Base.removeArrangedSubview(_:)))

        return Observable.merge(added, removed)
            .map { _ in self.base.arrangedSubviews }
            .startWith(self.base.arrangedSubviews)
            .asDriver(onErrorJustReturn: [])
    }

}
