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
 * Purpose: To do calculations on distances
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
import CoreLocation

class Calculations: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    
    
    @IBOutlet weak var place1Picker: UIPickerView!
    @IBOutlet weak var place2Picker: UIPickerView!
    @IBOutlet weak var bearing: UITextField!
    @IBOutlet weak var distance: UITextField!
    
    @IBOutlet weak var textbox2: UITextField!
    @IBOutlet weak var textbox1: UITextField!
    var array: [String] = [String]()
    var array2: [String] = [String]()
    var appDel:AppDelegate?
    var mContext:NSManagedObjectContext?
    var elevation = ""
    var latitude = ""
    var longitude = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDel = (UIApplication.shared.delegate as! AppDelegate)
        mContext = appDel!.managedObjectContext
        array = [String]()
        array2 = [String]()
        let selectRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        do{
            let results = try mContext!.fetch(selectRequest)
            if results.count > 0 {
                
                for aStud in results {
                    let placeName:String = ((aStud as AnyObject).value(forKey: "name") as? String)!
                    array.append(placeName)
                    array2.append(placeName)
                }
            }
        } catch let error as NSError{
            NSLog("Error getting places. Error: \(error)")
        }
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        self.calcDistance()
        self.calcBearing()
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == place1Picker){
            return array[row]
        }
            
        else if (pickerView == place2Picker){
            return array2[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        var countRows:Int = array.count
        
        if pickerView == place2Picker{
            countRows = self.array2.count
        }
        
        return countRows;
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == place1Picker {
            self.textbox1.text = self.array[row]
            self.place1Picker.isHidden = true
        }
            
        else if pickerView == place2Picker{
            self.textbox2.text = self.array2[row]
            self.place2Picker.isHidden = true
            
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.textbox1){
            self.place1Picker.isHidden = false
            
        }
        else if (textField == self.textbox2){
            self.place2Picker.isHidden = false
            
        }
        
    }
    
    func getValues(name:String){
        appDel = (UIApplication.shared.delegate as! AppDelegate)
        mContext = appDel!.managedObjectContext
        // instead of doing a query, could search the students array for the managed object.
        let selectRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        selectRequest.predicate = NSPredicate(format: "name == %@",name)
        do{
            let results = try mContext!.fetch(selectRequest)
            if results.count > 0 {
                latitude = "\(((results[0] as AnyObject).value(forKey: "latitude") as? Double)!)"
                longitude = "\(((results[0] as AnyObject).value(forKey: "longitude") as? Double)!)"
                
            }
        } catch let error as NSError{
            NSLog("Error selecting student Error: \(error)")
        }
    }
    
    func calcDistance(){
        
        getValues(name: textbox1.text!)
        var firstLatitude:Double = Double(self.latitude)!
        var firstLongitude:Double = Double(self.longitude)!
        
        getValues(name: textbox2.text!)
        var secondLatitude:Double = Double(self.latitude)!
        var secondLongitude:Double = Double(self.longitude)!
        
        let coordinate0 = CLLocation(latitude:firstLatitude,longitude:firstLongitude)
        let coordinate1 = CLLocation(latitude:secondLatitude,longitude:secondLongitude)
        let distanceInMeters = coordinate0.distance(from: coordinate1)
        self.distance.text = "\(distanceInMeters)"
        
    
    }
    
    
    
    func calcBearing(){
        
        getValues(name: textbox1.text!)
        var firstLatitude:Double = Double(self.latitude)!
        var firstLongitude:Double = Double(self.longitude)!
        
        getValues(name: textbox2.text!)
        var secondLatitude:Double = Double(self.latitude)!
        var secondLongitude:Double = Double(self.longitude)!
        
        let lat1 = degreesToRadians(degrees: firstLatitude )
        let lon1 = degreesToRadians(degrees: firstLongitude)
        
        let lat2 = degreesToRadians(degrees: secondLatitude)
        let lon2 = degreesToRadians(degrees: secondLongitude)
        
        let dLon = lon2 - lon1
        
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)
        
        self.bearing.text = "\(radiansToDegrees(radians: radiansBearing))"
        
    }
    
    func degreesToRadians(degrees: Double) -> Double { return degrees * M_PI / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / M_PI }
    


}
