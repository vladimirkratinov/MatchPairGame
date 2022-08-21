//
//  FileManager.swift
//  CardMatchingGame
//
//  Created by Vladimir Kratinov on 2022/8/19.
//

import UIKit

class ContentLoader {
    
    var prop = Properties()
    
    func loadSet(setNumber: Int) {
        
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("Images.bundle")
        
        do {
            let contents = try fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
            
            for item in contents {
                let fileString = item.lastPathComponent
                if fileString.hasPrefix("set\(setNumber)_") {
                    switch setNumber {
                    case 1:
                        if Properties.cardList1.count < 10 {
                            Properties.cardList1.append(fileString)
                        }
                    case 2:
                        if Properties.cardList2.count < 10 {
                            Properties.cardList2.append(fileString)
                        }
                    case 3:
                        if Properties.cardList3.count < 10 {
                            Properties.cardList3.append(fileString)
                        }
                    case 4:
                        if Properties.cardList4.count < 10 {
                            Properties.cardList4.append(fileString)
                        }
                    case 5:
                        if Properties.cardList5.count < 10 {
                            Properties.cardList5.append(fileString)
                        }
                    case 6:
                        if Properties.cardList6.count < 10 {
                            Properties.cardList6.append(fileString)
                        }
                        
                    default: break
                    }
                }
            }
            
            switch setNumber {
            case 1:
                Properties.cardList1.append(contentsOf: Properties.cardList1)
                Properties.cardList1.sort()
                Properties.cardCollection.append(Properties.cardList1)
            case 2:
                Properties.cardList2.append(contentsOf: Properties.cardList2)
                Properties.cardList2.sort()
                Properties.cardCollection.append(Properties.cardList2)
            case 3:
                Properties.cardList3.append(contentsOf: Properties.cardList3)
                Properties.cardList3.sort()
                Properties.cardCollection.append(Properties.cardList3)
            case 4:
                Properties.cardList4.append(contentsOf: Properties.cardList4)
                Properties.cardList4.sort()
                Properties.cardCollection.append(Properties.cardList4)
            case 5:
                Properties.cardList5.append(contentsOf: Properties.cardList5)
                Properties.cardList5.sort()
                Properties.cardCollection.append(Properties.cardList5)
            case 6:
                Properties.cardList6.append(contentsOf: Properties.cardList6)
                Properties.cardList6.sort()
                Properties.cardCollection.append(Properties.cardList6)
            default: break
            }
        }
        catch let error as NSError {
            print(error)
        }
    }
    
    func getImage(name: String) -> UIImage? {
        if let imgPath = Bundle.main.path(forResource: name, ofType: ".png") {
            return UIImage(contentsOfFile: imgPath)
        }
        return nil
    }
}
