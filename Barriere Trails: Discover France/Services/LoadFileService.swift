import Foundation

class LoadFileService {
    
    init() {}

    func loadItems<T: Codable>() -> [T] {
        guard let url = Bundle.main.url(forResource: "items", withExtension: "json") else {
            print("Failed to locate itens.json in bundle.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedItems = try JSONDecoder().decode([T].self, from: data)
            return decodedItems
        } catch {
            print("Failed to decode items.json: \(error)")
            return []
        }
    }
}
