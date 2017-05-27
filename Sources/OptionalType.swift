/// Protocol to allow unboxing optionals in Generics
public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    public var value: Optional {
        return self
    }
}
