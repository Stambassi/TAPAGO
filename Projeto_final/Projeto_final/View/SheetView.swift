//
//  SheetView.swift
//  Projeto_final
//
//  Created by Turma02-25 on 09/04/25.
//

import SwiftUI

struct SheetView: View {
    
    
    var onSalvar: ((Treino) -> Void)? = nil

    @State private var showingSheet = false
    
    @State private var nomeTreino: String = ""
    @State private var descricaoTreino: String = ""
    @State private var duracaoTreino: Float = 0.0
    @State private var exerciciosTreino: [Int] = [0]
    @State private var descansoPorSerieTreino: Int = 0

    
    @State private var treinos: [Treino] = []
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    Text("Crie seu treino")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                        .frame(height: 30)
                    
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
                            .keyboardType(.decimalPad)
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
                    
                    HStack(alignment: .bottom){
                        VStack(alignment: .center) {
                            Text("Exercícios:")
                                .font(.system(size: 25, weight: .black))
                            
                            ForEach(viewModel.exercicios) { exercicio in
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Text(exercicio.nome ?? "")
                                        Spacer()
                                        Text("Reps: \(exercicio.repeticao ?? 0)")
                                    }
                                    
                                    HStack {
                                        NavigationLink(destination: ExerciseCRUD()) {
                                            Image(systemName: "square.and.pencil")
                                                .foregroundColor(.blue)
                                        }
                                        
                                        Button {
                                            if let index = viewModel.exercicios.firstIndex(where: { $0.id == exercicio.id }) {
                                                viewModel.exercicios.remove(at: index)
                                            }
                                        } label: {
                                            Image(systemName: "trash.fill")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                            }
                            
                            
                        }
                    }
                }
                
                
                .padding()
                
                Button(action: {
                    let batimento = Batimento(id: 0, _id: "", _rev: "", mpb: 80, horario: 0)
                    
                    let novoTreino = Treino(
                        id: Int.random(in: 1000...9999), // ou use outro método de ID
                        _id: "",
                        _rev: "",
                        nome: nomeTreino,
                        descricao: descricaoTreino,
                        musculos: ["Peito"],
                        image: "",
                        duracao: duracaoTreino,
                        exercicios: exerciciosTreino,
                        descansoPorSerie: descansoPorSerieTreino,
                        batimentos: [batimento]
                    )
                    
                    onSalvar?(novoTreino) // 👈 Dispara o callback
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
        }.onAppear(){
            viewModel.fetchExercicios()
            viewModel.fetchTreinos()
            
        }
       
    }
}

#Preview {
    SheetView()
}
