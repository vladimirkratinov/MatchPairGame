//
//  DetailInterface.swift
//  CardMatchingGame
//
//  Created by Vladimir Kratinov on 2022/8/17.
//

import UIKit

class DetailInterface: UIView {
    
    var detailView: UIView = {
        let detailView = UIView()
        return detailView
    }()
    
    var backgroundView: UIView = {
        let backgroundView = UIView()
        return backgroundView
    }()
    
    var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView(frame: .zero)
        backgroundImageView.alpha = 0.8
        backgroundImageView.image = UIImage(named: "LaunchScreen1")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImageView
    }()
    
    lazy var detailUIView: UIView = {
        let detailUIView = UIView()
        detailUIView.translatesAutoresizingMaskIntoConstraints = false
        detailUIView.isHidden = false
        detailUIView.alpha = 1
//        imageUIView.layer.borderWidth = 5
//        imageUIView.layer.cornerRadius = 20
//        imageUIView.backgroundColor = UIColor(patternImage: UIImage(named: ImageKey.wood3.rawValue)!)
        detailUIView.layer.borderColor = UIColor.black.cgColor
        detailUIView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        return detailUIView
    }()
    
//    var detailImageView: UIImageView = {
//        let detailImageView = UIImageView()
//        detailImageView.translatesAutoresizingMaskIntoConstraints = false
//        detailImageView.isUserInteractionEnabled = true
//        detailImageView.image = UIImage(named: "LaunchScreen1")
//        detailImageView.contentMode = .scaleAspectFit
//        detailImageView.backgroundColor = .red
//        detailImageView.clipsToBounds = true
//        detailImageView.contentMode = .redraw
//        detailImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
//        return detailImageView
//    }()
    
    var detailImageButton: UIButton = {
        let detailImageButton = UIButton()
        detailImageButton.translatesAutoresizingMaskIntoConstraints = false
        detailImageButton.isUserInteractionEnabled = true
        detailImageButton.setImage(UIImage(systemName: "trash.fill"), for: .normal)
//        detailImageView.contentMode = .scaleAspectFit
//        detailImageButton.backgroundColor = .red
        detailImageButton.clipsToBounds = true
        detailImageButton.contentMode = .redraw
        detailImageButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        return detailImageButton
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "History"
        titleLabel.font = UIFont(name: FontKey.FuturaExtraBold.rawValue, size: 20)
        titleLabel.isHidden = true
        return titleLabel
    }()
    
    var detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.textAlignment = .justified
        detailLabel.text = "A postage stamp is a small piece of paper issued by a post office, postal administration, or other authorized vendors to customers who pay postage (the cost involved in moving, insuring, or registering mail), who then affix the stamp to the face or address-side of any item of mail—an envelope or other postal cover (e.g., packet, box, mailing cylinder)—that they wish to send. \n \n The item is then processed by the postal system, where a postmark or cancellation mark—in modern usage indicating date and point of origin of mailing—is applied to the stamp and its left and right sides to prevent its reuse. \n \n The item is then delivered to its addressee."
        detailLabel.font = UIFont(name: "AmericanTypewriter", size: 15)
        detailLabel.numberOfLines = 20
        detailLabel.isHidden = true
        detailLabel.adjustsFontSizeToFitWidth = true
        detailLabel.sizeToFit()
        return detailLabel
    }()
    
    func setupSubviews() {
        detailView.addSubview(backgroundView)
        detailView.addSubview(detailUIView)
        backgroundView.addSubview(backgroundImageView)
        
        detailUIView.addSubview(detailImageButton)
        detailUIView.addSubview(titleLabel)
        detailUIView.addSubview(detailLabel)
        
        detailView.bringSubviewToFront(detailUIView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            detailUIView.leadingAnchor.constraint(equalTo: detailView.layoutMarginsGuide.leadingAnchor),
            detailUIView.trailingAnchor.constraint(equalTo: detailView.layoutMarginsGuide.trailingAnchor),
            detailUIView.centerYAnchor.constraint(equalTo: detailView.centerYAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: detailView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: detailView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: detailView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor),
            
            detailImageButton.topAnchor.constraint(equalTo: detailUIView.topAnchor, constant: 10),
            detailImageButton.leadingAnchor.constraint(equalTo: detailUIView.leadingAnchor),
            detailImageButton.trailingAnchor.constraint(equalTo: detailUIView.trailingAnchor),
            detailImageButton.bottomAnchor.constraint(equalTo: detailUIView.bottomAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: detailUIView.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: detailUIView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            titleLabel.heightAnchor.constraint(equalToConstant: 44),
            
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: detailUIView.leadingAnchor, constant: 75),
            detailLabel.trailingAnchor.constraint(equalTo: detailUIView.trailingAnchor, constant: -75),
            detailLabel.bottomAnchor.constraint(equalTo: detailUIView.bottomAnchor, constant: -75),
            
            ])
    }
}
