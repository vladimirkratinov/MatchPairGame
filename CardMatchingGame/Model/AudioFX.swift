//
//  AudioFX.swift
//  hangman
//
//  Created by Vladimir Kratinov on 2022/1/21.
//

import UIKit
import AVFoundation

class AudioFX {
    static var firstAudioFX: AVAudioPlayer?
    static var secondAudioFX: AVAudioPlayer?
    static var backgroundMusic: AVAudioPlayer?
    static var myQueuePlayer: AVQueuePlayer?
    static var avItems: [AVPlayerItem] = []
    
    let mp3 =               AudioTypeKey.mp3.rawValue
    let wav =               AudioTypeKey.wav.rawValue
    let flac =              AudioTypeKey.flac.rawValue
    let tinyButton =        AudioFileKey.tinyButtonPress.rawValue
    let buttonPress =       AudioFileKey.buttonPress.rawValue
    let flip1 =             AudioFileKey.flip1.rawValue
    let flip2 =             AudioFileKey.flip2.rawValue
    let flip3 =             AudioFileKey.flip3.rawValue
    let matchIgnite =       AudioFileKey.matchIgnite.rawValue
    let victory =           AudioFileKey.victory.rawValue
    let gameOver =          AudioFileKey.gameOver.rawValue
    let shiny =             AudioFileKey.shiny.rawValue
    let lockSound =         AudioFileKey.lockSound.rawValue
    let padlock =           AudioFileKey.padlock.rawValue
    let magic =             AudioFileKey.magic.rawValue
    
    func stopMusic() {
        AudioFX.backgroundMusic?.stop()
    }
    
    func openFirstFX(file: String, type: String) throws {
        enum AudioError: Error {
            case FileNotExist
        }
        
        guard let pathToSound = Bundle.main.path(forResource: file, ofType: type) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do {
            AudioFX.firstAudioFX = try AVAudioPlayer(contentsOf: url)
            AudioFX.firstAudioFX?.volume = 0.1
            AudioFX.firstAudioFX?.play()
        } catch {
            print("\(file).\(type) was not found.")
            throw AudioError.FileNotExist
        }
        
        loadAudio()
    }
    
    func openSecondFX(file: String, type: String) throws {
        enum AudioError: Error {
            case FileNotExist
        }
        
        guard let pathToSound = Bundle.main.path(forResource: file, ofType: type) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do {
            AudioFX.secondAudioFX = try AVAudioPlayer(contentsOf: url)
            AudioFX.secondAudioFX?.volume = 0.1
            AudioFX.secondAudioFX?.play()
        } catch {
            print("\(file).\(type) was not found.")
            throw AudioError.FileNotExist
        }
        
        loadAudio()
    }
    
    @objc func playBackgroundMusic(file: String, type: String) throws {
        enum AudioError: Error {
            case FileNotExist
        }
        
        guard let pathToSound = Bundle.main.path(forResource: file, ofType: type) else { return }
        let url = URL(fileURLWithPath: pathToSound)
        do {
            AudioFX.backgroundMusic = try AVAudioPlayer(contentsOf: url)
            AudioFX.backgroundMusic?.volume = 0.2
            AudioFX.backgroundMusic?.play()
            AudioFX.backgroundMusic?.numberOfLoops = 5
        } catch {
            print("\(file).\(type) was not found.")
            throw AudioError.FileNotExist
        }
        
    loadAudio()
        
    }
    
    func playQueueBackgroundMusic() {
        
//        let mySongs: [String] = ["track1", "track2", "track3", "track4", "track5", "track6"]
        var mySongs: [String] = ["Snowfall", "Ceremonial", "Allegro", "Dreamland", "KingPorter", "TheGentlemen"]
        mySongs.shuffle()
        print(mySongs)
        
        for clip in mySongs {
            guard let pathToSound = Bundle.main.path(forResource: clip, ofType: ".mp3") else { return }
            let url = URL(fileURLWithPath: pathToSound)
            AudioFX.avItems.append(AVPlayerItem(url: url))
        }
    }
    
    //MARK: - PlaySoundFX:
    
    func playFirstSoundFX(name: String, isMuted: Bool) {

        switch isMuted {
        case true:
            switch name {
            case tinyButton:    try? openFirstFX(file: tinyButton, type: wav)
            case buttonPress:   try? openFirstFX(file: buttonPress, type: wav)
            case flip1:         try? openFirstFX(file: flip1, type: wav)
            case flip2:         try? openFirstFX(file: flip2, type: wav)
            case flip3:         try? openFirstFX(file: flip3, type: wav)
            case matchIgnite:   try? openSecondFX(file: matchIgnite, type: wav)
            case victory:       try? openFirstFX(file: victory, type: wav)
            case gameOver:      try? openFirstFX(file: gameOver, type: wav)
            case shiny:         try? openFirstFX(file: shiny, type: flac)
            case magic:         try? openFirstFX(file: magic, type: flac)
            case lockSound:     try? openFirstFX(file: lockSound, type: flac)
            case padlock:       try? openFirstFX(file: padlock, type: flac)
            default:            return
            }
        default: return
        }
    }
    
    func playSecondSoundFX(name: String, isMuted: Bool) {

        switch isMuted {
        case true:
            switch name {
            case tinyButton:    try? openFirstFX(file: tinyButton, type: wav)
            case buttonPress:   try? openFirstFX(file: buttonPress, type: wav)
            case flip1:         try? openFirstFX(file: flip1, type: wav)
            case flip2:         try? openFirstFX(file: flip2, type: wav)
            case flip3:         try? openFirstFX(file: flip3, type: wav)
            case matchIgnite:   try? openSecondFX(file: matchIgnite, type: wav)
            case victory:       try? openFirstFX(file: victory, type: wav)
            case gameOver:      try? openFirstFX(file: gameOver, type: wav)
            case shiny:         try? openFirstFX(file: shiny, type: flac)
            case magic:         try? openFirstFX(file: magic, type: flac)
            case lockSound:     try? openFirstFX(file: lockSound, type: flac)
            case padlock:       try? openFirstFX(file: padlock, type: flac)
            default:            return
            }
        default: return
        }
    }
    
    func loadAudio() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, options: .mixWithOthers)
//            print("AVAudioSession Category Playback - OK!")
            do {
                try AVAudioSession.sharedInstance().setActive(true)
//                print("AVAudioSession is Active!")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
