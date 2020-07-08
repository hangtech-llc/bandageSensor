//
//  ThirdViewController.swift
//  headSensor
//
//  Created by Hall, Sean M. on 6/1/20.
//  Copyright © 2020 Hall, Sean M. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var myImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController(); imagePicker.delegate = self; imagePicker.sourceType = UIImagePickerController.SourceType.camera; imagePicker.allowsEditing = false; self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage; do {  self.myImg.contentMode = .scaleToFill; self.myImg.image = pickedImage; picker.dismiss(animated: true, completion: nil)
    }
        
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
