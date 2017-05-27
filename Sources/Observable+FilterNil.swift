import RxSwift

public extension Observable where Element: OptionalType {
    public func filterNil() -> Observable<Element.Wrapped> {
        return flatMap { (element) -> Observable<Element.Wrapped> in
            guard let value = element.value else {
                return .empty()
            }

            return .just(value)
        }
    }
}
