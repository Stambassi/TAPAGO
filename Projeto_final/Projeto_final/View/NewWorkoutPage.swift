import SwiftUI


struct NewWorkoutPage: View {
    
    @State private var showingSheet = false
    
    @State private var nomeTreino: String = ""
    @State private var descricaoTreino: String = ""
    @State private var duracaoTreino: Float = 0.0
    @State private var exerciciosTreino: [Int] = [0]
    @State private var descansoPorSerieTreino: Int = 0
    
    @State var idAux: Int = 0
    
    @State private var treinos: [Treino] = []
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color(.primaryPreset).ignoresSafeArea()
                VStack {
                   
                    Text("MEUS TREINOS")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 35))
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Image(systemName: "dumbbell.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 60))
                    
                    Spacer()
                        .frame(height: 30)
                    
                    ScrollView {
                        VStack(alignment: .center) {
                            
                            ForEach(viewModel.treinos) { treino in
                                VStack(alignment: .center){
                                    
                                    HStack {
                                        VStack(alignment: .center) {
                                            Text(treino.nome!)
                                                .foregroundColor(.red)
                                                .font(.system(size:18, weight: .black))
                                            
                                            Text(treino.descricao!)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(10)
                                    .frame(width: 370)
                                    
                                    
                                    VStack(alignment: .center) {
                                        Text("Duração: \(String(format: "%.0f", treino.duracao!)) minutos")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        
                                        Text("Descanso: \(treino.descansoPorSerie!) segundos")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        
                                        Text("Músculos: \(treino.musculos!.joined(separator: ", "))")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    }
                                    
                                    
                                    // Exercícios listados
                                    VStack(alignment: .center) {
                                        Text("Exercícios:")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                        
                                        if(treino.exercicios != nil){
                                            ForEach(treino.exercicios!, id:\.self) { i in
                                                ForEach(viewModel.exercicios){ ex in
                                                    if(ex.id == i){
                                                        Text(ex.nome!)
                                                            .font(.subheadline)
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(6)
                                Spacer()
                                .frame(height: 20)
                            }
                            Text("Criar Novo Treino")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .font(.system(size: 24, weight: .black))
                            
                            // Adicionar novo treino
                            Button {
                                showingSheet = true
                            } label: {
                                Image(systemName: "plus.app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                            }
                            .sheet(isPresented: $showingSheet) {
                                SheetView(viewModel: viewModel)
                            }

                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }.onAppear(){
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                    viewModel.fetchExercicios()
                    viewModel.fetchTreinos()
                }
            }
        }
    }
}

#Preview {
    NewWorkoutPage()
}
