public extension String {

    public func fromAppendingPathComponent(_ path: String) -> String {
        let slash: Character = "/"
        let left = characters.last
        let right = path.characters.first

        switch (left, right) {
        case (slash?, slash?):
            return self + path.fromRemovingFirstChar()
        case (slash?, _), (_, slash?):
            return self + path
        default:
            return self + "/" + path
        }
    }

}

extension String {

    func fromRemovingFirstChar() -> String {
        return substring(from: index(after: startIndex))
    }

    func fromRemovingLastChar() -> String {
        return substring(to: index(before: endIndex))
    }

}
