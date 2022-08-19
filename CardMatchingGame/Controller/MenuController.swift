//
//  MenuController.swift
//  CardMatchingGame
//
//  Created by Vladimir Kratinov on 2022/7/27.
//

import UIKit
import AVFoundation

class MenuController: UIViewController {
    
    var audioFX = AudioFX()
    let menuInterface = MenuInterface()
    
    override func loadView() {
        view = menuInterface.menuView
        view.backgroundColor = UIColor.systemPink
        view.insertSubview(menuInterface.backgroundImageView, at: 0)
        
        menuInterface.setupSubviews()
        menuInterface.setupConstraints()
        
        menuInterface.playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        menuInterface.otherButton.addTarget(self, action: #selector(otherButtonTapped), for: .touchUpInside)
        menuInterface.collectionButton.addTarget(self, action: #selector(collectionButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        //animation:
        menuInterface.backgroundImageView.pulsateSlow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuInterface.setGradientBackground()
        
        //animation:
        menuInterface.backgroundImageView.pulsateSlow()
    }
    
    @objc func playButtonTapped(_ sender: UIButton) {
        //animation:
        sender.flash()
        
        //audioFX:
        try? audioFX.playFX(file: AudioFileKey.buttonPress.rawValue, type: "wav")

        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "GameController") as? GameController else { return }
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    @objc func collectionButtonTapped(_ sender: UIButton) {
        guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "CollectionController") as? CollectionController else { return }
//        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func otherButtonTapped(_ sender: UIButton) {
        //animation:
        sender.flash()
        
        //audioFX:
        try? audioFX.playFX(file: AudioFileKey.buttonPress.rawValue, type: "wav")
        
        //reset Defaults:
        resetStatisticsUserDefaults()
        
    }
    
    fileprivate func resetStatisticsUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(gameInterface.timeCounter, forKey: StatisticsKey.time.rawValue)
        defaults.set(gameInterface.pairsCounter, forKey: StatisticsKey.pairs.rawValue)
        defaults.set(gameInterface.flipsCounter, forKey: StatisticsKey.flips.rawValue)
        
        print("defaults RESET!")
        print("default time: \(defaults.integer(forKey: StatisticsKey.time.rawValue))")
        print("default pairs: \(defaults.integer(forKey: StatisticsKey.pairs.rawValue))")
        print("default flips: \(defaults.integer(forKey: StatisticsKey.flips.rawValue))")
    }
}
