import RxSwift
import RxCocoa

extension Observable {

    public func void() -> Observable<Void> {
        return map { _ in Void() }
    }

}

extension SharedSequence {

    public func void() -> SharedSequence<S, Void> {
        return map { _ in Void() }
    }

}

extension PrimitiveSequence {

    public func void() -> PrimitiveSequence<Trait, Void> {
        return map { _ in Void() }
    }

}
