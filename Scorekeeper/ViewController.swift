//
//  ViewController.swift
//  Scorekeeper
//
//  Created by Cal Stephens on 10/4/16.
//  Copyright © 2016 Cal Stephens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var scores = ["Cal" : 0, "Brian" : 0, "Komal" : 0]
    
    
    //MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "score", for: indexPath) as! ScoreCell
        
        let name = Array(scores.keys)[indexPath.item]
        
        cell.decorate(for: name, in: self)
        
        return cell
    }

}


class ScoreCell : UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    weak var controller: ViewController!
    var name: String!
    
    func decorate(for name: String, in controller: ViewController) {
        self.name = name
        self.controller = controller
        
        self.label.text = "\(name): \(controller.scores[name] ?? 0)"
    }
    
    
    //MARK: - User Interaction
    
    func changeScore(offset: Int) {
        var score = self.controller.scores[self.name] ?? 0
        score += offset
        
        self.controller.scores[self.name] = score
        
        self.label.text = "\(self.name ?? ""): \(score)"
    }
    
    @IBAction func subtractPoint(_ sender: AnyObject) {
        self.changeScore(offset: -1)
    }
    
    @IBAction func addPoint(_ sender: AnyObject) {
        self.changeScore(offset: 1)
    }
    
    
    
}
