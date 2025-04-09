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
    
    func postExercicio(ex: Exercicio, completion: @escaping ([String: Any]?, Error?) -> Void){
        let url_post_exercicio = url_api+"exercicioPOST"
        //URL válida
        guard let URL = URL(string: url_post_exercicio) else {
            completion(nil, nil)
            return
        }
        
        //Cria a representacão da requisição
        let request = NSMutableURLRequest(url: URL)
        
        let params = [
            "id": ex.id,
            "nome":ex.nome!,
            "musculo": ex.musculo!,
            "image": ex.image!,
            "categoria": ex.categoria!,
            "tempoPorRep": ex.tempoPorRep!,
            "peso": ex.peso!,
            "repeticao": ex.repeticao!,
            "descansoPorRep": ex.descansoPorRep!,
        ] as [String : Any]
        
        do {
                // Converte o array de dicionários em JSON
                let jsonData = try JSONSerialization.data(withJSONObject: params, options: [])
//                print("JsonData"+jsonData)
                // Atribui à requisição o método POST e define o cabeçalho Content-Type como "application/json"
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonData
                
            } catch let error {
                // Em caso de erro ao gerar o JSON
                completion(nil, error)
                return
            }
        
        
        //Cria a tarefa de requisição
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {
//            (data, response, error) in
//            do {
//                
//                if let data = data {
//                    //A resposta chegou
//                    let response = try JSONSerialization.jsonObject(with: data, options: [])
//                    completion(response as? [String : Any], nil)
//                }
//                else {
//                    //Não houve resposta
//                    completion(nil, nil)
//                }
//            } catch let error as NSError {
//                //Houve um erro na comunicao com o servidor
//                completion(nil, error)
//            }
//        }
        
        
        //Aciona a tarefa
//        task.resume()
        
    }
    
    
}
