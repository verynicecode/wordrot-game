import Foundation

let validWords = [
    "foo",
    "bar"
]

class Game: ObservableObject {
    @Published var isActive = false
    @Published var lastError: String?
    
    var playedWords: [String] = []
    
    func quit() {
        isActive = false
    }
    
    func playWord(_ word: String) {
        guard validWords.contains(word) else { lastError = "word not found"; return }
        guard !playedWords.contains(word) else { lastError = "word already played"; return }
        
        playedWords.append(word)
        lastError = nil
    }
}