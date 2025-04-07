import SwiftUI


struct Exercicio: Identifiable {
    var id = UUID()
    var nome: String
    var repeticao: Int
}


struct Treino: Identifiable {
    var id: Int
    var nome: String
    var descricao: String
    var musculos: [String]
    var duracao: Float
    var exercicios: [Exercicio]
    var descansoPorSerie: Int
}

struct NewWorkoutPage: View {
    
    @State private var showingSheet = false
    @State private var nome: String = ""
    @State private var descricao: String = ""
    @State private var musculos: [String] = ["Peito", "Costas"]
    @State private var duracao: Float = 0
    @State private var exercicios: [Exercicio] = [Exercicio(nome: "Flexão", repeticao: 0)]
    @State private var descansoPorSerie: Int = 0
    
    @State private var treinos: [Treino] = []

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Text("Criar Novo Treino")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 35, weight: .black))
                
                Spacer()
                    .frame(height: 30)
                
                Button {
                    showingSheet = true
                } label: {
                    Image(systemName: "plus.app")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                }
                .sheet(isPresented: $showingSheet) {
                    VStack {
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
                            ForEach(exercicios) { exercicio in
                                HStack {
                                    Text(exercicio.nome)
                                    Spacer()
                                    Text("Reps: \(exercicio.repeticao)")
                                }
                            }
                        }
                        .padding()
                        
                        Button(action: {
                           
                            let novoTreino = Treino(id: treinos.count + 1, nome: nome, descricao: descricao, musculos: musculos, duracao: duracao, exercicios: exercicios, descansoPorSerie: descansoPorSerie)
                            treinos.append(novoTreino)
                            
                          
                            nome = ""
                            descricao = ""
                            musculos = [""]
                            duracao = 0
                            exercicios = [Exercicio(nome: "", repeticao: 0)]
                            descansoPorSerie = 0
                            showingSheet = false
                            
                        }) {
                            Text("Salvar Treino")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                        .padding(.top)
                    }
                    .padding()
                }
                
                Spacer()
                    .frame(height: 50)
                
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(treinos) { treino in
                            VStack(alignment: .leading) {
                                Text(treino.nome)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(treino.descricao)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                               
                                Text("Duração: \(treino.duracao) minutos")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                
                                Text("Descanso: \(treino.descansoPorSerie) segundos")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                   
                                    .padding(.bottom, 10)
                                Text("Músculos: \(treino.musculos.joined(separator: ", "))")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                   
                                
                                // Mostrar os exercícios
                                VStack {
                                    Text("Exercícios:")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    ForEach(treino.exercicios) { exercicio in
                                        Text("\(exercicio.nome) - Reps: \(exercicio.repeticao)")
                                            .foregroundColor(.white)
                                            
                                    }
                                }
                                .padding(.top, 10)
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

struct NewWorkoutPage_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutPage()
    }
}
