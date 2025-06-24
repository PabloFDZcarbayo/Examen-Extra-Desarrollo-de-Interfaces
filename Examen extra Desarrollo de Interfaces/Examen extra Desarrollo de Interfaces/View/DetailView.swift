//
//  DetailView.swift
//  Examen extra Desarrollo de Interfaces
//
//  Created by Pablo  on 24/6/25.
//
import SwiftUI

struct DetailView: View {
    // Recibimos un item a mostrar desde otra vista
    var recipe: RecipeModel
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 20){ // Título del producto con estilo destacado
                
                Text(recipe.name).font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                AsyncImage(url: URL(string: recipe.image)) { photo in
                 
                    photo.image?.resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
                
                HStack{
                    
                    Text(recipe.difficulty).font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text(recipe.cuisine).font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    
                }
                
                HStack{
                    
                    
                    Text(String(recipe.prepTimeMinutes)).font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Text(String(recipe.cookTimeMinutes)).font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                    
                }
                
                Text("INGREDIENTES").font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                
                VStack{
                    ForEach(recipe.ingredients, id:\.self){ ingredient in
                     
                        Text(ingredient)
                            .font(.body)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                
                Text("INSTRUCCIONES").font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack{
                    ForEach(recipe.instructions, id:\.self){ ingredient in
                        
                        Text(ingredient)
                            .font(.body)
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
                
            }
        }
    }
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            
            // Creamos un objeto ItemModel de ejemplo con datos simulados
            let example = RecipeModel(
                id: 1,
                name: "Prueba",
                ingredients: [ "Pizza dough",
                               "Tomato sauce"],
                instructions: ["Preheat the oven to 475°F (245°C).",
                               "Roll out the pizza dough and spread tomato sauce evenly."],
                prepTimeMinutes: 20,
                cookTimeMinutes: 30,
                servings: 77,
                difficulty: "Dificil",
                cuisine: "Italiana",
                caloriesPerServing: 320,
                tags: ["Pizza",
                       "Italian"],
                userId: 4,
                image:"https://cdn.dummyjson.com/recipe-images/1.webp",
                rating: 19.5,
                reviewCount: 6,
                mealType: ["Dinner"]
            )
            
            DetailView(recipe: example)
        }
    }

