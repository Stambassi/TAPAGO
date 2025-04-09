import SwiftUI


struct NewWorkoutPage: View {
    
    @State private var showingSheet = false
    @State private var nome: String = ""
    @State private var descricao: String = ""
    @State private var musculos: [String] = ["Peito", "Costas"]
    @State private var duracao: Int = 0
    @State private var descansoPorSerie: Int = 0
    
    @State private var treinos: [Treino] = []
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            
            VStack {
                Text("Criar Novo Treino")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 35, weight: .black))
                
                Spacer()
                    .frame(height: 40)
                
                Image(systemName: "dumbbell.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                
                Spacer()
                    .frame(height: 30)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        ForEach(viewModel.treinos) { treino in
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
                                
                                // Informações embaixo
                                VStack(alignment: .leading) {
                                    Text("Duração: \(treino.duracao!) minutos")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                    Text("Descanso: \(treino.descansoPorSerie!) segundos")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                    Text("Músculos: \(treino.musculos!.joined(separator: ", "))")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom, 10)
                                
                                // Exercícios listados
                                VStack(alignment: .leading) {
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
                        }
                        
                        // Adicionar novo treino
                        Button {
                            showingSheet = true
                        } label: {
                            Image(systemName: "plus.app")
                                .foregroundColor(.white)
                                .font(.system(size: 60))
                        }
                        .sheet(isPresented: $showingSheet) {
                            VStack {
                                Text("Crie seu treino")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                                    .frame(height: 70)
                                
                                HStack {
                                    Text("Nome:")
                                        .font(.system(size: 25, weight: .black))
                                    TextField("Nome do treino...", text: $nome)
                                        .font(.system(size: 19, weight: .regular))
                                }
                                .padding()
                                
                                HStack {
                                    Text("Descrição:")
                                        .font(.system(size: 25, weight: .black))
                                    TextField("Descrição do treino...", text: $descricao)
                                        .font(.system(size: 19, weight: .regular))
                                }
                                .padding()
                                
                                HStack {
                                    Text("Duração:")
                                        .font(.system(size: 25, weight: .black))
                                    TextField("Duração do treino...", value: $duracao, formatter: NumberFormatter())
                                        .font(.system(size: 19, weight: .regular))
                                        .keyboardType(.decimalPad)
                                }
                                .padding()
                                
                                HStack {
                                    Text("Descanso por Série:")
                                        .font(.system(size: 25, weight: .black))
                                    TextField("Descanso por série...", value: $descansoPorSerie, formatter: NumberFormatter())
                                        .font(.system(size: 19, weight: .regular))
                                        .keyboardType(.numberPad)
                                }
                                .padding()
                                
                                VStack(alignment: .leading) {
                                    Text("Exercícios:")
                                        .font(.system(size: 25, weight: .black))
                                    ForEach(viewModel.exercicios) { exercicio in
                                        HStack {
                                            Text(exercicio.nome!)
                                            Spacer()
                                            Text("Reps: \(exercicio.repeticao!)")
                                        }
                                    }
                                }
                                .padding()
                                
                                Button(action: {
                                    //                                    let novoTreino = Treino(id: viewModel.treinos.count + 1, nome: nome, descricao: descricao, musculos: musculos, duracao: duracao, exercicios: [0,1,2], descansoPorSerie: descansoPorSerie)
                                    //                                    treinos.append(novoTreino)
                                    //
                                    //                                    nome = ""
                                    //                                    descricao = ""
                                    //                                    musculos = [""]
                                    //                                    duracao = 0
                                    //                                    descansoPorSerie = 0
                                    //                                    showingSheet = false
                                    
                                }) {
                                    Text("Salvar Treino")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.gray)
                                        .cornerRadius(8)
                                }
                                .padding(.top)
                            }
                            .padding()
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }.onAppear(){
            viewModel.fetchExercicios()
            viewModel.fetchTreinos()
            
        }
    }
}

struct NewWorkoutPage_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutPage()
    }
}
