//
//  ExerciseGroup.swift
//  Projeto_final
//
//  Created by Turma02-8 on 08/04/25.
//

import SwiftUI

struct ExerciseGroup: View {
    
    struct Exercicio: Hashable{
        var nome: String
    }
    var body: some View {
        let ex = [Exercicio(nome: "Biceps"),Exercicio(nome: "Triceps"),Exercicio(nome: "Quadriceps")]
        ZStack{
            Color(.navBar).ignoresSafeArea()
            VStack{
                HStack{
                    Text("Grupo Muscular").font(.system(size: 30)).foregroundStyle(.white)
                }
                VStack{
                    List(ex, id:\.self) { e in
                        NavigationStack{
                            NavigationLink(destination: Exercise()){
                                Text(e.nome).foregroundStyle(.black)
                            }
                        }
                        
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ExerciseGroup()
}
