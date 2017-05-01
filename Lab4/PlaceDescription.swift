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
 * Purpose: This class is for the place descriptions
 *
 * Ser423 Mobile Applications
 * see http://pooh.poly.asu.edu/Mobile
 * @author Miguel Zavala miguel.zavala@asu.edu
 *         Software Engineering, CIDSE, IAFSE, ASU Poly
 * @version April 2017
 */

import Foundation
import UIKit
import CoreData


class PlaceDescription
{
    var addressTitle: String
    var addressStreet: String
    var elevation: Double;
    var latitude: Double;
    var longitude: Double;
    var name: String;
    var image: String
    var description: String;
    var category: String;
    
    
    init(addressTitle:String,addressStreet:String,elevation:Double,latitude:Double,longitude:Double,name:String,image:String,description:String, category:String)
    {
        self.addressTitle = addressTitle;
        self.addressStreet = addressStreet;
        self.elevation = elevation;
        self.latitude = latitude;
        self.longitude = longitude;
        self.name = name;
        self.image = image;
        self.description = description;
        self.category = category;
        
    }
    
    
    func setAddressTitle(addressTitle:String) -> Void {
        self.addressTitle = addressTitle;
    }
    func getAddressTitle() -> String{
        return addressTitle;
    }
    
    func setAddressStreet(addressStreet:String) -> Void {
        self.addressStreet = addressStreet;
    }
    func getAddressStreet() -> String{
        return addressStreet;
    }
    
    func setElevation(elevation:Double) -> Void {
        self.elevation = elevation;
    }
    func getElevation() -> Double{
        return elevation;
    }
    
    func setLatitude(latitude:Double) -> Void {
        self.latitude = latitude;
    }
    func getLatitude() -> Double{
        return latitude;
    }
    
    func setLongitude(longitude:Double) -> Void {
        self.longitude = longitude;
    }
    func getLongitude() -> Double{
        return longitude;
    }
    
    func setName(name:String) -> Void {
        self.name = name;
    }
    func getName() -> String{
        return name;
    }
    
    func setDescription(description:String) -> Void {
        self.description = description;
    }
    func getDescription() -> String{
        return description;
    }
    
    func setCategory(category:String) -> Void {
        self.category = category;
    }
    func getCategory() -> String{
        return category;
    }
    
    func setImage(image:String) -> Void {
        self.image = image;
    }
    func getImage() -> String{
        return image;
    }
    
    
    
    
}
