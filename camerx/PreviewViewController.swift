//
//  PreviewViewController.swift
//  camerx
//
//  Created by HGPMac62 on 7/20/18.
//  Copyright © 2018 HGPMac62. All rights reserved.
//

import UIKit
import Firebase
class PreviewViewController: UIViewController {
    @IBOutlet weak var photo: UIImageView!
    
    var image: UIImage!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
    }
    
    override func viewDidLoad() {
       photo.image = self.image
    }
    
    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var redFilter: UIImageView!
    @IBOutlet weak var yellowFilter: UIImageView!
    @IBOutlet weak var blueFilter: UIImageView!
    
    
   
    @IBAction func yellow(_ sender: Any) {
        blueFilter.isHidden = true
        redFilter.isHidden = true
        yellowFilter.isHidden = true
        blueFilter.isHidden = true
        redFilter.isHidden = true
        yellowFilter.isHidden = false
        
    }
    
    
    @IBAction func blue(_ sender: Any) {
        blueFilter.isHidden = true
        redFilter.isHidden = true
        yellowFilter.isHidden = true
        blueFilter.isHidden = false
        redFilter.isHidden = true
        yellowFilter.isHidden = true
    }
    
  
    @IBAction func red(_ sender: Any) {
        blueFilter.isHidden = true
        redFilter.isHidden = true
        yellowFilter.isHidden = true
        blueFilter.isHidden = true
        yellowFilter.isHidden = true
        redFilter.isHidden = false
    }
    
    
    @IBAction func saveButton_touchUpInside(_ sender: Any) {
        bar.isHidden = true
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    
        var imagesToShare = [AnyObject]()
        imagesToShare.append(image!)
        
        let activityViewController = UIActivityViewController(activityItems: imagesToShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        present(activityViewController, animated: true, completion: nil)
        bar.isHidden = false
    }
    @IBAction func cancelButton_touchUpInside(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
