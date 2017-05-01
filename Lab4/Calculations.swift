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

class Calculations: UIViewController{
    
    
//    var myarray = 
    
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var bearing: UITextField!
    @IBOutlet weak var elevation: UITextField!
    
    override func viewDidLoad() {
        
//        latitude.text = String(myarray[placeLibary.getRowClicked()].getLatitude())
//        longitude.text = String(myarray[placeLibary.getRowClicked()].getLongitude())
//        elevation.text = String(myarray[placeLibary.getRowClicked()].getElevation())
        super.viewDidLoad()
    }
    
    
//    private static double distance(double lat1, double lon1, double lat2, double lon2, String unit) {
//    double theta = lon1 - lon2;
//    double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
//    dist = Math.acos(dist);
//    dist = rad2deg(dist);
//    dist = dist * 60 * 1.1515;
//    if (unit == "K") {
//    dist = dist * 1.609344;
//    } else if (unit == "N") {
//    dist = dist * 0.8684;
//    }
//    
//    return (dist);
//    }
//    
//    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
//    /*::	This function converts decimal degrees to radians						 :*/
//    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
//    private static double deg2rad(double deg) {
//    return (deg * Math.PI / 180.0);
//    }
//    
//    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
//    /*::	This function converts radians to decimal degrees						 :*/
//    /*:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*/
//    private static double rad2deg(double rad) {
//    return (rad * 180 / Math.PI);
//    }

}
