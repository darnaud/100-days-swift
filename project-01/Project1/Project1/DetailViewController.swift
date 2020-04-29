//
//  DetailViewController.swift
//  Project1
//
//  Created by Arnaud Balma on 4/28/20.
//  Copyright © 2020 Arnaud Balma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    @IBOutlet var ImageView: UIImageView!
    var selectedImage: String?
    var pictureIndex:Int?
    var totalPictures:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
        
        title = "\(pictureIndex! + 1) of \(totalPictures!)"
        
    } 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
