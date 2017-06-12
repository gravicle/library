import Foundation
import RxSwift

/// A dispose bag that can be drained and then refilled
public final class ReusableDisposeBag {

    private var composite: CompositeDisposable!
    private var lock = NSRecursiveLock()

    public init() {}

    public func dispose() {
        lock.lock()
        defer { lock.unlock() }

        composite?.dispose()
    }

    public func addDisposable(_ disposable: Disposable) {
        lock.lock()
        defer { lock.unlock() }

        if composite == nil || composite.isDisposed { composite = CompositeDisposable() }
        _ = composite.insert(disposable)
    }

    deinit {
        dispose()
    }

}

// MARK: - Allow adding

extension Disposable {

    public func disposed(by bag: ReusableDisposeBag) {
        bag.addDisposable(self)
    }
    
}
