import SwiftUI

struct Treinos: View {
    
    @State var treino : Treino
    
    var body: some View {
        VStack(alignment: .center) {
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
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.white)
                    Text("Duração: \(String(format: "%.1f", treino.duracao!)) minutos")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 10)
        }
        .frame(width: 280, height: 100)
        .background(Color.navBar)
        .cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
        .padding(.bottom, 15)
    }
}
