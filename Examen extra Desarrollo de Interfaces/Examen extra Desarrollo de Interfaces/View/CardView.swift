//
//  CardView.swift
//  Examen extra Desarrollo de Interfaces
//
//  Created by Pablo  on 24/6/25.
//

import SwiftUI


// Vista que representa visualmente un producto (item) individual
struct CardView: View {
    
    // Recibimos el modelo del producto (item) como propiedad
    var recipe: RecipeModel
    
    
    var body: some View {
        
        VStack{
            
            Divider()
            
            
            HStack{
                
                // Cargamos la imagen del producto desde una URL
                // AsyncImage se encarga de descargarla de forma asíncrona
                AsyncImage(url: URL(string: recipe.image)) { photo in
                    // Si la imagen se carga correctamente, la hacemos redimensionable y le damos tamaño fijo
                    photo.image?.resizable()
                        .frame(width: 150, height: 200).cornerRadius(15)
                }
                Spacer()
                // Mostramos el título del producto
                // Usamos una fuente personalizada con estilo negrita, espaciado y color negro
                Text (recipe.name) .font(Font.custom("Raleway", size: 17).weight(.bold))
                    .tracking(0.80)
                    .foregroundColor(.black)
            }.padding(20)
            Divider()
        }
    }
}

struct CardView_Previews: PreviewProvider {
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
        
        // Mostramos una vista con ese item de prueba
        CardView(recipe: example)
    }
}
