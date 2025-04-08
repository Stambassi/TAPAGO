//
//  ExerciseCRUD.swift
//  Projeto_final
//
//  Created by Turma02-3 on 04/04/25.
//

import SwiftUI

struct ExerciseCRUD: View {
    
    @State var nome: String = ""
    
    @State var duracao: Int = 0
    
    enum Reps: String, CaseIterable, Identifiable {
        case ateFalha, um, dois, tres, quatro, cinco, seis, sete, oito, nove, dez, onze, doze, treze, quatorze, quinze, dezesseis, dezessete, dezoito, dezenove, vinte
        var id: Self { self }
    }

    @State private var selectedReps: Reps = .um
    
    var body: some View {
        ZStack {
            Color(.primaryPreset)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("Personalizar Exercicio")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "figure.strengthtraining.traditional")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.white)
                    .background(.navBar)
                    .cornerRadius(10)
                Spacer()
                HStack {
                    Text("Nome:")
                        .foregroundColor(.white)
                        .font(.title2)
                    Spacer()
                    TextField("Nomeie o exercício", text: $nome)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading)
                        .frame(width: 200)
                        .multilineTextAlignment(TextAlignment.center)
                }
                .padding(35)
                .frame(width: 370, height: 55)
                .background(.navBar)
                .cornerRadius(10)
                .padding(35)
                HStack {
                    Text("Repetições")
                        .foregroundColor(.white)
                        .font(.title2)
                    Spacer()
                    Picker(selection: $selectedReps, label: Text("Picker")) {
                        Text("Ate a Falha!").tag(Reps.ateFalha)
                        Text("1").tag(Reps.um)
                        Text("2").tag(Reps.dois)
                        Text("3").tag(Reps.tres)
                        Text("4").tag(Reps.quatro)
                        Text("5").tag(Reps.cinco)
                        Text("6").tag(Reps.seis)
                        Text("7").tag(Reps.sete)
                        Text("8").tag(Reps.oito)
                        Text("9").tag(Reps.nove)
                        Text("10").tag(Reps.dez)
                        Text("11").tag(Reps.onze)
                        Text("12").tag(Reps.doze)
                        Text("13").tag(Reps.treze)
                        Text("14").tag(Reps.quatorze)
                        Text("15").tag(Reps.quinze)
                        Text("16").tag(Reps.dezesseis)
                        Text("17").tag(Reps.dezessete)
                        Text("18").tag(Reps.dezoito)
                        Text("19").tag(Reps.dezenove)
                        Text("20").tag(Reps.vinte)
                    }
                    .onChange(of: selectedReps) { tag in print("Color tag: \(tag)") }
                    .tint(.white)
                }
                .padding(35)
                .padding(.bottom, 0)
                .frame(width: 370, height: 55)
                .background(.navBar)
                .cornerRadius(10)
                HStack {
                    Text("Descanso:")
                        .foregroundColor(.white)
                        .font(.title2)
                    Spacer()
                    TextField("Enter your TimeBreak", value: $duracao, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .padding(.leading)
                        .frame(width: 75)
                        .multilineTextAlignment(TextAlignment.center)
                    Text("segundos.")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                .padding(35)
                .frame(width: 370, height: 55)
                .background(.navBar)
                .cornerRadius(10)
                .padding(35)
                Spacer()
                HStack {
                    Button("Adcionar Exercicio", action: {  })
                        .foregroundColor(.white)
                        .frame(width: 150, height: 40)
                        .background(.secondaryPreset)
                        .cornerRadius(10)
                }.padding()
                Spacer()
            }
        }
    }
}

#Preview {
    ExerciseCRUD()
}
