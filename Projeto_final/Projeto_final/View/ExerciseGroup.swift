//
//  ExerciseGroup.swift
//  Projeto_final
//
//  Created by Turma02-8 on 08/04/25.
//

import SwiftUI

struct ExerciseGroup: View {
    
    
    @State private var exercicios: [Exercicio] = []
    @StateObject var viewModel = ViewModel()
    var body: some View {
        let musculosUnicos = Array(Set(viewModel.exercicios.compactMap { $0.musculo }))
        //Text("Músculos únicos: \(musculosUnicos)")
        
        ZStack{
            Color(.navBar).ignoresSafeArea()
            VStack{
                HStack{
                    Text("Grupo Muscular").font(.system(size: 30)).foregroundStyle(.white)
                }
                    NavigationStack{
                        VStack{
                            ForEach(musculosUnicos, id:\.self) { musculo in
                                NavigationLink(destination: Exercise(musculo: musculo)){
                                    ZStack{
                                        Image("retangle").frame(width: 300, height: 50).background(.secondaryPreset).cornerRadius(20)
                                        Text(musculo).foregroundStyle(.black).font(.system(size: 30))
                                    }
                                }
                                
                            }
                    }
                    }.background(.navBar)
                Spacer()
            }
        }.onAppear(){
            viewModel.fetchExercicios()
        }
    }
}

#Preview {
    ExerciseGroup()
}
