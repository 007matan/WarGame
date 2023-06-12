//
//  GamePlayViewController.swift
//  WarGame
//
//  Created by Student11 on 12/06/2023.
//

import UIKit

class GamePlayViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var player_side : Int! //west - 0, east - 1
    let middle = 34.817549168324334
    
    var cards_pack_leafs = [#imageLiteral(resourceName: "card_leaf_two"), #imageLiteral(resourceName: "card_leaf_three"), #imageLiteral(resourceName: "card_leaf_four"), #imageLiteral(resourceName: "card_leaf_five"), #imageLiteral(resourceName: "card_leaf_six"), #imageLiteral(resourceName: "card_leaf_seven"), #imageLiteral(resourceName: "card_leaf_eight"), #imageLiteral(resourceName: "card_leaf_nine"), #imageLiteral(resourceName: "card_leaf_ten"), #imageLiteral(resourceName: "card_leaf_J"), #imageLiteral(resourceName: "card_leaf_Q"), #imageLiteral(resourceName: "card_leaf_K"), #imageLiteral(resourceName: "card_leaf_ace")]
    var cards_pack_clovers = [#imageLiteral(resourceName: "card_clover_two"), #imageLiteral(resourceName: "card_clover_three"), #imageLiteral(resourceName: "card_clover_four"), #imageLiteral(resourceName: "card_clover_five"), #imageLiteral(resourceName: "card_clover_six"), #imageLiteral(resourceName: "card_clover_sevem"), #imageLiteral(resourceName: "card_clover_eight"), #imageLiteral(resourceName: "card_clover_nine"), #imageLiteral(resourceName: "card_clover_ten"), #imageLiteral(resourceName: "card_clover_J"), #imageLiteral(resourceName: "card_clover_Q"), #imageLiteral(resourceName: "card_clover_K"), #imageLiteral(resourceName: "card_clover_ace")]
    var cards_pack_hearts = [#imageLiteral(resourceName: "card_heart_two"), #imageLiteral(resourceName: "card_heart_three"), #imageLiteral(resourceName: "card_heart_four"), #imageLiteral(resourceName: "card_heart_five"), #imageLiteral(resourceName: "card_heart_six"), #imageLiteral(resourceName: "card_heart_seven"), #imageLiteral(resourceName: "card_heart_eight"), #imageLiteral(resourceName: "card_heart_nine"), #imageLiteral(resourceName: "card_heart_ten"), #imageLiteral(resourceName: "card_heart_J"), #imageLiteral(resourceName: "card_heart_Q"), #imageLiteral(resourceName: "card_heart_K"), #imageLiteral(resourceName: "card_heart_ace")]
    var cards_pack_diamonds = [#imageLiteral(resourceName: "card_diamond_two"), #imageLiteral(resourceName: "card_diamond_three"), #imageLiteral(resourceName: "card_diamond_four"), #imageLiteral(resourceName: "card_diamond_five"), #imageLiteral(resourceName: "card_diamond_six"), #imageLiteral(resourceName: "card_diamond_seven"), #imageLiteral(resourceName: "card_diamond_eight"), #imageLiteral(resourceName: "card_diamond_nine"), #imageLiteral(resourceName: "card_diamond_ten"), #imageLiteral(resourceName: "card_diamond_J"), #imageLiteral(resourceName: "card_diamond_Q"), #imageLiteral(resourceName: "card_diamond_K"), #imageLiteral(resourceName: "card_diamond_ace")]
    var cards_pack_jokers = [#imageLiteral(resourceName: "card_black_joker"), #imageLiteral(resourceName: "card_colored_joker")]
    
    var points_player : Int!
    var points_pc : Int!
    
    @IBOutlet weak var timerLBL: UILabel!
    @IBOutlet weak var eastSideCardIMG: UIImageView!
    @IBOutlet weak var eastSidePointsLBL: UILabel!
    @IBOutlet weak var eastSideNameLBL: UILabel!
    @IBOutlet weak var westSideCardsIMG: UIImageView!
    @IBOutlet weak var westSidePointsLBL: UILabel!
    @IBOutlet weak var westSodeNameLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlayerSide()
        
        updatePlayersLabels()
        
        mainFunc()
        
    }
    
    func mainFunc(){
        var card_pack_player : ArraySlice<UIImage>!
        var card_pack_pc : ArraySlice<UIImage>
        var card_pack = cards_pack_leafs + cards_pack_hearts + cards_pack_jokers + cards_pack_clovers + cards_pack_diamonds
        card_pack.shuffle()
        if player_side == 0{
            card_pack_player = card_pack[0...card_pack.count/2 - 1] //the wester pack goes to the player
            card_pack_pc = card_pack[card_pack.count/2...card_pack.count - 1]
        }else{
            var card_pack_pc = card_pack[0...card_pack.count/2 - 1]
            var card_pack_player = card_pack[card_pack.count/2...card_pack.count - 1] //the easter pack goes to the player
        }
        
        for i in 0...card_pack.count/2{
            //in every sec for five sec sub from the remaining timer in timer 1
            
            //"Turn on" card
            
            //update data, view, ...
            
            //check if win or lose
                //Take care of win lose the game, new activity
            
            //we wait 3 sec
            
            //"Turn off" cards
        }
        
    }
    
    func updatePlayerSide(){
        if checkForSidePrefernce() < middle{
            player_side = 0
        }else{
            player_side = 1
        }
        
    }
    
    func updatePlayersLabels(){
        if player_side == 0{
            westSodeNameLBL.text = checkForNamePrefernce()
            eastSideNameLBL.text = "PC"
        }else{
            eastSideNameLBL.text = checkForNamePrefernce()
            westSodeNameLBL.text = "PC"
            
        }
    }
    func checkForSidePrefernce() -> Double{
        let myLat = defaults.double(forKey: ViewController.Keys.prefernceKeySide)
        return myLat
    }
    func checkForNamePrefernce() -> String{
        let name = defaults.string(forKey: ViewController.Keys.prefernceKeyName)
        return name!
    }
    
}
