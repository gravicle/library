public extension Array where Element: OptionalType {

    /// Flattened to include only exsiting elements
    public var nonNulled: [Element.Wrapped] {
        return self.flatMap { $0.value }
    }

}
