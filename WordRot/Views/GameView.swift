import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var word: String = ""
    
    @ObservedObject var game: Game
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("", text:$word)
                .textFieldStyle(.roundedBorder)
            
            HStack(spacing: 20) {
                Button(action: playWord) {
                    Text("play")
                }
                .buttonStyle(.bordered)
                .foregroundColor(.black)
                
                if let message = game.lastError {
                  Text(message)
                }
            }
            
            Button(action: quitGame) {
                Text("quit")
            }
            .buttonStyle(.bordered)
            .foregroundColor(.black)
        }
        .padding(20)
        .navigationBarBackButtonHidden(true)
    }
    
    func playWord() {
        game.playWord(word.lowercased())
        
        if game.lastError == nil {
            word = ""
        }
    }
    
    func quitGame() {
        game.quit()
        dismiss()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game()
        GameView(game: game)
    }
}