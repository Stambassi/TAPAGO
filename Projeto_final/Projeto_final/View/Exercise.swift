//
//  Exercise.swift
//  Projeto_final
//
//  Created by Turma02-8 on 08/04/25.
//

import SwiftUI

struct Exercise: View {
    struct Exercicio: Hashable{
        var nome: String
    }
    var body: some View {
        let ex = [Exercicio(nome: "Biceps 7/7/7"),Exercicio(nome: "Biceps corda"),Exercicio(nome: "Rosca scott")]
        ZStack{
            Color(.navBar).ignoresSafeArea()
            VStack{
                HStack{
                    Text("Grupo Muscular").font(.system(size: 30)).foregroundStyle(.white)
                }
                VStack{
                    List(ex, id:\.self) { e in
                        NavigationStack{
                            NavigationLink(destination: ExerciseCRUD()){
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
    Exercise()
}
