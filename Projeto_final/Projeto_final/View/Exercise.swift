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
    @StateObject var viewModel = ViewModel()
    var body: some View {
        let exerciciosFiltrados = viewModel.exercicios.filter { $0.musculo == musculo }
        //Text("Músculos únicos: \(musculosUnicos)")
        
        ZStack{
            Color(.navBar).ignoresSafeArea()
            VStack{
                HStack{
                    Text("Grupo Muscular").font(.system(size: 30)).foregroundStyle(.white)
                }
                Text("Exercícios para \(musculo)")
                                    .font(.system(size: 25))
                                    .padding().foregroundStyle(.white)
                List(exerciciosFiltrados, id: \._id) { exercicio in
                                    VStack(alignment: .leading) {
                                        Text(exercicio.nome ?? "Exercício Sem Nome")
                                            .font(.headline)
                                        Text("Repetições: \(exercicio.repeticao ?? 0)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                    /*NavigationStack{
                        VStack{
                            ForEach(musculosUnicos, id:\.self) { e in
                                NavigationLink(destination: Exercise()){
                                    ZStack{
                                        Image("retangle").frame(width: 300, height: 75).background(.secondaryPreset).cornerRadius(20)
                                        Text(e).foregroundStyle(.black).font(.system(size: 30))
                                    }
                                }
                                
                            }
                    }
                    }.background(.navBar)*/
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
