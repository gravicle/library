public extension Dictionary {

    /// Left merge: Preserves values from left dictionary
    public func merge(with other: Dictionary) -> Dictionary {
        return reduce(other) { (dict, element) -> Dictionary in
            var dict = dict
            dict[element.key] = element.value
            return dict
        }
    }

}
