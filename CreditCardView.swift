//
//  CreditCardView.swift
//  SimpleCCForm
//
//  Created by Jean-Marc Boullianne on 11/3/19.
//

import UIKit

class CreditCardView: UIView {

    var numberLabel = UILabel()
    var nameLabel = UILabel()
    var expLabel = UILabel()
    var cardImage = UIImageView()
    
    var CARD_PADDING:CGFloat {
        get {
            return 20.0
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Credit Card Background
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = rect
        let bgStart = UIColor(red: 72/255, green: 47/255, blue: 183/255, alpha: 1.0)
        let bgEnd = UIColor(red: 198/255, green: 112/255, blue: 210/255, alpha: 1.0)
        gradientLayer.colors = [bgStart.cgColor, bgEnd.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.cornerRadius = 10.0
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        
        // Pink Side Clip
        let sideClip = CAShapeLayer()
        let sideClipPath = UIBezierPath()
        sideClipPath.addArc(withCenter: CGPoint(x: 10, y: rect.height - 10), radius: 10.0, startAngle: CGFloat.pi / 2.0, endAngle: CGFloat.pi , clockwise: true)
        sideClipPath.addLine(to: CGPoint(x: 0, y: rect.height / 3.0 ))
        sideClipPath.addLine(to: CGPoint(x: rect.width/10.0 * 4.5, y: rect.height))
        sideClipPath.close()
        
        sideClip.path = sideClipPath.cgPath
        sideClip.fillColor = UIColor(red: 238/255, green: 138/255, blue: 162/255, alpha: 1.0).cgColor
        self.layer.insertSublayer(sideClip, at: 1)
        
        let column1 = CAGradientLayer()
        column1.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height/8.0)
        column1.setAffineTransform(CGAffineTransform(rotationAngle: -1 * CGFloat.pi / 4.0).concatenating(CGAffineTransform(translationX: rect.width/8.0, y: rect.height/2.0)))
        let colStart = UIColor(red: 103/255, green: 128/255, blue: 200/255, alpha: 0.7)
        let colEnd = UIColor(red: 103/255, green: 128/255, blue: 200/255, alpha: 0)
        column1.colors = [colStart.cgColor, colEnd.cgColor]
        column1.startPoint = CGPoint(x: 0, y: 0.5)
        column1.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(column1, at: 1)
        
        
        let column2 = CAGradientLayer()
        column2.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height/4.0)
        column2.setAffineTransform(CGAffineTransform(rotationAngle: -1 * CGFloat.pi / 4.0))
        let colStart2 = UIColor(red: 103/255, green: 128/255, blue: 200/255, alpha: 0.7)
        let colEnd2 = UIColor(red: 157/255, green: 91/255, blue: 201/255, alpha: 0.45)
        column2.colors = [colStart2.cgColor, colEnd2.cgColor]
        column2.startPoint = CGPoint(x: 0.2, y: 0)
        column2.endPoint = CGPoint(x: 0.7, y: 1.0)
        self.layer.insertSublayer(column2, at: 1)
        
        
        
        let maskLayer = CALayer()
        maskLayer.frame = rect
        //maskLayer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0
        self.backgroundColor = UIColor.clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        //numberLabel = UILabel(frame: CGRect(x: CARD_PADDING, y: (cardHeight/2.0) - 10, width: cardWidth - (CARD_PADDING * 2), height: 40))
        numberLabel = UILabel(frame: CGRect(x: CARD_PADDING, y: (frame.height/2.0) - CARD_PADDING, width: frame.width, height: 25))
        numberLabel.text = "****  ****  ****  ****"
        numberLabel.textColor = UIColor.white
        if numberLabel.font != nil {
            //var newFont = font.withSize(20.0)
            let newFont = UIFont(name: "Helvetica-Bold", size: 20.0)
            numberLabel.font = newFont
        }
        self.addSubview(numberLabel)
        
        //nameLabel = UILabel(frame: CGRect(x: CARD_PADDING, y: cardHeight - (CARD_PADDING + 30), width: cardWidth - (CARD_PADDING * 2), height: 40))
        nameLabel = UILabel(frame: CGRect(x: CARD_PADDING, y: frame.height - CARD_PADDING - 25, width: frame.width, height: 25))
        nameLabel.text = "Card Holder"
        nameLabel.textColor = UIColor.white
        if nameLabel.font != nil {
            let newFont = UIFont(name: "Helvetica-Bold", size: 16.0)
            nameLabel.font = newFont
        }
        self.addSubview(nameLabel)
        
        //expLabel = UILabel(frame: CGRect(x: cardWidth - (CARD_PADDING + 70), y: cardHeight - (CARD_PADDING + 30), width: cardWidth - (CARD_PADDING * 2), height: 40))
        expLabel = UILabel(frame: CGRect(x: frame.width - CARD_PADDING - 80, y: frame.height - CARD_PADDING - 25, width: 100, height: 25))
        expLabel.text = "MM / YY"
        expLabel.textColor = UIColor.white
        if expLabel.font != nil {
            let newFont = UIFont(name: "Helvetica-Bold", size: 16.0)
            expLabel.font = newFont
        }
        self.addSubview(expLabel)
        
        //cardImage = UIImageView(frame: CGRect(x: cardWidth - (CARD_PADDING + 100), y: CARD_PADDING, width: 100, height: 100))
        cardImage.contentMode = .scaleAspectFit
        self.addSubview(cardImage)
    }
    

}
