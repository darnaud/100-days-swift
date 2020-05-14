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
    var imageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
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

    @objc func shareTapped(){
        
        guard let image = ImageView.image?.jpegData(compressionQuality: 0.8)
            else{
                print("No image found")
                return
        }
        
    
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(vc, animated: true)
    }
}
