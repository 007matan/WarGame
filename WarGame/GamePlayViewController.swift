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
    
    var winner = "PC"
    
    var cards_pack_leafs = [#imageLiteral(resourceName: "card_leaf_two"), #imageLiteral(resourceName: "card_leaf_three"), #imageLiteral(resourceName: "card_leaf_four"), #imageLiteral(resourceName: "card_leaf_five"), #imageLiteral(resourceName: "card_leaf_six"), #imageLiteral(resourceName: "card_leaf_seven"), #imageLiteral(resourceName: "card_leaf_eight"), #imageLiteral(resourceName: "card_leaf_nine"), #imageLiteral(resourceName: "card_leaf_ten"), #imageLiteral(resourceName: "card_leaf_J"), #imageLiteral(resourceName: "card_leaf_Q"), #imageLiteral(resourceName: "card_leaf_K"), #imageLiteral(resourceName: "card_leaf_ace")]
    var cards_pack_clovers = [#imageLiteral(resourceName: "card_clover_two"), #imageLiteral(resourceName: "card_clover_three"), #imageLiteral(resourceName: "card_clover_four"), #imageLiteral(resourceName: "card_clover_five"), #imageLiteral(resourceName: "card_clover_six"), #imageLiteral(resourceName: "card_clover_sevem"), #imageLiteral(resourceName: "card_clover_eight"), #imageLiteral(resourceName: "card_clover_nine"), #imageLiteral(resourceName: "card_clover_ten"), #imageLiteral(resourceName: "card_clover_J"), #imageLiteral(resourceName: "card_clover_Q"), #imageLiteral(resourceName: "card_clover_K"), #imageLiteral(resourceName: "card_clover_ace")]
    var cards_pack_hearts = [#imageLiteral(resourceName: "card_heart_two"), #imageLiteral(resourceName: "card_heart_three"), #imageLiteral(resourceName: "card_heart_four"), #imageLiteral(resourceName: "card_heart_five"), #imageLiteral(resourceName: "card_heart_six"), #imageLiteral(resourceName: "card_heart_seven"), #imageLiteral(resourceName: "card_heart_eight"), #imageLiteral(resourceName: "card_heart_nine"), #imageLiteral(resourceName: "card_heart_ten"), #imageLiteral(resourceName: "card_heart_J"), #imageLiteral(resourceName: "card_heart_Q"), #imageLiteral(resourceName: "card_heart_K"), #imageLiteral(resourceName: "card_heart_ace")]
    var cards_pack_diamonds = [#imageLiteral(resourceName: "card_diamond_two"), #imageLiteral(resourceName: "card_diamond_three"), #imageLiteral(resourceName: "card_diamond_four"), #imageLiteral(resourceName: "card_diamond_five"), #imageLiteral(resourceName: "card_diamond_six"), #imageLiteral(resourceName: "card_diamond_seven"), #imageLiteral(resourceName: "card_diamond_eight"), #imageLiteral(resourceName: "card_diamond_nine"), #imageLiteral(resourceName: "card_diamond_ten"), #imageLiteral(resourceName: "card_diamond_J"), #imageLiteral(resourceName: "card_diamond_Q"), #imageLiteral(resourceName: "card_diamond_K"), #imageLiteral(resourceName: "card_diamond_ace")]
    var cards_pack_jokers = [#imageLiteral(resourceName: "card_black_joker"), #imageLiteral(resourceName: "card_colored_joker")]
    
    var points_player = 0
    var points_pc = 0
    
    struct GameKeys{
        static let prefernceKeyWinner = "prefernceKeyWinner"
        static let prefernceKeyPoints = "prefernceKeyPlayerPoints"
    }
    
    @IBOutlet weak var endGameBTN: UIButton!
    @IBOutlet weak var timerLBL: UILabel!
    @IBOutlet weak var eastSideCardIMG: UIImageView!
    @IBOutlet weak var eastSidePointsLBL: UILabel!
    @IBOutlet weak var eastSideNameLBL: UILabel!
    @IBOutlet weak var westSideCardsIMG: UIImageView!
    @IBOutlet weak var westSidePointsLBL: UILabel!
    @IBOutlet weak var westSodeNameLBL: UILabel!
    
    var gameEnd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endGameBTN.isHidden = true
        
        updatePlayerSide()
        
        updatePlayersLabels()
        
        
        mainFunc()
        
    }
    
    func mainFunc(){
        var card_pack_player : ArraySlice<UIImage>!
        var card_pack_pc : ArraySlice<UIImage>!
        var card_pack = cards_pack_leafs + cards_pack_hearts + cards_pack_jokers + cards_pack_clovers + cards_pack_diamonds
        card_pack.shuffle()
        if player_side == 0{
            card_pack_player = card_pack[0...card_pack.count/2 - 1] //the wester pack goes to the player
            card_pack_pc = card_pack[card_pack.count/2...card_pack.count - 1]
        }else{
            card_pack_pc = card_pack[0...card_pack.count/2 - 1]
            card_pack_player = card_pack[card_pack.count/2...card_pack.count - 1] //the easter pack goes to the player
        }
        var i = 0
        while i <= card_pack.count/2 - 1 && gameEnd == false{
        //for i in 0...card_pack.count/2 - 1{
            //in every sec for five sec sub from the remaining timer in timer 1
        
               // sleep(1)
            
            self.timerLBL.text = "4"
            
                //sleep(1)
            
            self.timerLBL.text = "3"
            
               // sleep(1)
            
            self.timerLBL.text = "2"
            
               // sleep(1)
            
            self.timerLBL.text = "1"
            
               // sleep(1)
            

            self.timerLBL.text = "0"
            
            if self.player_side == 0{
                self.westSideCardsIMG.image = card_pack_player[i]
                self.eastSideCardIMG.image = card_pack_pc[i + 27]
                
                //update data, view, ...
                let roundCardsTup = getCardIndices(card1Image: westSideCardsIMG.image!, card2Image: eastSideCardIMG.image!)
                if roundCardsTup.0! > roundCardsTup.1!{
                    points_player += 1
                    westSidePointsLBL.text = String(points_player)
                }else{
                    points_pc += 1
                    eastSidePointsLBL.text = String(points_pc)
                }
                
                
            }else{
                self.westSideCardsIMG.image = card_pack_pc[i]
                self.eastSideCardIMG.image = card_pack_player[i + 27]
                
                //update data, view, ...
                let roundCardsTup = getCardIndices(card1Image: westSideCardsIMG.image!, card2Image: eastSideCardIMG.image!)
                if roundCardsTup.0! > roundCardsTup.1!{
                    points_pc += 1
                    westSidePointsLBL.text = String(points_player)
                }else{
                    points_player += 1
                    eastSidePointsLBL.text = String(points_pc)
                }
            }
            
            //check if win or lose
                //Take care of win lose the game, new activity
                //maybe add a button cause move directly to new acivity maybe problematic
            if(points_player == 10){
                //SP Winner
               // winner = checkForNamePrefernce()
              //  saveWinnerPreference()
                
               // savePointsPreference(my_points: 10)
                //new viewController
               // endGame()
                gameEnd = true
            }
            if(points_pc == 10){
                //SP Winner
                //winner = "PC"
                //saveWinnerPreference()
                
                //savePointsPreference(my_points: 10)
                //new viewController
                //endGame()
                gameEnd = true
            }
            //we wait 3 sec
            self.timerLBL.text = "3"
            do{
               // sleep(1)
            }
            self.timerLBL.text = "2"
            do{
               // sleep(1)
            }
            self.timerLBL.text = "1"            //"Turn off" cards
            do{
                //sleep(1)
            }
            self.timerLBL.text = "0"
            self.eastSideCardIMG.image = #imageLiteral(resourceName: "card_back")
            self.westSideCardsIMG.image = #imageLiteral(resourceName: "card_back")
            self.timerLBL.text = "5"
            
            i = i + 1
        }
        
        //check how the winner, at start was here to close the case of tie
        if(points_pc >= points_player){
            //SP Winner
            winner = "PC"
            saveWinnerPreference()
            
            savePointsPreference(my_points: points_pc)
            //new viewController
            //endGame()
            
        }
        else{
            //SP Winner
            winner = checkForNamePrefernce()
            saveWinnerPreference()
            
            savePointsPreference(my_points: points_player)
            //new viewController
            //endGame()
            
        }
        
        endGameBTN.isHidden = false
    }
    
    func getCardIndices(card1Image: UIImage, card2Image: UIImage) -> (Int?, Int?) {
        if let card1Index = self.cards_pack_diamonds.firstIndex(of: card1Image) {
            if let card2Index = self.cards_pack_diamonds.firstIndex(of: card2Image) {
                        return (card1Index, card2Index)
                    }
            if let card2Index = self.cards_pack_clovers.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_leafs.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_hearts.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if var card2Index = self.cards_pack_jokers.firstIndex(of: card2Image) {
                card2Index = 14
                return (card1Index, card2Index)
            }
        }
        if let card1Index = self.cards_pack_clovers.firstIndex(of: card1Image) {
            if let card2Index = self.cards_pack_clovers.firstIndex(of: card2Image) {
                        return (card1Index, card2Index)
                    }
            if let card2Index = self.cards_pack_diamonds.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_leafs.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_hearts.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if var card2Index = self.cards_pack_jokers.firstIndex(of: card2Image) {
                card2Index = 14
                return (card1Index, card2Index)
            }
        }
        if let card1Index = self.cards_pack_leafs.firstIndex(of: card1Image) {
            if let card2Index = self.cards_pack_leafs.firstIndex(of: card2Image) {
                        return (card1Index, card2Index)
                    }
            if let card2Index = self.cards_pack_clovers.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_diamonds.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_hearts.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if var card2Index = self.cards_pack_jokers.firstIndex(of: card2Image) {
                card2Index = 14
                return (card1Index, card2Index)
            }
        }
        if let card1Index = self.cards_pack_hearts.firstIndex(of: card1Image) {
            if let card2Index = self.cards_pack_hearts.firstIndex(of: card2Image) {
                        return (card1Index, card2Index)
                    }
            if let card2Index = self.cards_pack_clovers.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_leafs.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_diamonds.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if var card2Index = self.cards_pack_jokers.firstIndex(of: card2Image) {
                card2Index = 14
                return (card1Index, card2Index)
            }
        }
        if var card1Index = self.cards_pack_jokers.firstIndex(of: card1Image) {
            card1Index = 14
            if var card2Index = self.cards_pack_jokers.firstIndex(of: card2Image) {
                card2Index = 14
                        return (card1Index, card2Index)
                    }
            if let card2Index = self.cards_pack_clovers.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_leafs.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_hearts.firstIndex(of: card2Image) {
                return (card1Index, card2Index)
            }
            if let card2Index = self.cards_pack_diamonds.firstIndex(of: card2Image) {
                return (card1Index,card2Index)
            }
        }
        return (nil, nil) // Return nil if either card image is not found in any deck }
        
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
    func checkForNamePrefernce() -> String!{
        let name = defaults.string(forKey: ViewController.Keys.prefernceKeyName)
        return name!
    }
    func saveWinnerPreference(){
        defaults.set(winner, forKey: GameKeys.prefernceKeyWinner)
    }
    func savePointsPreference(my_points :Int){
        defaults.set(my_points, forKey: GameKeys.prefernceKeyPoints)
    }
    func endGame(){
        let conc_vc = storyboard?.instantiateViewController(identifier: "conc_vc") as! ConcViewController
        present(conc_vc, animated: true)
        
    }
    
    @IBAction func concGame(_ sender: UIButton) {
        endGame()
    }
    
}
