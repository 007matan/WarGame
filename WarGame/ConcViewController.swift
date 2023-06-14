//
//  ConcViewController.swift
//  WarGame
//
//  Created by Student11 on 13/06/2023.
//

import UIKit

class ConcViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var winnerLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLBL.text = winnerLBL.text! +  String(checkForWinnerPrefernce())
        scoreLBL.text = scoreLBL.text! + String(checkForPointsPrefernce())
        // Do any additional setup after loading the view.
        
    }
    func checkForWinnerPrefernce() -> String!{
        let myLat = defaults.string(forKey:GamePlayViewController.GameKeys.prefernceKeyWinner)
        return myLat
    }
    func checkForPointsPrefernce() -> Int!{
        let name = defaults.integer(forKey:GamePlayViewController.GameKeys.prefernceKeyPoints)
        return name
    }
    
    @IBAction func returnToMenu(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "menu_vc") as! ViewController
        present(vc, animated: true)     }
}
