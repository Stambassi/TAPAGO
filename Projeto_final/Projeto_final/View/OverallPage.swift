//
//  OverallPage.swift
//  Projeto_final
//
//  Created by Turma02-25 on 04/04/25.
//

import SwiftUI
import Charts
struct OverallPage: View {
    struct grafico: Identifiable{
        var id = UUID().uuidString
        var day: String
        var desempenho: Double
        var tapago: Bool
    }
    var body: some View {
        var dados = [grafico(day: "Seg", desempenho: 60.0, tapago: true),
                     grafico(day: "Ter", desempenho: 90.0, tapago: true),
                     grafico(day: "Quar", desempenho: 70.0, tapago: true),
                     grafico(day: "Qui", desempenho: 90.0, tapago: true),
                     grafico(day: "Sex", desempenho: 100.0, tapago: true)]
        ZStack{
            Color(.primaryPreset).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView{
                VStack{
                    HStack{
                        Image(systemName: "chevron.backward").foregroundStyle(.white).font(.system(size: 30))
                        Spacer()
                        Text("Overall").foregroundStyle(.white).font(.system(size: 30))
                        Spacer()
                    }.padding()
                    VStack{
                        HStack{
                            ZStack{
                                Image("retangle").resizable().scaledToFit().frame(width: 340, height: 200).background(.navBar).cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
                                HStack{
                                    Image("circle").foregroundStyle(.black).foregroundColor(.blue)
                                    Text("teste").foregroundStyle(.white)
                                    VStack{
                                        Text("Treinos feitos").foregroundStyle(.white).frame(maxWidth: 250, alignment: .trailing)
                                        Text("4/5").foregroundStyle(.white).frame(maxWidth: 250, alignment: .trailing)
                                        Text("Aproveitamento").foregroundStyle(.white).frame(maxWidth: 250, alignment: .trailing)
                                        Text(" 200%").foregroundStyle(.white).frame(maxWidth: 250, alignment: .trailing)
                                        
                                    }//.padding([.horizontal], 50)
                                }
                            }
                        }
                        HStack{
                            ZStack{
                                Image("retangle").resizable().scaledToFit().frame(width: 165, height: 180).background(.navBar).cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
                                VStack{
                                    HStack{
                                        Image(systemName: "bolt.heart.fill").foregroundStyle(.red).font(.system(size: 50))
                                        Text("200").foregroundStyle(.white).font(.system(size: 25))
                                        
                                    }
                                    Text("BPM").foregroundStyle(.white).font(.system(size: 25)).frame(maxWidth: 130, alignment: .trailing)
                                }

                                
                            }
                            ZStack{
                                Image("retangle").resizable().scaledToFit().frame(width: 165, height: 180).background(.navBar).cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
                                VStack{
                                    HStack{
                                        Image(systemName: "dumbbell.fill").foregroundStyle(.red).font(.system(size: 50))
                                        Text("110%").foregroundStyle(.white).font(.system(size: 25))
                                        
                                    }
                                    Text("Desempenho").foregroundStyle(.white).font(.system(size: 25))
                                }
                                
                            }
                        }
                        HStack{
                            ZStack{
                                Image("retangle").resizable().scaledToFit().frame(width: 340, height: 280).background().cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
                                Chart{
                                    ForEach(dados){
                                        e in BarMark(x: .value("Day", e.day), y: .value("Des", e.desempenho))
                                    }
                                }.frame(width: 340, height: 200)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    OverallPage()
}
