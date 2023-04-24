//
//  PickerTextField.swift
//  Picker
//
//  Created by Игорь Пачкин on 24/4/23.
//

import UIKit
import SnapKit

class PickerTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView()
    var options = ["Иди нахуй","Пшел нах","Слава Украине", "путин Хуйло"]
    var doneHandler: ((_ selectedValue: String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        self.inputAccessoryView = toolbar
        addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)
    }
    
    //MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    //MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        text = options[row]
    }
    
    @objc private func doneButtonTapped() {
        if let handler = doneHandler, let text = text {
            handler(text)
        }
        resignFirstResponder()
    }
    
    @objc private func didBeginEditing() {
        pickerView.selectRow(options.firstIndex(of: text ?? "") ?? 0, inComponent: 0, animated: false)
    }
    
    
}
