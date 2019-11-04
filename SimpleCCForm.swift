//
//  SimpleCCForm.swift
//  SimpleCCForm
//
//  Created by Jean-Marc Boullianne on 10/27/19.
//

import UIKit

public class SimpleCCForm: UIView {
    
    // Form Colors
    lazy var buttonColor:UIColor = UIColor(red: 45/255, green: 85/255, blue: 211/255, alpha: 1)
    lazy var accentColor:UIColor = UIColor(red: 45/255, green: 85/255, blue: 211/255, alpha: 1)
    lazy var cardColor:UIColor = UIColor(red: 28/255, green: 23/255, blue: 55/255, alpha: 1)
    lazy var formColor:UIColor = UIColor.white
    
    // Containers
    lazy var card:CreditCardView = CreditCardView()
    lazy var form:UIView = UIView()
    
    // Components
    lazy var submitButton:UIButton = UIButton()

    lazy var ccNum:FancyTextField = FancyTextField()
    lazy var ccName:FancyTextField = FancyTextField()
    lazy var ccExpDate:FancyExpirationField = FancyExpirationField()
    lazy var ccCVV:FancyTextField = FancyTextField()
    
    lazy var numberLabel:UILabel = UILabel()
    lazy var nameLabel:UILabel  = UILabel()
    lazy var expLabel:UILabel = UILabel()
    lazy var cardImage:UIImageView = UIImageView()
    
    lazy var FORM_PADDING:CGFloat = 25
    lazy var CARD_PADDING:CGFloat = 25
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    
    func setupViews() {
        setupFormView()
        setupCardView()
    }
    
    func setupCardView() {
        
        let parentWidth = self.frame.width
        
        let cardWidth:CGFloat = parentWidth * 0.8
        let cardHeight:CGFloat = cardWidth * 0.627
        
        card = CreditCardView(frame: CGRect(x: (parentWidth - cardWidth)/2.0, y: 20, width: cardWidth, height: cardHeight))
        //card = UIView(frame: CGRect(x: (parentWidth - cardWidth)/2.0, y: 20, width: cardWidth, height: cardHeight))
        //card.backgroundColor = UIColor.clear//cardColor
        //card.layer.cornerRadius = 10.0
        card.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 60, spread: 0)
        addSubview(card)
        
