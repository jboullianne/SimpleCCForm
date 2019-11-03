//
//  FancyInputField.swift
//  SimpleCCForm
//
//  Created by Jean-Marc Boullianne on 10/27/19.
//

import UIKit

class FancyTextField: UIView {
    
    // Components
    lazy var titleLabel:UILabel = UILabel()
    lazy var textField:UITextField = UITextField()
    
    // Colors
    lazy var accentColor:UIColor = UIColor(red: 160/255, green: 209/255, blue: 253/255, alpha: 1)
    lazy var baseColor:UIColor = UIColor(red: 232/255, green: 234/255, blue: 235/255, alpha: 1.0)

    // TextField Delegate
    var delegate:UITextFieldDelegate? = nil {
        didSet {
            print("Did Set FancyTextField Delegate")
        }
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
        setupTitleLabel()
        setupTextField()
    }
    
    func setupTitleLabel() {
        let labelWidth = frame.width
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: labelWidth, height: 20))
        
        if let font = titleLabel.font {
            let newFont = font.withSize(12.0)
            titleLabel.font = newFont
        }
        
        titleLabel.text = "Placeholder"
        addSubview(titleLabel)
    }
    
    func setupTextField() {
        
        let fieldWidth = frame.width
        
        textField = UITextField(frame: CGRect(x: 0, y: 20, width: fieldWidth, height: 40))
        textField.layer.borderColor = baseColor.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0
        textField.isUserInteractionEnabled = true
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        textField.delegate = self
        textField.addDoneCancelToolbar()
        
        addSubview(textField)
    }
    
}

extension FancyTextField: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = baseColor.cgColor
        
        delegate?.textFieldDidEndEditing?(textField)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = accentColor.cgColor
        delegate?.textFieldDidBeginEditing?(textField)
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldClear?(textField) ?? true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldReturn?(textField) ?? true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldEndEditing?(textField) ?? true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return delegate?.textFieldShouldBeginEditing?(textField) ?? true
    }
    
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        textField.layer.borderColor = baseColor.cgColor
        
        delegate?.textFieldDidEndEditing?(textField, reason: reason)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
