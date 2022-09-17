//
//  MenuInterface.swift
//  CardMatchingGame
//
//  Created by Vladimir Kratinov on 2022/8/6.
//

import UIKit

class MenuInterface: UIView {
    
    let palette = Palette()
    let gameInterface = GameInterface()
    
    //MARK: - Views:
    
    var menuView: UIView = {
        let menuView = UIView()
        return menuView
    }()

    var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView(frame: .zero)
        backgroundImageView.alpha = 1
//        backgroundImageView.image = UIImage(named: ImageKey.envelope1.rawValue)
        backgroundImageView.image = UIImage(named: FigmaKey.backgroundMenu.rawValue)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    var coverImageView: UIImageView = {
        let coverImageView = UIImageView(frame: .zero)
        coverImageView.isHidden = true
        coverImageView.alpha = 1
//        coverImageView.image = UIImage(named: ImageKey.envelope4Large.rawValue)
        coverImageView.image = UIImage(named: FigmaKey.backgroundSettings.rawValue)
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        return coverImageView
    }()
    
    lazy var hub: UIView = {
        let hub = UIView()
        hub.backgroundColor = UIColor(red: 1.00, green: 0.37, blue: 0.25, alpha: 0.5)
        hub.translatesAutoresizingMaskIntoConstraints = false
        hub.layer.borderWidth = 0
        hub.alpha = 0
        return hub
    }()
    
