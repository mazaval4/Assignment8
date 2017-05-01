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
 * Purpose: To display  places
 *
 * Ser423 Mobile Applications
 * see http://pooh.poly.asu.edu/Mobile
 * @author Miguel Zavala miguel.zavala@asu.edu
 *         Software Engineering, CIDSE, BSSE, ASU Poly
 * @version April 2017
 */
import UIKit
import CoreData
x

class PlaceList: UITableViewController{
    
    
    var placeNames: [String] = [String]()
    var appDel:AppDelegate?
    var mContext:NSManagedObjectContext?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDel = (UIApplication.shared.delegate as! AppDelegate)
        mContext = appDel!.managedObjectContext
        
        self.updatePlaces()
        
       
    }
    
    
    // get all the courses taken by student and update the takes TF and Picker appropriately.
    func updatePlaces(){
        placeNames = [String]()
        let selectRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        do{
            let results = try mContext!.fetch(selectRequest)
            if results.count > 0 {
                
                for aStud in results {
                    let placeName:String = ((aStud as AnyObject).value(forKey: "name") as? String)!
                    placeNames.append(placeName)
                }
            }
        } catch let error as NSError{
            NSLog("Error getting places. Error: \(error)")
        }
        self.tableView.reloadData()
        
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updatePlaces()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNames.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
        cell.textLabel?.text = placeNames[indexPath.item]
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedItem = indexPath[1]
        ViewController.nameClicked = placeNames[selectedItem]
        
    }
    
    
    
    
    
}

