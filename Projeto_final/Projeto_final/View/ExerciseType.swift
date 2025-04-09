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
                    Text("Selecione o tipo de exercicio").foregroundStyle(.white).font(.system(size: 30))
                }.padding()
                VStack{
                    NavigationStack{
                        
                        ZStack{
                        Image("retangle").frame(width: 300, height: 100).background(.red).cornerRadius(20)
                            NavigationLink(destination: ExerciseGroup()){
                                Text("Musculacao").font(.system(size: 30)).foregroundStyle(.white)
                            }
                        }
                        ZStack{
                        Image("retangle").frame(width: 300, height: 100).background(.red).cornerRadius(20)
                            NavigationLink(destination: ExerciseGroup()){
                                Text("Cardio").font(.system(size: 30)).foregroundStyle(.white)
                            }
                        }
                        ZStack{
                            Image("retangle").frame(width: 300, height: 100).background(.red).cornerRadius(20)
                            NavigationLink(destination: ExerciseGroup()){
                                Text("Alongamento").font(.system(size: 30)).foregroundStyle(.white)
                            }
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ExerciseType()
}
