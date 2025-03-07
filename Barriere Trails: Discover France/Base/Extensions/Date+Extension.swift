import Foundation

extension Date {
    
    func add(_ component: Calendar.Component, value: Int) -> Date {
        Calendar.current.date(byAdding: component, value: value, to: self)!
    }
}
