public extension Optional {

    public var exists: Bool {
        guard case .some = self else {
            return false
        }

        return true
    }

    public var doesNotExist: Bool {
        return !exists
    }

}
