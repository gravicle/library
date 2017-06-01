import RxSwift

public extension Observable where Element: OptionalType {
    public func replaceNil(with replacement: Element.Wrapped) -> Observable<Element.Wrapped> {
        return flatMap { (element) -> Observable<Element.Wrapped> in
            guard let value = element.value else {
                return .just(replacement)
            }

            return .just(value)
        }
    }
}
