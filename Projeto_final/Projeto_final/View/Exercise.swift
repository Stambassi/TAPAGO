//
//  Exercise.swift
//  Projeto_final
//
//  Created by Turma02-8 on 08/04/25.
//

import SwiftUI

struct Exercise: View {
    let musculo: String
    @State private var exercicios: [Exercicio] = []
    @State private var isShowingSheet = false
    @State private var selectedExercicio: Exercicio? = nil
    @StateObject var viewModel = ViewModel()
    var body: some View {
        let exerciciosFiltrados = viewModel.exercicios.filter { $0.musculo == musculo }
        //Text("Músculos únicos: \(musculosUnicos)")
        
        ZStack{
            Color(.navBar).ignoresSafeArea()
            VStack{
                Text("Exercícios para \(musculo)")
                                    .font(.system(size: 25))
                                    .padding().foregroundStyle(.white)
                NavigationStack{
                    List(exerciciosFiltrados, id: \._id) { exercicio in
                        HStack{
                            Spacer()
                            GIFElement(gifURL: exercicio.image ?? "")
                            Spacer()
                        }
                        HStack {
                            NavigationLink(destination: SheetView(viewModel: viewModel, exercicio: exercicio)){
                                ZStack{
                                    Image("retangle").frame(width: 300, height: 50).background(.secondaryPreset).cornerRadius(20)
                                    Text(exercicio.nome!).foregroundStyle(.black).font(.system(size: 20))
                                }
                                HStack(alignment: .center) {
                                    Spacer()
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.red)
                                        .font(.title2)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }.onAppear(){
            viewModel.fetchExercicios()
        }
    }
}

#Preview {
    Exercise(musculo: "Peito")
}