        /*
        numberLabel = UILabel(frame: CGRect(x: CARD_PADDING, y: (cardHeight/2.0) - 10, width: cardWidth - (CARD_PADDING * 2), height: 40))
        numberLabel.text = "#"
        numberLabel.textColor = UIColor.white
        if let font = numberLabel.font {
            let newFont = font.withSize(20.0)
            numberLabel.font = newFont
        }
        card.addSubview(numberLabel)
        
        nameLabel = UILabel(frame: CGRect(x: CARD_PADDING, y: cardHeight - (CARD_PADDING + 30), width: cardWidth - (CARD_PADDING * 2), height: 40))
        nameLabel.text = "Card Holder"
        nameLabel.textColor = UIColor.white
        if let font = nameLabel.font {
            let newFont = font.withSize(16.0)
            nameLabel.font = newFont
        }
        card.addSubview(nameLabel)
        
        expLabel = UILabel(frame: CGRect(x: cardWidth - (CARD_PADDING + 70), y: cardHeight - (CARD_PADDING + 30), width: cardWidth - (CARD_PADDING * 2), height: 40))
        expLabel.text = "MM/YY"
        expLabel.textColor = UIColor.white
        if let font = expLabel.font {
            let newFont = font.withSize(16.0)
            expLabel.font = newFont
        }
        card.addSubview(expLabel)
        
        cardImage = UIImageView(frame: CGRect(x: cardWidth - (CARD_PADDING + 100), y: CARD_PADDING, width: 100, height: 100))
        cardImage.contentMode = .scaleAspectFit
        card.addSubview(cardImage)
        */
        
        
    }
    
    func setupFormView() {
        let parentWidth = self.frame.width
        let parentHeight = self.frame.height
        
        let formWidth:CGFloat = parentWidth - 16
        let formHeight:CGFloat = parentHeight - (parentWidth * 0.8 * 0.627)
        
        form = UIView(frame: CGRect(x: 8, y: 120, width: formWidth, height: formHeight))
        form.backgroundColor = formColor
        form.layer.cornerRadius = 5.0
        form.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 50, spread: 0)
        
        addSubview(form)
        
        setupSubmitButton()
        setupFields()
    }
    
    func setupSubmitButton() {
        let formWidth:CGFloat = form.frame.width
        let formHeight:CGFloat = form.frame.height
        
        let buttonWidth:CGFloat = formWidth - (FORM_PADDING * 2)
        let buttonHeight:CGFloat = 40
        
        submitButton = UIButton(frame: CGRect(x: (formWidth - buttonWidth)/2.0, y: formHeight - FORM_PADDING - buttonHeight, width: buttonWidth, height: buttonHeight))
        submitButton.backgroundColor = buttonColor
        submitButton.layer.cornerRadius = 4.0
        submitButton.layer.applySketchShadow(color: .black, alpha: 0.5, x: 0, y: 2, blur: 25, spread: 0)
        submitButton.setTitle("Submit", for: .normal)
        
        if let font = submitButton.titleLabel?.font {
            let newFont = font.withSize(14.0)
            submitButton.titleLabel?.font = newFont
        }
        
        form.addSubview(submitButton)
        
        submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
    }
    
    func setupFields() {
        let formWidth:CGFloat = form.frame.width
        let formHeight:CGFloat = form.frame.height
        
        let fieldWidth:CGFloat = formWidth - (FORM_PADDING * 2)
        let fieldHeight:CGFloat = 45
        
        ccNum = FancyTextField(frame: CGRect(x: (formWidth - fieldWidth)/2.0, y: formHeight - ((FORM_PADDING + fieldHeight) * 4), width: fieldWidth, height: fieldHeight))
        ccNum.titleLabel.text = "Card Number"
        ccNum.delegate = self
        if #available(iOS 10.0, *) {
            ccNum.textField.textContentType = .creditCardNumber
        }
        
        form.addSubview(ccNum)
        
        ccName = FancyTextField(frame: CGRect(x: (formWidth - fieldWidth)/2.0, y: formHeight - ((FORM_PADDING + fieldHeight) * 3), width: fieldWidth, height: fieldHeight))
        ccName.titleLabel.text = "Card Name"
        ccName.delegate = self
        if #available(iOS 10.0, *) {
            ccName.textField.textContentType = .name
        }
        form.addSubview(ccName)
        
        ccExpDate = FancyExpirationField(frame: CGRect(x: (formWidth - fieldWidth)/2.0, y: formHeight - ((FORM_PADDING + fieldHeight) * 2), width: (fieldWidth / 2.0) * 1.2, height: fieldHeight))
        ccExpDate.titleLabel.text = "Expiration Date"
        ccExpDate.delegate = self
        form.addSubview(ccExpDate)
        
        ccCVV = FancyTextField(frame: CGRect(x: (formWidth - FORM_PADDING) - (fieldWidth / 3.0), y: formHeight - ((FORM_PADDING + fieldHeight) * 2), width: fieldWidth / 3.0, height: fieldHeight))
        ccCVV.titleLabel.text = "CVV"
        ccCVV.delegate = self
        ccCVV.textField.returnKeyType = .done
        if #available(iOS 10.0, *) {
            ccCVV.textField.textContentType = .creditCardNumber
        }
        form.addSubview(ccCVV)
    }
    
    @objc func submitButtonPressed(sender: UIButton) {
        // prints CreditCard Details to output.
        //print("Submit Button pressed:", ccNum.textField.text, ccName.textField.text, ccExpDate.textField.text, ccExpDate.yearTextField.text, ccCVV.textField.text)
    }
}

extension CALayer {
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}

extension SimpleCCForm: UITextFieldDelegate {
    
    open func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did Begin Editing")
    }
    
    open func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print("Text Changing")
        if textField == ccNum.textField {
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                
                // Allow only numbers
                if let _ = string.rangeOfCharacter(from: CharacterSet.alphanumerics.symmetricDifference(CharacterSet.letters).inverted) { return false }
                
                if updatedText.count > 19 {
                    return false
                }
                
                let cardTypes = CardManager.calculateCardType(cardNumber: updatedText)
                
                if cardTypes.count == 1 {
                    cardImage.image = cardTypes[0].icon
                }
                
                var displayedText = ""
                var count = 0
                for c in updatedText {
                    displayedText += String(c)
                    count += 1
                    if count % 4 == 0 {
                        displayedText += " "
                    }
                }
                card.numberLabel.text = displayedText
            }
        } else if textField == ccName.textField {
            print("New String:", string)
            if let text = textField.text, let textRange = Range(range, in: text) {
                // Allow only Letters
                //if let _ = string.rangeOfCharacter(from: CharacterSet.alphanumerics.symmetricDifference(CharacterSet.decimalDigits).inverted) { return false }
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                card.nameLabel.text = updatedText
            }
        } else if textField == ccExpDate.textField {
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                card.expLabel.text = "\(updatedText.prefix(2))/\(ccExpDate.yearTextField.text ?? "YY")"
            }
        } else if textField == ccExpDate.yearTextField {
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                card.expLabel.text = "\(ccExpDate.textField.text ?? "MM")/\(updatedText.prefix(2))"
            }
        } else if textField == ccCVV.textField {
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                if updatedText.count > 4 {
                    return false
                }
            }
        }
        
        return true
    }
}
