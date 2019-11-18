//
//  ImageViewController.swift
//  Viper_Task
//
//  Created by admin on 13/11/19.
//  Copyright © 2019 vina. All rights reserved.
//

import UIKit
import CoreData

class ImageViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate, UICollectionViewDelegate , UICollectionViewDataSource {
   
    
    var selectedImage1: UIImage?
    var arrayofImagedata: [Data] = []
    var selectedImageData: Data?
    let nsdata = NSData()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
   
    var presenter: LoginViewToPresenterProtocol?
  
    @IBAction func pickAnImage(_ sender: Any){
        
        let alert = UIAlertController(title: "Select Image from", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    //get image from source type
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        guard let imageData = selectedImage.jpegData(compressionQuality: 1) else {
            print("jpg error")
            return
        }
        selectedImageData  = imageData
        // Dismiss the picker.
        dismiss(animated: true, completion:{ self.saveImage()})
    
    }
    
    @IBAction func LogOut(_ sender: Any) {
        
       
        
    
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayofImagedata.count
}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.myImage.image = UIImage(data: arrayofImagedata[indexPath.row])
        return cell
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchImage()
        print(arrayofImagedata)
        print("*****************")
        self.myCollectionView.reloadData()
        _ = Data(referencing: nsdata)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func saveImage() {
        
        if selectedImageData != nil {
            let saveImageObj = Image(context: PersistenceService.context)
            saveImageObj.photo = selectedImageData// as NSData?
            print(selectedImageData ?? "Null")
            PersistenceService.saveContext()
            fetchImage()
            print("*****************")
        }
        
    }
    
    
    func fetchImage() {
        arrayofImagedata = []
        let fetchRequest: NSFetchRequest<Image> = Image.fetchRequest()
        do {
            let myArr = try PersistenceService.context.fetch(fetchRequest)
            for obj in myArr {
                //                let subdata = obj.photo.subdata(with: NSRange(location: rangeStartByte, length: subdataLength))
                let data = Data(referencing: obj.photo! as NSData)
                //print(data)
                print("*****************")
                arrayofImagedata.append(data)
                //print(obj.photo)
                //print(arrayofImagedata)
                self.myCollectionView.reloadData()
            }
        } catch {}
    }
}
