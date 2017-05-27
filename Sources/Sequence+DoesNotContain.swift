public extension Sequence {
    public func doesNotContain(where predicate: (Self.Iterator.Element) throws -> Bool) rethrows -> Bool {
        return try !contains(where: predicate)
    }
}

public extension Sequence where Iterator.Element: Equatable {
    public func doesNotContain(_ element: Self.Iterator.Element) -> Bool {
        return !self.contains(element)
    }
}
