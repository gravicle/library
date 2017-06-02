public extension Optional where Wrapped == String {

    public var isNotNilNotEmpty: Bool {
        guard
            case .some(let value) = self,
            value.isNotEmpty
            else { return false }

        return true
    }

    public var doesNotExist: Bool {
        return !exists
    }

}

public extension String {

    public var isNotEmpty: Bool {
        return !isEmpty
    }

}
