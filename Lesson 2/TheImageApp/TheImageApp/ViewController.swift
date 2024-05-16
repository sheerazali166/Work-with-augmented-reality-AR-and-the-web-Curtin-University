//
//  ViewController.swift
//  TheImageApp
//
//  Created by Sheeraz on 14/05/2024.
//

import UIKit

import SafariServices

import MessageUI


class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shareButtonTapped(_ sender: UIButton) {
        
        print("shareButtonTapped")
        
        
        // 1
        guard let image = imageView.image else {return}
        
        // 2
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        // 3
        activityController.popoverPresentationController?.sourceView = sender
        
        // 4
        present(activityController, animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
    
        print("safariButtonTapped")
        
        if let url = URL(string: "https://www.curtin.edu.au") {
            
             let safariViewController = SFSafariViewController(url: url)
                
             present(safariViewController, animated: true, completion: nil)
     
        }
        
        
    }
    
    
    @IBAction func photoButtonTapped(_ sender: UIButton) {
    
        print("photoButtonTapped")
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        // abandoned dog mama will never press remote button
        // give me remote i will press button infront of whole world without show off
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
      
       /* let  cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            action in print("Camera was sellected")
        })
        
        */
        
      /*  let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in print("Photo Library was sellected")
        })
        */
        alertController.addAction(cancelAction)
       // alertController.addAction(cameraAction)
      //  alertController.addAction(photoLibraryAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
                
                action in imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
                
                action in imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        
        
        
        
        
        
        
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
        
        
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
    
        print("emailButtonTapped")
        
        if !MFMailComposeViewController.canSendMail() {
            
            print("Can not send mail")
            return
            
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["Taylor@swift.com"])
        mailComposer.setSubject("Testing for your Taylor Swift")
        mailComposer.setMessageBody("Hello Taylor!", isHTML: false)
        present(mailComposer, animated: true, completion: nil)
        
        
        
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

