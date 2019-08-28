//
//  docTableViewController.swift
//  CoreDataDocumentsChallenge
//
//  Created by Danae N Nash on 8/28/19.
//  Copyright © 2019 Danae N Nash. All rights reserved.
//

import UIKit
import CoreData

class docTableViewController: UITableViewController {

    var docs = [Document]()
    
    var managedObjectContex: NSManagedObjectContext? {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        retrieveNotes()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return docs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath) as! docTableViewCell

        let doc: Document = docs[indexPath.row]
        cell.configureCell(doc: doc)


        return cell
    }
    

    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {

        return true
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadData()
    }
 
    func retrieveNotes(){
        managedObjectContex?.perform {
            self.fetchNotesFromCoreData { docs in
                if let docs = docs {
                    self.docs = docs
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func fetchNotesFromCoreData(completion: @escaping (([Document]?) -> Void)) {
        managedObjectContex?.perform {
            var doc = [Document]()
            let request: NSFetchRequest<Document> = Document.fetchRequest()
            
            do {
                doc = try self.managedObjectContex!.fetch(request)
                completion(doc)
            }
            catch {
                print("Could not fetch items")
            }
        }
    }
    

}
