//
//  ViewController3.swift
//  Picker
//
//  Created by Игорь Пачкин on 29/3/23.
//

import UIKit
import SnapKit

class ViewController3: UIViewController {

    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let nameUnderlineView = UIView()
    private let picker1Label = UILabel()
    private let picker1 = PickerTextField()
    private let picker1UnderlineView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        addSubviews()
        setConstraints()
    }
    private func configureUI(){
        let colorForLabels = UIColor(red: 173/255, green: 194/255, blue: 239/255, alpha: 1)
        let colorForUnderline = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        
        nameLabel.text = "Имя"
        nameLabel.textColor = colorForLabels
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        nameTextField.borderStyle = .none
        nameTextField.placeholder = "Введите имя"
        nameTextField.addSubview(nameUnderlineView)
        nameUnderlineView.backgroundColor = colorForUnderline
        
        picker1Label.text = "Эмоциональное состояние"
        picker1Label.textColor = colorForLabels
        picker1Label.font = UIFont.boldSystemFont(ofSize: 16)
        
        picker1.addSubview(picker1UnderlineView)
        picker1.placeholder = "Нормально / тревога / грустно"
        picker1UnderlineView.backgroundColor = colorForUnderline
        
    }

    private func addSubviews(){
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(picker1Label)
        view.addSubview(picker1)
    }
    
    private func setConstraints(){
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(250)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        nameUnderlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        picker1Label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalTo(nameUnderlineView.snp.bottom).offset(25)
        }
        
        picker1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.top.equalTo(picker1Label.snp.bottom).offset(10)
        }
     
        picker1UnderlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

}

extension ViewController3: UIPickerViewDataSource {
    // Сколько компонентов выводить
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Сколько строк в компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController3: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "\(row)"
        return result
    }
}
