//
//  ScoreHistoryViewController.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import CloudKit

class ScoreHistoryViewController: UITableViewController {

    var games: [Game] = []
    
    override func viewDidLoad() {
        self.loadScores()
        super.viewDidLoad()
    }

    func loadScores() {
        
        let db = CKContainer.default().privateCloudDatabase
        
        let query = CKQuery(recordType: "Game", predicate: NSPredicate(value: true))
        
        db.perform(query, inZoneWith: nil, completionHandler: { games, error in
            if error != nil {
                
                print("Query failed with error \(error?.localizedDescription ?? "none")")
                
            }
            else {
                
                for game in games! {
                    
                    let queue = DispatchQueue(label: "gameQuery")
                    
                    queue.sync {
                        
                        let current = Game(fromRecord: game)
                        print(current.score)
                        self.games.append(current)
                        
                    }
                    
                }
                
            }
            
            self.tableView.reloadData()
            
        })
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)

        cell.textLabel!.text = "Finished in \(self.games[indexPath.row].score) turns on \(self.games[indexPath.row].getDateStr())"
        cell.textLabel!.font = UIFont(name: "AvenirNext-Regular", size: 16)
        cell.textLabel!.textColor = UIColor.white
        
        return cell
    }

}