    //MARK: - Labels:
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.alpha = 0.5
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.text = "MATCH PAIR"
        titleLabel.font = UIFont(name: FontKey.staatliches.rawValue, size: 96)
        return titleLabel
    }()
    
    var coins: Int = Properties.coins {
        didSet {
            coinLabel.text = "🪙 \(coins)"
        }
    }
    
    lazy var coinLabel: UILabel = {
        let coinLabel = UILabel()
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        coinLabel.textColor = UIColor.black
        coinLabel.textAlignment = .left
        coinLabel.text = "🪙 \(coins)"
        coinLabel.font = UIFont(name: Properties.uiLabelsFont, size: Properties.uiLabelsSize)
        return coinLabel
    }()

    //MARK: - Buttons:
    
    lazy var difficultyButton: UIButton = {
        let difficultyButton = UIButton()
        difficultyButton.setTitle("Easy", for: .normal)
        difficultyButton.setImage(UIImage(systemName: "person.2.wave.2")?.withRenderingMode(.alwaysOriginal), for: .normal)
        setupAppearence(difficultyButton)
        difficultyButton.backgroundColor = .green
        return difficultyButton
    }()
    
    lazy var playButton: UIButton = {
        let playButton = UIButton()
        playButton.setImage(UIImage(systemName: "hand.point.right")?.withRenderingMode(.alwaysOriginal), for: .normal)
        playButton.titleLabel?.textAlignment = .left
        playButton.setTitle("Play", for: .normal)
        setupAppearence(playButton)
        playButton.backgroundColor = UIColor(red: 0.20, green: 0.89, blue: 0.27, alpha: 1.00)
        return playButton
    }()
    
    lazy var timeModeButton: UIButton = {
        let timeModeButton = UIButton()
        timeModeButton.setTitle("Time Mode", for: .normal)
        timeModeButton.setImage(UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        setupAppearence(timeModeButton)
        timeModeButton.backgroundColor = UIColor(red: 0.95, green: 0.75, blue: 0.36, alpha: 1.00)
        return timeModeButton
    }()
    
    lazy var hardcoreModeButton: UIButton = {
        let hardcoreModeButton = UIButton()
        hardcoreModeButton.setTitle("Hardcore", for: .normal)
        hardcoreModeButton.setImage(UIImage(systemName: "flame")?.withRenderingMode(.alwaysOriginal), for: .normal)
        setupAppearence(hardcoreModeButton)
        hardcoreModeButton.backgroundColor = UIColor(red: 0.86, green: 0.44, blue: 0.44, alpha: 1.00)
        return hardcoreModeButton
    }()
    
    lazy var collectionButton: UIButton = {
        let collectionButton = UIButton()
        collectionButton.setTitle("Collection", for: .normal)
        collectionButton.setImage(UIImage(systemName: "crown")?.withRenderingMode(.alwaysOriginal), for: .normal)
        setupAppearence(collectionButton)
//        collectionButton.backgroundColor = palette.cyanite
        collectionButton.backgroundColor = UIColor(red: 0.07, green: 0.75, blue: 0.89, alpha: 1.00)
        return collectionButton
    }()

    lazy var resetButton: UIButton = {
       let resetButton = UIButton()
        resetButton.setTitle("  reset  ", for: .normal)
        setupAppearence(resetButton)
        resetButton.backgroundColor = .red
        return resetButton
    }()
    
    lazy var addCoinButton: UIButton = {
       let addCoinButton = UIButton()
        addCoinButton.setTitle("  🪙 Add Coin  ", for: .normal)
        setupAppearence(addCoinButton)
        addCoinButton.backgroundColor = .green
        return addCoinButton
    }()
    
    //MARK: - Settings:
    
    lazy var settingsButton: UIButton = {
        let settingsButton = UIButton()
        settingsButton.alpha = 1
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.setImage(UIImage(named: ImageKey.SettingsButton.rawValue), for: .normal)
        settingsButton.isUserInteractionEnabled = true
        settingsButton.layer.shadowColor = UIColor.black.cgColor
        settingsButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        settingsButton.layer.shadowRadius = 1
        settingsButton.layer.shadowOpacity = 1.0
        settingsButton.layer.shouldRasterize = true
        settingsButton.layer.rasterizationScale = UIScreen.main.scale
        return settingsButton
    }()
    
    lazy var settingsView: UIView = {
        let settingsView = UIView()
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.isHidden = true
        settingsView.alpha = 1
        settingsView.layer.borderWidth = 0
        settingsView.layer.cornerRadius = 0
        settingsView.layer.borderColor = UIColor.black.cgColor
        return settingsView
    }()
    
    lazy var settingsBackground: UIImageView = {
        let settingsBackground = UIImageView(frame: .zero)
        settingsBackground.alpha = 1
        settingsBackground.image = UIImage(named: FigmaKey.settings.rawValue)
        settingsBackground.contentMode = .redraw
        settingsBackground.translatesAutoresizingMaskIntoConstraints = false
        return settingsBackground
    }()
    
    //MARK: - Settings - Labels:
    
    lazy var settingsMusic: UILabel = {
       let settingsMusic = UILabel()
        settingsMusic.text = "Music"
        setupSettingsLabels(settingsMusic)
        return settingsMusic
    }()
    
    lazy var settingsSound: UILabel = {
       let settingsSound = UILabel()
        settingsSound.text = "Sound"
        setupSettingsLabels(settingsSound)
        return settingsSound
    }()
    
    lazy var settingsVibration: UILabel = {
       let settingsVibration = UILabel()
        settingsVibration.text = "Vibration"
        setupSettingsLabels(settingsVibration)
        return settingsVibration
    }()
    
    //MARK: - Settings - Buttons:

    lazy var muteMusicButton: UIButton = {
        let muteMusicButton = UIButton()
        muteMusicButton.setTitle(" Mute ", for: .normal)
        muteMusicButton.backgroundColor = Properties.defaultMusicButtonColor
        setupSettingsButtons(muteMusicButton)
        return muteMusicButton
    }()
    
    lazy var muteSoundButton: UIButton = {
        let muteSoundButton = UIButton()
        muteSoundButton.setTitle(" Mute ", for: .normal)
        muteSoundButton.backgroundColor = Properties.defaultSoundButtonColor
        setupSettingsButtons(muteSoundButton)
        return muteSoundButton
    }()
    
    lazy var muteVibrationButton: UIButton = {
        let muteVibrationButton = UIButton()
        muteVibrationButton.setTitle(" Mute ", for: .normal)
        muteVibrationButton.backgroundColor = Properties.defaultVibroButtonColor
        setupSettingsButtons(muteVibrationButton)
        return muteVibrationButton
    }()
    
    lazy var quitButton: UIButton = {
        let quitButton = UIButton()
        quitButton.setTitle(" Quit ", for: .normal)
        setupSettingsButtons(quitButton)
        return quitButton
    }()
    
    lazy var rateButton: UIButton = {
        let rateButton = UIButton()
        rateButton.setTitle(" Rate Us ", for: .normal)
        setupSettingsButtons(rateButton)
        rateButton.alpha = 0.3
        rateButton.backgroundColor = .systemGreen
        return rateButton
    }()
    
    //MARK: - setupSubviews:
    
    func setupSubviews() {
        menuView.addSubview(coverImageView)
        menuView.addSubview(hub)
        
        menuView.addSubview(titleLabel)
        menuView.addSubview(coinLabel)
        
        menuView.addSubview(playButton)
        menuView.addSubview(timeModeButton)
        menuView.addSubview(hardcoreModeButton)
        menuView.addSubview(collectionButton)
        menuView.addSubview(difficultyButton)
        menuView.addSubview(resetButton)
        menuView.addSubview(addCoinButton)
        
        //Settings:
        menuView.addSubview(settingsButton)
        menuView.addSubview(settingsView)
        
        settingsView.addSubview(settingsMusic)
        settingsView.addSubview(settingsSound)
        settingsView.addSubview(settingsVibration)
        
        settingsView.addSubview(muteMusicButton)
        settingsView.addSubview(muteSoundButton)
        settingsView.addSubview(muteVibrationButton)
        
//        settingsView.addSubview(quitButton)
        settingsView.addSubview(rateButton)
        settingsView.addSubview(settingsBackground)
        settingsView.sendSubviewToBack(settingsBackground)
        
        menuView.bringSubviewToFront(coverImageView)
        menuView.bringSubviewToFront(settingsButton)
        menuView.bringSubviewToFront(settingsView)
        menuView.bringSubviewToFront(coinLabel)
        
    }
    
    //MARK: - setupConstraints:
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: menuView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: menuView.bottomAnchor),
            
            coverImageView.topAnchor.constraint(equalTo: menuView.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: menuView.bottomAnchor),
            
            hub.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            hub.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
            hub.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 52),
            hub.widthAnchor.constraint(equalTo: menuView.widthAnchor),
            hub.heightAnchor.constraint(equalToConstant: 53),
    
            coinLabel.topAnchor.constraint(equalTo: hub.topAnchor, constant: 12),
            coinLabel.leadingAnchor.constraint(equalTo: hub.leadingAnchor, constant: 11),

            settingsButton.topAnchor.constraint(equalTo: hub.topAnchor, constant: 6),
            settingsButton.bottomAnchor.constraint(equalTo: hub.bottomAnchor, constant: -6),
            settingsButton.trailingAnchor.constraint(equalTo: hub.trailingAnchor, constant: -14),
            settingsButton.widthAnchor.constraint(equalToConstant: 40),
            settingsButton.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.bottomAnchor.constraint(equalTo: menuView.bottomAnchor, constant: -45),
            titleLabel.leadingAnchor.constraint(equalTo: menuView.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: menuView.layoutMarginsGuide.trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            
            //MARK: - Buttons:
            
            difficultyButton.topAnchor.constraint(greaterThanOrEqualTo: hub.topAnchor, constant: 200),
            difficultyButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            difficultyButton.heightAnchor.constraint(equalToConstant: 57),
            difficultyButton.widthAnchor.constraint(equalToConstant: 137),
            
            playButton.topAnchor.constraint(equalTo: difficultyButton.bottomAnchor, constant: 15),
            playButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 57), // 50
            playButton.widthAnchor.constraint(equalToConstant: 137), // 120
            
            timeModeButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 15),
            timeModeButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            timeModeButton.heightAnchor.constraint(equalToConstant: 57),
            timeModeButton.widthAnchor.constraint(equalToConstant: 137),
            
            hardcoreModeButton.topAnchor.constraint(equalTo: timeModeButton.bottomAnchor, constant: 15),
            hardcoreModeButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            hardcoreModeButton.heightAnchor.constraint(equalToConstant: 57),
            hardcoreModeButton.widthAnchor.constraint(equalToConstant: 137),
            
            collectionButton.topAnchor.constraint(equalTo: hardcoreModeButton.bottomAnchor, constant: 15),
            collectionButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            collectionButton.heightAnchor.constraint(equalToConstant: 57),
            collectionButton.widthAnchor.constraint(equalToConstant: 137),

            resetButton.topAnchor.constraint(equalTo: collectionButton.bottomAnchor, constant: 30),
            resetButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            resetButton.heightAnchor.constraint(equalToConstant: 30),
            resetButton.widthAnchor.constraint(equalToConstant: 80),
            
            addCoinButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 10),
            addCoinButton.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            addCoinButton.heightAnchor.constraint(equalToConstant: 30),
            addCoinButton.widthAnchor.constraint(equalToConstant: 80),
