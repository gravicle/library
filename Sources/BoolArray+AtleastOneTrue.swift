extension Array where Element == Bool {

    public var constainsAtleastOneTrue: Bool {
        return reduce(false, { (result, bool) -> Bool in
            return result || bool
        })
    }

}
