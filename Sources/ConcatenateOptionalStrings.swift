public extension Array where Element == String? {

    public func joined(separator: String = "") -> String {
        return flatMap { $0 }.joined(separator: separator)
    }

}