//            addCoinButton.bottomAnchor.constraint(greaterThanOrEqualTo: menuView.bottomAnchor, constant: -170),
            
            //MARK: - Settings:
            
            settingsView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
            settingsView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
            settingsView.heightAnchor.constraint(greaterThanOrEqualToConstant: 300),
            settingsView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor),
            settingsView.centerYAnchor.constraint(equalTo: menuView.centerYAnchor),
            
            settingsBackground.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor),
            settingsBackground.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor),
            settingsBackground.topAnchor.constraint(equalTo: settingsView.topAnchor),
            settingsBackground.bottomAnchor.constraint(equalTo: settingsView.bottomAnchor),
            
            //MARK: - Settings Labels:
            
            settingsMusic.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 60),
            settingsMusic.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 50),
            
            settingsSound.topAnchor.constraint(equalTo: settingsMusic.bottomAnchor, constant: 23),
            settingsSound.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 50),
            
            settingsVibration.topAnchor.constraint(equalTo: settingsSound.bottomAnchor, constant: 23),
            settingsVibration.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 50),
            
            //MARK: - Settings Buttons:
            
            muteMusicButton.topAnchor.constraint(equalTo: settingsView.topAnchor, constant: 58),
            muteMusicButton.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -56),
            muteMusicButton.widthAnchor.constraint(equalToConstant: 77),
            muteMusicButton.heightAnchor.constraint(equalToConstant: 34),
            
            muteSoundButton.topAnchor.constraint(equalTo: muteMusicButton.bottomAnchor, constant: 19),
            muteSoundButton.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -56),
            muteSoundButton.widthAnchor.constraint(equalToConstant: 77),
            muteSoundButton.heightAnchor.constraint(equalToConstant: 34),
            
            muteVibrationButton.topAnchor.constraint(equalTo: muteSoundButton.bottomAnchor, constant: 19),
            muteVibrationButton.trailingAnchor.constraint(equalTo: settingsView.trailingAnchor, constant: -56),
            muteVibrationButton.widthAnchor.constraint(equalToConstant: 77),
            muteVibrationButton.heightAnchor.constraint(equalToConstant: 34),
                        
            rateButton.topAnchor.constraint(equalTo: muteVibrationButton.bottomAnchor, constant: 92),
            rateButton.leadingAnchor.constraint(equalTo: settingsView.leadingAnchor, constant: 50),
            rateButton.bottomAnchor.constraint(equalTo: settingsView.bottomAnchor, constant: -117),
            rateButton.widthAnchor.constraint(equalToConstant: 130),
            rateButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    //MARK: - setGradientBackground
    
    func setGradientBackground() {
        let palette = Palette()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = menuView.bounds
        gradientLayer.colors = [
            palette.wildCarribeanGrean.cgColor,
            palette.darkMountainMeadow.cgColor,
            palette.fuelTown.cgColor,
        ]
        menuView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //MARK: - setup Appearence:
    
    func setupAppearence(_ thisButton: UIButton) {
        thisButton.translatesAutoresizingMaskIntoConstraints = false
        thisButton.titleLabel?.adjustsFontSizeToFitWidth = true
        thisButton.tag = 1
        thisButton.setTitleColor(UIColor.black, for: .normal)
        thisButton.layer.borderWidth = 0
        thisButton.layer.cornerRadius = 10
        thisButton.layer.shadowColor = UIColor.black.cgColor
        thisButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        thisButton.layer.shadowRadius = 5
        thisButton.layer.shadowOpacity = 0.5
        thisButton.isUserInteractionEnabled = true
//        thisButton.titleLabel?.font = UIFont(name: FontKey.AmericanTypewriterBold.rawValue, size: 20)
        thisButton.titleLabel?.font = UIFont(name: FontKey.staatliches.rawValue, size: 23)
        thisButton.backgroundColor = palette.wildCarribeanGrean
        thisButton.layer.shouldRasterize = true
        thisButton.layer.rasterizationScale = UIScreen.main.scale
    }
    
    //MARK: - setup Settings Appearence:
    
    func setupSettingsButtons(_ thisButton: UIButton) {
        thisButton.translatesAutoresizingMaskIntoConstraints = false
        thisButton.titleLabel?.adjustsFontSizeToFitWidth = true
//        thisButton.titleLabel?.font = UIFont(name: FontKey.AmericanTypewriterCondensedBold.rawValue, size: 20)
        thisButton.titleLabel?.font = UIFont(name: FontKey.staatliches.rawValue, size: 23)
        thisButton.setTitleColor(UIColor.black, for: .normal)
        thisButton.layer.borderColor = UIColor.black.cgColor
        thisButton.layer.borderWidth = 0
        thisButton.layer.cornerRadius = 8
        thisButton.isUserInteractionEnabled = true
        thisButton.layer.shadowColor = UIColor.black.cgColor
        thisButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        thisButton.layer.shadowRadius = 3
        thisButton.layer.shadowOpacity = 1.0
        thisButton.layer.shouldRasterize = true
        thisButton.layer.rasterizationScale = UIScreen.main.scale
        thisButton.tintColor = .red
    }
    
    func setupSettingsLabels(_ thisLabel: UILabel) {
        thisLabel.translatesAutoresizingMaskIntoConstraints = false
        thisLabel.textAlignment = .left
//        thisLabel.font = UIFont(name: FontKey.AmericanTypewriterCondensedBold.rawValue, size: 25)
        thisLabel.font = UIFont(name: FontKey.staatliches.rawValue, size: 26)
    }
}
