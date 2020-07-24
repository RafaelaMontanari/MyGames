//
//  ViewController+CoreData.swift
//  MyGames
//
//  Created by Rafaela on 17/07/20.
//  Copyright © 2020 Rafaela. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    
    var context: ManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
