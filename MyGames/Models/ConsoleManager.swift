//
//  ConsoleManager.swift
//  MyGames
//
//  Created by Rafaela on 18/07/20.
//  Copyright © 2020 Rafaela. All rights reserved.
//

import CoreData

class ConsolesManager {
    static let shared = ConsolesManager()
    var consoles: [Console] = []
    
    func loadConsoles (with context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do{
            consoles = try context.fetch(fetchRequest)
            //jeito mais facil porem apenas para poucos dados,se houver muitos é melhor usar a forma do GamesTableViewController
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteConsole(index: Int, context: NSManagedObjectContext) {
        let console = consoles[index]
        context.delete(console) // assim apenas apaga do contexto, não persiste a informacao
        do {
            try context.save() //assim persiste a informacao
            consoles.remove(at: index)
        } catch {
            print(error.localizedDescription)
        }
    }
 
    private init() {
        
    }
}
