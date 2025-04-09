import SwiftUI


struct NewWorkoutPage: View {
    
    @State private var showingSheet = false
    
    @State private var nomeTreino: String = ""
    @State private var descricaoTreino: String = ""
    @State private var duracaoTreino: Float = 0
    @State private var exerciciosTreino: [Int] = [0]
    @State private var descansoPorSerieTreino: Int = 0

    
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
                    VStack() {
                        
                        ForEach(viewModel.treinos) { treino in
                            VStack() {
                                
                                HStack {
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
                                    TextField("Nome do treino...", text: $nomeTreino)
                                        .font(.system(size: 19, weight: .regular))
                                }
                                .padding()
                                
                                HStack {
                                    Text("Descrição:")
                                        .font(.system(size: 25, weight: .black))
                                    TextField("Descrição do treino...", text: $descricaoTreino)
                                        .font(.system(size: 19, weight: .regular))
                                }
                                .padding()
                                
                                HStack {
                                    Text("Duração:")
                                        .font(.system(size: 25, weight: .black))
                                    TextField("Duração do treino:", value: $duracaoTreino, formatter: NumberFormatter())
                                        .font(.system(size: 19, weight: .regular))
                                        .keyboardType(.decimalPad)
                                }
                                .padding()
                                
                                HStack {
                                    Text("Descanso por Série:")
                                        .font(.system(size: 25, weight: .black))
                                    TextField("Descanso:", value: $descansoPorSerieTreino, formatter: NumberFormatter())
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
                                
                                   let batimento = Batimento(id: 0, _id: "", _rev: "", mpb: 80, horario: 0)
                                   let novoTreino = Treino(id: viewModel.treinos.count + 1, _id: "", _rev: "", nome: nomeTreino, descricao: descricaoTreino, musculos: ["Peito"], image: "", duracao: duracaoTreino, exercicios: [0,1,2], descansoPorSerie: descansoPorSerieTreino, batimentos: [batimento])
                                    print(novoTreino)
                                    treinos.append(novoTreino)
                                    showingSheet = false
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

#Preview {
    NewWorkoutPage()
}
