//
//  FancyExpirationField.swift
//  SimpleCCForm
//
//  Created by Jean-Marc Boullianne on 10/27/19.
//

import UIKit

class FancyExpirationField: FancyTextField {
    
    lazy var slashLabel:UILabel = UILabel()
    lazy var yearTextField:UITextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textField.keyboardType = .numberPad
        setupSlash()
        setupYearField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        textField.keyboardType = .numberPad
        setupSlash()
        setupYearField()
    }
    
    func setupSlash() {
        slashLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 10, height: 40))
        slashLabel.text = "/"
        textField.addSubview(slashLabel)
    }
    
    func setupYearField() {
        yearTextField = UITextField(frame: CGRect(x: 50 + 17, y: 20, width: frame.width - 15, height: 40))
        yearTextField.isUserInteractionEnabled = true
        yearTextField.delegate = self
        yearTextField.placeholder = "YY"
        yearTextField.keyboardType = .numberPad
        yearTextField.addDoneCancelToolbar()

        self.addSubview(yearTextField)
        
        self.textField.placeholder = "MM"
    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        print("FIELD END EDITING: ", self.textField.isFirstResponder, yearTextField.isFirstResponder)
        if textField == self.textField && !yearTextField.isFirstResponder {
            self.textField.layer.borderColor = baseColor.cgColor
        }
        if textField == yearTextField && !self.textField.isFirstResponder {
            self.textField.layer.borderColor = baseColor.cgColor
        }
        
        delegate?.textFieldDidEndEditing?(textField)
    }
    
    override func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DID BEGIN EDITING")
        if textField == self.textField || textField == yearTextField {
            self.textField.layer.borderColor = accentColor.cgColor
        }
        
        delegate?.textFieldDidBeginEditing?(textField)
        
    }
    
    override func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldClear?(textField) ?? true
    }
    
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? true
    }
    
    override func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    override func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    @available(iOS 10.0, *)
    override func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print("FIELD END EDITING: ", self.textField.isFirstResponder, yearTextField.isFirstResponder)
        if textField == self.textField && !yearTextField.isFirstResponder {
            self.textField.layer.borderColor = baseColor.cgColor
        }
        if textField == yearTextField && !self.textField.isFirstResponder {
            self.textField.layer.borderColor = baseColor.cgColor
        }
        
        delegate?.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("REPLACING STRING", string)
        
        if string.count == 0 { // Erasing text
            
            if textField == yearTextField && (yearTextField.text ?? "").count == 1 { // Erase first digit of year and move to month
                //yearTextField.text = ""
                //let result = delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
                //self.textField.becomeFirstResponder()
                return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
            } else {
                return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
            }
            
        }
        
        if (textField.text ?? "").count + string.count >= 2 && textField == self.textField { // Month Done, Move to Year
            textField.text = String("\(textField.text ?? "")\(string)".prefix(2))
            yearTextField.becomeFirstResponder()
        } else if (textField.text ?? "").count + string.count >= 2 && textField == self.yearTextField { //Year Done, Resign First Responder
            textField.text = String("\(textField.text ?? "")\(string)".prefix(2))
            yearTextField.resignFirstResponder()
        }
        
        // All Normal
        return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
}
