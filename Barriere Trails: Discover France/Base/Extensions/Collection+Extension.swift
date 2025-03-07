import Foundation

extension Collection {
    
    var indexedItems: [EnumeratedSequence<Self>.Element] {
        return Array(enumerated())
    }
    
    subscript(safe index: Index?) -> Element? {
        guard let index else { return nil }
        return indices.contains(index) ? self[index] : nil
    }
}
