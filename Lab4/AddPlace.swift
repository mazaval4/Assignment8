	/*
 * Copyright 2017 Miguel Zavala,
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * Purpose: To display descriptions of places 
 *
 * Ser423 Mobile Applications
 * see http://pooh.poly.asu.edu/Mobile
 * @author Miguel Zavala miguel.zavala@asu.edu
 *         Software Engineering, CIDSE, BSSE, ASU Poly
 * @version April 2017
 */

import Foundation
    import UIKit
    import CoreData



class AddPlace: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{

    var array =  ["School","Travel","Hike"]
//    var placeLibary = 
    
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var addressTitleTextField: UITextField!
    @IBOutlet weak var addressStreetTextField: UITextField!
    @IBOutlet weak var elevationTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var picker1: UIPickerView!
    
    
    var appDel:AppDelegate?
    var mContext:NSManagedObjectContext?
    
    override func viewDidLoad() {
        appDel = (UIApplication.shared.delegate as! AppDelegate)
        mContext = appDel!.managedObjectContext
        super.viewDidLoad()
    }
    
    
    @IBAction func savePlaceButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Places", message:
            "Place Added!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        let addressStreet:String = addressStreetTextField.text!
        let addressTitle:String = addressTitleTextField.text!
        let desc:String = descTextField.text!
        let elevation:Double = Double(elevationTextField.text!)!
        let latitude:Double = Double(latitudeTextField.text!)!
        let longitude:Double = Double(longitudeTextField.text!)!
        let image:String = imageTextField.text!
        let name:String = nameTextField.text!
        let category:String = array[0]
        if mContext != nil {
            print("Contains a value!")
        } else {
            print("Doesn’t contain a value.")
        }
        let entity = NSEntityDescription.entity(forEntityName: "Places", in: mContext!)
        let aStud = NSManagedObject(entity: entity!, insertInto: mContext)
        aStud.setValue(name, forKey:"name")
        aStud.setValue(addressStreet, forKey:"address_street")
        aStud.setValue(addressTitle, forKey:"address_title")
        aStud.setValue(category, forKey:"category")
        aStud.setValue(desc, forKey:"descrip")
        aStud.setValue(elevation, forKey:"elevation")
        aStud.setValue(image, forKey:"image")
        aStud.setValue(latitude, forKey:"latitude")
        aStud.setValue(longitude, forKey:"longitude")
        do{
            try mContext!.save()
        } catch let error as NSError{
            NSLog("Error adding PLACE. Error: \(error)")
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        placeLibary.setCategorySelected(cat: array[row]);
        return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
}

