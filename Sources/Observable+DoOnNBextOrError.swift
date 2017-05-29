import RxSwift

public extension Observable {

    public func doOnNextOrError(_ closure: @escaping () -> Void) -> Observable<Element> {
        return self.do(
            onNext: { _ in closure() },
            onError: { _ in closure() }
        )
    }

}
