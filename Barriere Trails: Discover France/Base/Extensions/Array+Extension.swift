extension Array where Element: AdditiveArithmetic {

    var sum: Element {
        reduce(Element.zero, +)
    }
}
