//
//  RecipeModel.swift
//  Examen extra Desarrollo de Interfaces
//
//  Created by Pablo  on 24/6/25.
//

import Foundation


struct RecipeModel: Decodable, Identifiable{
let id: Int
let name: String
let ingredients: [String]
let instructions: [String]
let prepTimeMinutes: Int
let cookTimeMinutes: Int
let servings: Int
let difficulty: String
let cuisine: String
let caloriesPerServing: Int
let tags: [String]
let userId: Int
let image: String
let rating: Double
let reviewCount: Int
let mealType: [String]
}

struct RecipeResponse : Decodable{
    let recipes: [RecipeModel]
}
