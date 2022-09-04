//
//  LockerModel.swift
//  CardMatchingGame
//
//  Created by Vladimir Kratinov on 2022/8/23.
//

import UIKit
import Gemini

struct LockerModel: Codable {
    var cellNumber: Int
    var isLocked: Bool
    var unlockPrice: Int
    
    //MARK: - loadLockerModel:
    
    static func loadLockerModel() {
        let defaults = UserDefaults.standard
        
        for i in 0..<Properties.listOfSets.count {
            if Properties.collectionOfLockedSets.count < Properties.listOfSets.count {
                
                //create Model:
                let newModel = LockerModel(cellNumber: i, isLocked: true, unlockPrice: i * 100)
                Properties.collectionOfLockedSets.append(newModel)
                
                //autoFill Bool list with true - to show locked UI:
                Properties.unlockedList.append(true)
                //unlock first default set:
                Properties.collectionOfLockedSets[i].isLocked = Properties.unlockedList[i]
            }
        }
        
        let values = defaults.object(forKey: "unlockedList") as? [Bool]

        for i in 0..<Properties.listOfSets.count {
            Properties.collectionOfLockedSets[i].isLocked = values?[i] ?? true
            Properties.unlockedList[i] = values?[i] ?? true
        }
        
        //unlock first cell in UI and in Bool list:
        Properties.collectionOfLockedSets[0].isLocked = false
        Properties.unlockedList[0] = false
    }
    
    //MARK: - Unlock:
    
    static func unlock(cell: CollectionViewCell, price: Int, index: IndexPath.Index) {
        
        //check price first:
        if Properties.coins >= price {
            
            //reduce price from user coins:
            Properties.coins -= price
            
            print("cutted \(price) from \(Properties.coins) coins!")
            Properties.defaults.set(Properties.coins, forKey: CoinsKey.coins.rawValue)
            print("now you have \(Properties.coins) coins!")
     
            //prepare label and shadow layer before animation
            cell.myLabel.isHidden = false
            cell.myLabel.alpha = 0
            cell.myShadowView.isHidden = false
            cell.myShadowView.alpha = 1
            
            //animation block:
            UIView.animate(withDuration: 1.0, animations: {
                cell.myImageView.layer.transform = CATransform3DMakeScale(1.1, 1.1, 1.1)
                cell.unlockButton.layer.transform = CATransform3DMakeTranslation(0, 80, 0)
                cell.myShadowView.alpha = 0
                cell.myImageView.alpha = 1
                cell.myLabel.alpha = 1
                cell.lockerImageView.alpha = 0
                cell.lockerImageView.shake()
                cell.lockerImageView.rotate(angle: 45)
            })

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                //bounce back:
                UIView.animate(withDuration: 0.5) {
                    cell.myImageView.layer.transform = CATransform3DMakeScale(1, 1, 1)
                }
                //hide all views that already were animated:
                cell.myLabel.isHidden = false
                cell.lockerImageView.isHidden = true
                cell.unlockButton.isHidden = true
            }
            
            //change property in Locker Class:
            Properties.collectionOfLockedSets[index].isLocked = false
            
            //UserDefaults 2 version:
            let defaults = UserDefaults.standard
            
            Properties.unlockedList[index] = Properties.collectionOfLockedSets[index].isLocked
            print("Unlocked List Index: \(index) \(Properties.unlockedList[index]) = \(Properties.collectionOfLockedSets[index].cellNumber) is \(Properties.collectionOfLockedSets[index].isLocked) ")
            
            defaults.set(Properties.unlockedList, forKey: "unlockedList")
            print(defaults.array(forKey: "unlockedList") as Any)
            print(Properties.unlockedList)
        }
    }
    
//MARK: - updateUILockerButtons:
    
    static func updateUILockerButtons(cell: CollectionViewCell,index: IndexPath.Index) {
        //if locked:
        if Properties.collectionOfLockedSets[index].isLocked {
            //price:
            let price = Properties.collectionOfLockedSets[index].unlockPrice
            
            cell.lockerImageView.isHidden = false
            cell.unlockButton.setTitle("🪙 \(price)", for: .normal)
            cell.myLabel.isHidden = true
            cell.myImageView.alpha = 0.5
            
            //price button color & mechanics:
            if price > Properties.coins {
                    cell.unlockButton.backgroundColor = .systemRed
                    cell.unlockButton.alpha = 1
                    cell.unlockButton.isEnabled = false
            } else { // if price < Properties.coins
                    cell.unlockButton.backgroundColor = .green
                    cell.unlockButton.alpha = 1
                    cell.unlockButton.isEnabled = true
            }

        } else { //if not locked
            cell.lockerImageView.isHidden = true
            cell.unlockButton.isHidden = true
            cell.myShadowView.isHidden = true
            cell.myLabel.isHidden = false
            cell.myLabel.alpha = 1
            cell.myImageView.alpha = 1
        }
    }
}
