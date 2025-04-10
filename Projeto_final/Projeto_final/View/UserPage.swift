//
//  UserPage.swift
//  Projeto_final
//
//  Created by Turma02-25 on 04/04/25.
//

import SwiftUI

struct UserPage: View {
    var body: some View {
        ZStack {
            Color(.primaryPreset)
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Text("Meu Perfil")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }.padding(30)
                Spacer()
                ScrollView {
                    HStack {
                        AsyncImage(url: URL(string: "https://img.freepik.com/fotos-premium/retrato-de-um-homem-fitness-em-camiseta-preta_600776-38516.jpg?w=360")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 210, height: 260)
                        .clipShape(.circle)
                        Spacer()
                        VStack {
                            Text("Andre")
                                .font(.title)
                                .foregroundColor(.white)
                            Text("Tah Pago")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("+99 99999 9999")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            ZStack {
                                Rectangle()
                                    .frame(width: 125, height: 50)
                                    .foregroundColor(.navBar)
                                    .clipShape(.rect(cornerRadius: 30))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(.gray, lineWidth: 2)
                                    )
                                Text("Profissional")
                                    .foregroundColor(.secondaryPreset)
                            }
                        }
                    }.padding()
                    Spacer()
                    VStack {
                        HStack {
                            Text("Sobre mim")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                            Spacer()
                        }.padding()
                        HStack {
                            Text("O melhor marombeiro da zona de Belo Horizonte, qualquer duvida que tiver sobre academia e a maromba é so me chamar")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                        }.padding()
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Text("Habilidades - PRs")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                            Spacer()
                        }.padding()
                        ScrollView (.horizontal) {
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("TERRA")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("SUPINO")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("LEGPRESS")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("MARATONA")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }.padding()
                        }
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Text("Redes Sociais")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                            Spacer()
                        }.padding()
                        ScrollView (.horizontal) {
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("Yt: @Tapago")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("X: @Tapago")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .frame(width: 145, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("TikTok: @Tapago")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                ZStack {
                                    Rectangle()
                                        .frame(width: 125, height: 50)
                                        .foregroundColor(.navBar)
                                        .clipShape(.rect(cornerRadius: 30))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(.gray, lineWidth: 2)
                                        )
                                    Text("Fb: @tapago")
                                        .foregroundColor(.gray)
                                }
                               Spacer()
                            }.padding()
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    UserPage()
}
