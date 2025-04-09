//
//  Model.swift
//  Projeto_final
//
//  Created by Turma02-5 on 04/04/25.
//

import Foundation

struct Treino: Codable, Identifiable {
    let id: Int
    let _id : String?
    let _rev: String?
    let nome: String?
    let descricao :String?
    let musculos: [String]?
    let image: String?
    let duracao: Float?
    let exercicios : [Int]?
    let descansoPorSerie: Int?
    let batimentos : [Batimento]?
}

struct Exercicio: Codable, Identifiable{
    let _id : String?
    let _rev: String?
    let id: Int
    let nome: String?
    let musculo: String?
    let image: String?
    let categoria: String?
    let tempoPorRep : Float?
    let peso:[Int]?
    let repeticao: Int?
    let descansoPorRep: Int?
}

struct Batimento:  Codable, Identifiable{
    let id: Int
    let _id : String?
    let _rev: String?
    let mpb: Int?
    let horario: Float?
    
}

