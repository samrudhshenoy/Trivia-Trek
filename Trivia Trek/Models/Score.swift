//
//  Score.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import CloudKit

class Score: NSObject {

    var value: Int
    var date: String
    
    init(fromRecord record: CKRecord) {
        
        self.value = record.object(forKey: "value") as! Int
        self.date = record.object(forKey: "date") as! String
        
    }
}
