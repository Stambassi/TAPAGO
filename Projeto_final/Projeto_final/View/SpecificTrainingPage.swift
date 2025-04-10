//
//  SpecificTrainingPage.swift
//  Projeto_final
//
//  Created by Turma02-25 on 04/04/25.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    
    var buttonColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(buttonColor)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct SpecificTrainingPage: View {
    
    @State var treino: Treino
    @StateObject var viewModel = ViewModel()
    
    @State var treinando = false
    @State var buttonText = "Começar Treino!"
    @State var buttonColor = Color.secondaryPreset
    
    var body: some View {
        ZStack {
            Color.primaryPreset
                .ignoresSafeArea()
            VStack {
                Text("\(treino.nome!)")
                    .foregroundColor(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                ScrollView {
                    if(treino.exercicios != nil){
                        ForEach(treino.exercicios!, id:\.self) { abc in
                            ForEach(viewModel.exercicios){ ex in
                                if(ex.id == abc){
                                    VStack {
                                        GIFElement(gifURL: ex.image!)
                                        Text(ex.nome!)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                    }
                }
                
                Button("\(buttonText)") {
                    if(!treinando) {
                        treinando = true
                        buttonText = "Concluir Treino"
                        buttonColor = .green
                    } else {
                        buttonText = "TAPAGO"
                        buttonColor = .secondaryPreset
                    }
                }
                .buttonStyle(GrowingButton(buttonColor: buttonColor))
            }
        }.onAppear(){
            viewModel.fetchExercicios()
            viewModel.fetchTreinos()
        }
    }
}

#Preview {
    SpecificTrainingPage(treino: Treino(id:0, _id: "a", _rev: " ", nome:"Treino A", descricao:"Meu treino favorito de peito", musculos:["Musculação"],image:"dumbbell.fill",duracao:60,exercicios:[1,2,3,4,5,6,7,8,9,10],descansoPorSerie:60,batimentos:[Batimento(id:0, _id: "", _rev: "",mpb:80,horario:0)]))
}
