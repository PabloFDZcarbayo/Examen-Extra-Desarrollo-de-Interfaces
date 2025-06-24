//
//  ContentView.swift
//  Examen extra Desarrollo de Interfaces
//
//  Created by Pablo  on 24/6/25.
//

import SwiftUI

struct MainView: View {
    
    
    @StateObject private var recipeViewModel = RecipeViewModel()
    
    private let dificulties = ["Medium", "Easy"]
    @State var selectedDificultie: String = "Easy"
    
    var dificultieFilter : [RecipeModel] {
               
        return recipeViewModel.recipies.filter { recipe in
            recipe.difficulty.localizedCaseInsensitiveContains(selectedDificultie) //El metodo localizedCaseInsentiveContains busca una subcadena dentro de una cadena, ignorando mayusculas y minusculas, con lo cual es realmente util en este caso
                   }
               }
           
         
    
    var body: some View {
        NavigationStack{
            
            VStack {
                Text("RECETAS RAPIDAS").font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                
                // Picker para cambiar de dificultad
                                   Picker("Dificultad", selection: $selectedDificultie) {
                                       ForEach(dificulties, id: \.self) { dificultie in
                                           Text(dificultie.capitalized) //Pone la primera letra en mayus
                                         }
                                       }
                                       .pickerStyle(.segmented)
                                       .padding()
                
                
                // Scroll vertical que contiene la lista de productos
                ScrollView{
                    // Creamos una grilla con dos columnas flexibles
                    LazyVGrid(columns: [GridItem(.flexible())]) {
                        // Recorremos la lista de productos traídos por el ViewModel
                        ForEach(dificultieFilter){ recipe in
                            
                            // Cada celda navega a una vista de detalle (aún sin datos)
                            NavigationLink(destination: DetailView(recipe: recipe)){
                                
                                // Mostramos el producto usando la vista individual
                                CardView(recipe: recipe)
                            }
                        }
                    }
                }
            }
            
            // Al aparecer la vista, se lanza la carga de datos asincrónica
        }.onAppear{
            Task{
                do{
                    try await recipeViewModel.getRecipies()
                } catch{
                    print("no se puedieron obtener los productos")
                }
            }
         
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    MainView()
    }
}
