import SwiftUI

struct Treinos: View {
    
    @State var treino : Treino
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "dumbbell.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    
                VStack(alignment: .leading) {
                    Text(treino.nome!)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(treino.descricao!)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 10)
            VStack(alignment: .leading) {
                Text("Duração: \(treino.duracao!) minutos")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 10)
        }
        .frame(width: 340, height: 100)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
    }
}
