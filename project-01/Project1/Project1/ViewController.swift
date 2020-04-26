//
//  ViewController.swift
//  Project1
//
//  Created by Arnaud Balma on 4/24/20.
//  Copyright © 2020 Arnaud Balma. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let files = try! FileManager.default.contentsOfDirectory(atPath: Bundle.main.resourcePath!)
        for file in files{
            if file.hasPrefix("nssl"){
                pictures.append(file)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pictures.count
    }
      
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
 
}

