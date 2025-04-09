//
//  ViewModel.swift
//  Desafio_11
//
//  Created by Turma02-5 on 01/04/25.
//

import Foundation

let url_api : String = "http://192.168.128.10:1880/"

class ViewModel : ObservableObject {
    
    @Published var exercicios : [Exercicio] = []
    @Published var treinos : [Treino] = []
    
    func fetchExercicios(){
        let url_get_exercicio = url_api+"exercicioGET"
        guard let url = URL(string: url_get_exercicio ) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Exercicio].self, from: data)
                
                DispatchQueue.main.async{
                    self?.exercicios = parsed
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    func fetchTreinos(){
        let url_get_treino = url_api+"treinoGET"
        guard let url = URL(string: url_get_treino ) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Treino].self, from: data)
                
                DispatchQueue.main.async{
                    self?.treinos = parsed
                }
            } catch {
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
    func realizarPostTreino(t: Treino, completion: @escaping ([String: Any]?, Error?) -> Void){
        let url_post_exercicio = url_api+"treinoPOST"
        //URL válida
        guard let URL = URL(string: url_post_exercicio) else {
            completion(nil, nil)
            return
        }
        
        //Cria a representacão da requisição
        var request = URLRequest(url: URL)
        let params = """
            [
                {
                    "id": \(t.id),
                    "nome": "\(t.nome!)",
                    "descricao": "\(t.descricao!)",
                    "musculos": "\(t.musculos!)",
                    "image": "\(t.image!)",
                    "duracao": \(t.duracao!),
                    "exercicios": \(t.exercicios!),
                    "descansoPorSerie": \(t.descansoPorSerie!),
                    "batimentos": [
                        {
                           "id":0,
                           "mpb":80,
                           "horario":0
                        }
                     ],
                }
            ]
            """
        print(params)
        // Converte a string JSON para Data
           guard let jsonData = params.data(using: .utf8) else {
               completion(nil, NSError(domain: "Invalid JSON", code: 400, userInfo: nil))
               return
           }
           
           // Atribui à requisição o método POST e define o cabeçalho Content-Type como "application/json"
           request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = jsonData
           
           // Cria a tarefa de requisição
           let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
               do {
                   if let data = data {
                       // A resposta chegou
                       let response = try JSONSerialization.jsonObject(with: data, options: [])
                       completion(response as? [String: Any], nil)
                   } else {
                       // Não houve resposta
                       completion(nil, nil)
                   }
               } catch let error as NSError {
                   // Houve um erro na comunicação com o servidor
                   completion(nil, error)
               }
           }
           
           // Aciona a tarefa
           task.resume()
        
    }
    func postTreino(treino: Treino){
        realizarPostTreino(t: treino){
            (result, err)  in
            //Aqui você tem seu resultado
            if let res:Bool = (result?.values.first as? Bool) {
                if(res) {
                    //Aqui res podera assumir dois valores, true ou false
                    print("sua requisicao foi realizada com sucesso")
                } else {
                    //Aqui voce pode tratar os erros
                    print("a requisicao nao funcionou")
                }
            }
        }
    }
    
    func realizarPostExercicio(ex: Exercicio, completion: @escaping ([String: Any]?, Error?) -> Void){
        let url_post_exercicio = url_api+"exercicioPOST"
        //URL válida
        guard let URL = URL(string: url_post_exercicio) else {
            completion(nil, nil)
            return
        }
        
        //Cria a representacão da requisição
        var request = URLRequest(url: URL)
        let params = """
            [
                {
                    "id": \(ex.id),
                    "nome": "\(ex.nome!)",
                    "musculo": "\(ex.musculo!)",
                    "image": "\(ex.image!)",
                    "categoria": "\(ex.categoria!)",
                    "tempoPorRep": \(ex.tempoPorRep!),
                    "peso": \(ex.peso!),
                    "repeticao": \(ex.repeticao!),
                    "descansoPorRep": \(ex.descansoPorRep!)
                }
            ]
            """
        print(params)
        // Converte a string JSON para Data
           guard let jsonData = params.data(using: .utf8) else {
               completion(nil, NSError(domain: "Invalid JSON", code: 400, userInfo: nil))
               return
           }
           
           // Atribui à requisição o método POST e define o cabeçalho Content-Type como "application/json"
           request.httpMethod = "POST"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           request.httpBody = jsonData
           
           // Cria a tarefa de requisição
           let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
               do {
                   if let data = data {
                       // A resposta chegou
                       let response = try JSONSerialization.jsonObject(with: data, options: [])
                       completion(response as? [String: Any], nil)
                   } else {
                       // Não houve resposta
                       completion(nil, nil)
                   }
               } catch let error as NSError {
                   // Houve um erro na comunicação com o servidor
                   completion(nil, error)
               }
           }
           
           // Aciona a tarefa
           task.resume()
        
    }
    func postExercicio(exercicio: Exercicio){
        realizarPostExercicio(ex: exercicio){
            (result, err)  in
            //Aqui você tem seu resultado
            if let res:Bool = (result?.values.first as? Bool) {
                if(res) {
                    //Aqui res podera assumir dois valores, true ou false
                    print("sua requisicao foi realizada com sucesso")
                } else {
                    //Aqui voce pode tratar os erros
                    print("a requisicao nao funcionou")
                }
            }
        }
    }
    
    
}
