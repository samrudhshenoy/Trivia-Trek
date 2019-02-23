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

    var scores: [Score] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadScores()
    }

    func loadScores() {
        
        let db = CKContainer.default().privateCloudDatabase
        
        let query = CKQuery(recordType: "Score", predicate: NSPredicate(value: true))
        
        db.perform(query, inZoneWith: nil, completionHandler: { scores, error in
            if error != nil {
                
                print("Query failed with error \(error?.localizedDescription ?? "none")")
                
            }
            else {
                
                for score in scores! {
                    
                    let queue = DispatchQueue(label: "scoreQuery")
                    
                    queue.sync {
                        
                        let currentScore = Score(fromRecord: score)
                        self.scores.append(currentScore)
                        
                    }
                    
                }
                
            }
            
        })
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath)

        cell.textLabel?.text = "Finished in \(self.scores[indexPath.count].value) turns on \(self.scores[indexPath.count].date)"

        return cell
    }

}
