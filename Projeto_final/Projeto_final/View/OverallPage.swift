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
        let dados = [grafico(day: "Seg", desempenho: 60.0, tapago: true),
                     grafico(day: "Ter", desempenho: 90.0, tapago: true),
                     grafico(day: "Quar", desempenho: 70.0, tapago: true),
                     grafico(day: "Qui", desempenho: 90.0, tapago: true),
                     grafico(day: "Sex", desempenho: 100.0, tapago: false)]
        let totalTreinos = dados.count
        let treinosConcluidos = dados.filter { $0.tapago }.count
        let treinosNaoConcluidos = totalTreinos - treinosConcluidos

        let progressoConcluido = Double(treinosConcluidos) / Double(totalTreinos) * 360
        let progressoNaoConcluido = Double(treinosNaoConcluidos) / Double(totalTreinos) * 360
        

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
                            ZStack(alignment: .leading){
                                Image("retangle").resizable().scaledToFit().frame(width: 340, height: 200).background(.navBar).cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
                                HStack{
                                    Chart{
                                        SectorMark(
                                                angle: .value("Feitos", progressoConcluido),
                                                innerRadius: .ratio(0.618),
                                                outerRadius: .inset(10),
                                                angularInset: 1
                                            )
                                            .foregroundStyle(Color.secondaryPreset).cornerRadius(10)

                                            SectorMark(
                                                angle: .value("Não Feitos", progressoNaoConcluido),
                                                innerRadius: .ratio(0.618),
                                                outerRadius: .inset(10),
                                                angularInset: 1
                                            )
                                            .foregroundStyle(Color.black).cornerRadius(10)
                                            
                                    }.frame(width: 150, height: 150)
                                        
                                    }
                                            
                                    VStack(alignment: .trailing){
                                        Text("Treinos feitos").foregroundStyle(.white).frame(maxWidth: 330, alignment: .trailing).font(.system(size: 30))
                                        Text("4/5").foregroundStyle(.white).font(.system(size: 25))
                                        Text("Aproveitamento").foregroundStyle(.white).font(.system(size: 25))
                                        Text(" 200%").foregroundStyle(.white).foregroundStyle(.white).font(.system(size: 25))
                                        
                                    }
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
                                Image("retangle").resizable().scaledToFit().frame(width: 340, height: 280).background(.navBar).cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1)).foregroundStyle(.white)
                                Chart{
                                    ForEach(dados){
                                        e in BarMark(x: .value("Day", e.day), y: .value("Des", e.desempenho)).foregroundStyle(.secondaryPreset).cornerRadius(20)
                                        
                                    }
                                }.frame(width: 300, height: 200).background(.navBar)
                                    .chartXAxis {
                                        AxisMarks {
                                            AxisValueLabel().foregroundStyle(.white)
                                        }
                                    }.foregroundStyle(.white).chartYAxis {
                                        AxisMarks {
                                            AxisGridLine().foregroundStyle(.white)
                                            AxisTick().foregroundStyle(.white)
                                            AxisValueLabel().foregroundStyle(.white)
                                        }
                                    }
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
        
    }


#Preview {
    OverallPage()
}
