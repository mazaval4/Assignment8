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

import UIKit
import CoreData


class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{

    
    var array =  ["School","Travel","Hike"]
    static var nameClicked = ""
    var appDel:AppDelegate?
    var mContext:NSManagedObjectContext?
    var placeName = ""
    var categorySelection = 0
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var addressTitle: UITextField!
    @IBOutlet weak var addressStreet: UITextField!
    @IBOutlet weak var elevation: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var image: UITextField!
    @IBOutlet weak var myPicker: UIPickerView!
    
    

    
    @IBAction func deleteButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Places", message:
            "Place Removed!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
        self.delete()
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Places", message:
            "Place Saved!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
        self.delete()
        self.add()
        
    }
    
    
    override func viewDidLoad() {
        var tempe = ""
        super.viewDidLoad()
        appDel = (UIApplication.shared.delegate as! AppDelegate)
        mContext = appDel!.managedObjectContext
            // instead of doing a query, could search the students array for the managed object.
            let selectRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            selectRequest.predicate = NSPredicate(format: "name == %@",ViewController.nameClicked)
            do{
                let results = try mContext!.fetch(selectRequest)
                if results.count > 0 {
                    desc.text = (results[0] as AnyObject).value(forKey: "descrip") as? String
                    name.text = (results[0] as AnyObject).value(forKey: "name") as? String
                    placeName = (results[0] as AnyObject).value(forKey: "name") as! String
                    addressTitle.text = (results[0] as AnyObject).value(forKey: "address_title") as? String
                    addressStreet.text = (results[0] as AnyObject).value(forKey: "address_street") as? String
                    image.text = (results[0] as AnyObject).value(forKey: "image") as? String
                    elevation.text = "\(((results[0] as AnyObject).value(forKey: "elevation") as? Double)!)"
                    latitude.text = "\(((results[0] as AnyObject).value(forKey: "latitude") as? Double)!)"
                    longitude.text = "\(((results[0] as AnyObject).value(forKey: "longitude") as? Double)!)"
                    tempe = (results[0] as AnyObject).value(forKey: "category") as! String
                }
            } catch let error as NSError{
                NSLog("Error selecting student \(name). Error: \(error)")
            }
        if(tempe == "School"){
            myPicker.selectRow(0, inComponent: 0, animated: true)
        }
        else if(tempe == "Travel"){
            myPicker.selectRow(1, inComponent: 0, animated: true)
        }
        else{
            myPicker.selectRow(2, inComponent: 0, animated: true)
        }
        
        elevation.keyboardType = UIKeyboardType.numberPad;
        latitude.keyboardType = UIKeyboardType.numberPad;
        longitude.keyboardType = UIKeyboardType.numberPad;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        categorySelection = row;
        return array[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count;
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func delete(){
        let selectRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        selectRequest.predicate = NSPredicate(format: "name == %@",placeName)
        do{
            let results = try mContext!.fetch(selectRequest)
            if results.count > 0 {
                mContext!.delete(results[0] as! NSManagedObject)
                try mContext?.save()
            }
        } catch let error as NSError{
            NSLog("error deleting place \(error)")
        }
    }
    func add() {
        
        let addressStreetVar:String = addressStreet.text!
        let addressTitleVar:String = addressTitle.text!
        let descVar:String = desc.text!
        let elevationVar:Double = Double(elevation.text!)!
        let latitudeVar:Double = Double(latitude.text!)!
        let longitudeVar:Double = Double(longitude.text!)!
        let imageVar:String = image.text!
        let nameVar:String = name.text!
        let categoryVar:String = array[categorySelection]
        
        let entity = NSEntityDescription.entity(forEntityName: "Places", in: mContext!)
        let aStud = NSManagedObject(entity: entity!, insertInto: mContext)
        
        aStud.setValue(nameVar, forKey:"name")
        aStud.setValue(addressStreetVar, forKey:"address_street")
        aStud.setValue(addressTitleVar, forKey:"address_title")
        aStud.setValue(categoryVar, forKey:"category")
        aStud.setValue(descVar, forKey:"descrip")
        aStud.setValue(elevationVar, forKey:"elevation")
        aStud.setValue(imageVar, forKey:"image")
        aStud.setValue(latitudeVar, forKey:"latitude")
        aStud.setValue(longitudeVar, forKey:"longitude")
        
        do{
            try mContext!.save()
        } catch let error as NSError{
            NSLog("Error adding PLACE. Error: \(error)")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

