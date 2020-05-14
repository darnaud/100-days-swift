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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        
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

 
    @objc func shareButtonTapped(){
        let message = "Hey Social Media friends, download this great app! #ElToro"
        let url = URL(string: "https://www.eltoro.com")!
        let vc = UIActivityViewController(activityItems: [message, url], applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }
}
