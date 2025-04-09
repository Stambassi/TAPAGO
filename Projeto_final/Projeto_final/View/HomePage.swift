import SwiftUI
import Charts

struct HomePage: View {
    
    struct grafico: Identifiable{
        var id = UUID().uuidString
        var day: String
        var desempenho: Double
        var tapago: Bool
    }
    
    @State var currentDate: Date = Date()
    
    @State private var treinos: [Treino] = []
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        let dados = [grafico(day: "Seg", desempenho: 60.0, tapago: true),
                     grafico(day: "Ter", desempenho: 90.0, tapago: true),
                     grafico(day: "Quar", desempenho: 70.0, tapago: true),
                     grafico(day: "Qui", desempenho: 90.0, tapago: true),
                     grafico(day: "Sex", desempenho: 100.0, tapago: true)]
        
        ZStack {
            Color(.primaryPreset)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HStack {
                        Text("Bem vindo, Andre!")
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    HStack {
                        Text("\(currentDate.formatted(.dateTime.weekday().day().month()))")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        Spacer()
                    }
                }.padding()
                HStack{
                    ZStack{
                        Image("retangle").resizable().scaledToFit().frame(width: 340, height: 250).background(.navBar).cornerRadius(30).overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 1))
                        Chart{
                            RuleMark(y: .value("Media", 60))
                                .foregroundStyle(Color.white)
                            ForEach(dados){ e in
                                LineMark(
                                    x: .value("Index", e.day),
                                    y: .value("Value", e.desempenho)
                                )
                                .interpolationMethod(.catmullRom)
                                .lineStyle(StrokeStyle(lineWidth: 3))
                                .foregroundStyle(Color.secondaryPreset)
                                
                                PointMark(
                                    x: .value("Index", e.day),
                                    y: .value("Value", e.desempenho)
                                )
                                .foregroundStyle(Color.secondaryPreset)
                            }
                        }
                        .frame(width: 300, height: 200)
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
                }.padding(.bottom)
                VStack {
                    HStack {
                        Text("Meus Treinos")
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                    HStack {
                        Text("Escolha seu treino")
                            .foregroundColor(.white)
                            .font(.subheadline)
                        Spacer()
                    }
                }.padding()
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.treinos) { treino in
                        Treinos(treino: treino)
                    }
                }
                .padding(.horizontal)
            }
        }.onAppear(){
            viewModel.fetchExercicios()
            viewModel.fetchTreinos()
        }
    }
}

#Preview {
    HomePage()
}
