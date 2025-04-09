//
//  ExerciseType.swift
//  Projeto_final
//
//  Created by Turma02-8 on 08/04/25.
//

import SwiftUI

struct ExerciseType: View {
    var body: some View {
        ZStack{
            Color(.navBar).ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    Text("Selecione o tipo de exercicio").foregroundStyle(.white).font(.system(size: 30))
                    Spacer()
                }.padding()
                Spacer()
                VStack{
                    NavigationStack{
                        //Image("retangle").color(.navBar)
                    }
                }
                
            }
        }
    }
}

#Preview {
    ExerciseType()
}
