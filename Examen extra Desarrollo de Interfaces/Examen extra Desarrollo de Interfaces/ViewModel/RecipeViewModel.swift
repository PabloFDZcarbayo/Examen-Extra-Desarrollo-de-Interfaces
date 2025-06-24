//
//  RecipeViewModel.swift
//  Examen extra Desarrollo de Interfaces
//
//  Created by Pablo  on 24/6/25.
//

import Foundation

public class RecipeViewModel: ObservableObject {
    
    @Published var recipies: [RecipeModel] = []
    
    public func getRecipies() async throws {
        do {
            
            // 1. Construcción de la URL base
            
            let urlComponents = URLComponents (string: "https://dummyjson.com/recipes")!
           
           
            
            // 2. Validación de la URL construida
                    guard let url = urlComponents.url else{
                        print ("fallo en la llamada de electronics")
                        return
                    }
                    
                    // 3. Preparación de la solicitud HTTP
                    var request = URLRequest(url : url)
                    request.httpMethod = "GET" //Indicamos que operación queremos hacer
            
           
                    
                    // 4. Realizamos la llamada HTTP
                                // El método `data(for:)` es asíncrono y lanza excepciones si falla la solicitud
                    let (data, response) =  try await URLSession.shared.data(for: request)
                    
                    //Verificacion de la respuesta, comprobando si el resultado es un 200
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                        print ("fallo en la respuesta de electronics")
                        return
                    }
            
            //Decodificamos el Json, esta vez como la API nos devuelve un obejto "product" con todos los objetos y en la carpeta model ya habiamos creado otra strict para ello lo decodificamos como un obejto normal
                        let Response = try JSONDecoder().decode(RecipeResponse.self, from: data)
                        
                        //Asignamos los resultados a nuestra variable inicial, indicando el atributo de nuestra struct
                        DispatchQueue.main.async{
                            self.recipies = Response.recipes
                        }
                    } catch {
                        print ("Error al ejecutar")
                    }
        }
    }
