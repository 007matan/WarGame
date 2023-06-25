//
//  ViewController.swift
//  WarGame
//
//  Created by Student11 on 12/06/2023.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private var locationManager:CLLocationManager?

    @IBOutlet weak var startGameBTN: UIButton!
    @IBOutlet weak var confirmNameBTN: UIButton!
    @IBOutlet weak var eastSideLBL: UILabel!
    @IBOutlet weak var westSideLBL: UILabel!
    @IBOutlet weak var showNameLBL: UILabel!
    @IBOutlet weak var inputNameTXTFLD: UITextField!
    @IBOutlet weak var insertNameLBL: UILabel!
    
    var playerName = ""
    let defaults = UserDefaults.standard
    
   
    var lat : Double!
    
    struct Keys{
        static let prefernceKeyName = "prefernceKeyName"
        static let prefernceKeySide = "prefernceKeySide"
    }
    
    let middle = 34.817549168324334
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self
        // check SP
        //in the first runing we need to make all rows as notes except super, and what inside that if
        if checkForNamePrefernce() == "Nun"{
            showNameLBL.isHidden = true
            startGameBTN.isHidden = true
        }
        
        else{
            confirmNameBTN.isHidden = true
            insertNameLBL.isHidden = true
            inputNameTXTFLD.isHidden = true
            
            //update showNamrLBL
            showNameLBL.text = "Hi, " + checkForNamePrefernce()
            
            
            
            //select side
            //if lat < middle{
             //   westSideLBL.textColor = UIColor.green
           // }
            //else{
              //  eastSideLBL.textColor = UIColor.green
          //  }
            
           // saveSidePreference()
            
        }
         
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            lat = location.coordinate.latitude
            //select side
            if lat < middle{
                westSideLBL.textColor = UIColor.green
            }
            else{
                eastSideLBL.textColor = UIColor.green
            }
            
            saveSidePreference()
            
        }
    }

    @IBAction func confirmNameClick(_ sender: UIButton) {
        if insertNameLBL.text != "" {
            showNameLBL.isHidden = false
            confirmNameBTN.isHidden = true
            insertNameLBL.isHidden = true
            inputNameTXTFLD.isHidden = true
            startGameBTN.isHidden = false
            
            playerName = inputNameTXTFLD.text!
            
            //save SP
            saveNamePreference()
            
            //update showNamrLBL
            showNameLBL.text = "Hi, " + checkForNamePrefernce()
            
            //getLocation
            //lat =
            
            //select side
            //if lat < middle{
             //   westSideLBL.textColor = UIColor.green
            //}
           // else{
             //   eastSideLBL.textColor = UIColor.green
            //}
            
           // saveSidePreference()
        }
        
    }
    
    @IBAction func statGameClick(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "gamePlay_vc") as! GamePlayViewController
        present(vc, animated: true)    }
    
    func saveNamePreference(){
        defaults.set(playerName, forKey: Keys.prefernceKeyName)
    }
    
    func checkForNamePrefernce() -> String{
        let name = defaults.string(forKey: Keys.prefernceKeyName) ?? "Nun"
        return name
    }
    
    func saveSidePreference(){
        defaults.set(lat, forKey: Keys.prefernceKeySide)
    }
    
    
}

