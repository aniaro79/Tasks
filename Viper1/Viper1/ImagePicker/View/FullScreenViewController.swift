//
//  FullScreenViewController.swift
//  Viper1
//
//  Created by admin on 19/11/19.
//  Copyright © 2019 IBM. All rights reserved.
//

import UIKit
import CoreData
class FullScreenViewController:  UIViewController {

    @IBOutlet weak var FullImage: UIImageView!
    var indexCount : Int = 0
    //var Pictures = [Image]()
    
    var selectedImage1: [UIImage]=[]
    var arrayofImagedata: [Data] = []
    var selectedImageData: Data?
    let nsdata = NSData()
    
    func fetchImagetoScale() {
        arrayofImagedata = []
        let fetchRequest: NSFetchRequest<Image> = Image.fetchRequest()
        do {
            let myArr = try PersistenceService.context.fetch(fetchRequest)
            for obj in myArr {
                //                let subdata = obj.photo.subdata(with: NSRange(location: rangeStartByte, length: subdataLength))
                
                let data = Data(referencing: obj.photo! as NSData)
                //print(data)
                //print("*****************")
                arrayofImagedata.append(data)
               // print(obj.photo)
                // print("Obj.photo*****************")
               // print(arrayofImagedata)
                    //print("arrayofimagedata*****************")
              
            }
        } catch {}
    }
    
    func showImage()
    {   
        print(indexCount)
        var image = arrayofImagedata[indexCount]
        print(image)
        let image2 = UIImage(data: image)
        FullImage.image = image2
        
    }
    
    @objc func deleteImage()
    {
        print("deleteImage")
        let fetchRequest: NSFetchRequest<Image> = Image.fetchRequest()
        if let result = try? PersistenceService.context.fetch(fetchRequest){
//            for object in result {
//
               PersistenceService.context.delete(result[indexCount])
//            }
            PersistenceService.saveContext()
            self.navigationController?.popViewController(animated: false)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(FullScreenViewController.deleteImage)), animated: true)

        fetchImagetoScale()
        showImage()
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

}
