public extension Optional {

    public func then(_ operation: (Wrapped) throws -> Void) rethrows {
        switch self {
        case .some(let value):
            try operation(value)
        case .none:
            break
        }
    }

}
