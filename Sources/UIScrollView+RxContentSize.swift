import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base == UITableView {

    public var contentSize: Driver<CGSize> {
        return observe(CGSize.self, #keyPath(UITableView.contentSize))
            .replaceNil(with: .zero)
            .asDriver(onErrorJustReturn: .zero)
    }

}
