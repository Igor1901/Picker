//
//  ViewController3.swift
//  Picker
//
//  Created by Игорь Пачкин on 29/3/23.
//

import UIKit
import SnapKit

class ViewController3: UIViewController {

    
    private let profileImageView = UIImageView()
    private let selectPhotoButton = UIButton()
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let nameUnderlineView = UIView()
    private let picker1Label = UILabel()
    private let dateTextField = UITextField()
    private let picker1UnderlineView = UIView()
    private let picker2Label = UILabel()
    private let ageTextField = PickerTextField()
    private let picker2UnderlineView = UIView()
    private let picker3Label = UILabel()
    private let genderTextField = PickerTextField()
    private let picker3UnderlineView = UIView()
    private let picker4Label = UILabel()
    private let picker4 = UITextField()
    private let picker4UnderlineView = UIView()
    
    
    var dateOfBirthdayPicker = UIDatePicker()
    var agePicker = UIPickerView()
    var genderPicker = UIPickerView()
    let genders = ["Мужчина","Женщина"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 32))
        let navItem = UINavigationItem(title: "Friend")
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeButtonTapped))
        let addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addButtonTapped))
        navItem.leftBarButtonItem = closeButton
        navItem.rightBarButtonItem = addButton
        navBar.setItems([navItem], animated: false)
        view.addSubview(navBar)
        
        configureUI()
        addSubviews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0 // Set the corner radius to half the width to make it a circle
    }
    
    private func configureUI(){
        let colorForLabels = UIColor(red: 173/255, green: 194/255, blue: 239/255, alpha: 1)
        let colorForUnderline = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        
        
        // Set the image view's properties
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.masksToBounds = true
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.gray.cgColor
        profileImageView.layer.borderWidth = 1.0
        
        // Add a button for selecting a photo
        selectPhotoButton.setTitle("Select Photo", for: .normal)
        selectPhotoButton.setTitleColor(.blue, for: .normal)
        selectPhotoButton.addTarget(self, action: #selector(selectPhotoButtonTapped), for: .touchUpInside)


        
        nameLabel.text = "Имя"
        nameLabel.textColor = colorForLabels
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        nameTextField.borderStyle = .none
        nameTextField.placeholder = "Введите имя"
        nameTextField.addSubview(nameUnderlineView)
        nameUnderlineView.backgroundColor = colorForUnderline
        
        picker1Label.text = "Дата"
        picker1Label.textColor = colorForLabels
        picker1Label.font = UIFont.boldSystemFont(ofSize: 16)
        
        dateTextField.placeholder = "Введите дату"
        dateTextField.inputView = dateOfBirthdayPicker
        dateOfBirthdayPicker.preferredDatePickerStyle = .wheels
        dateOfBirthdayPicker.locale = .init(identifier: "Russian")
        dateTextField.addSubview(picker1UnderlineView)
        picker1UnderlineView.backgroundColor = colorForUnderline
        datePicketParam()
        
        createPicker()
        
        genderPicker.tag = 0
        agePicker.tag = 1
        
        picker2Label.text = "Возраст"
        picker2Label.textColor = colorForLabels
        picker2Label.font = UIFont.boldSystemFont(ofSize: 16)
        
        ageTextField.placeholder = "Добавить"
        ageTextField.inputView = agePicker
        agePicker.delegate = self
        agePicker.dataSource = self
        ageTextField.addSubview(picker2UnderlineView)
        picker2UnderlineView.backgroundColor = colorForUnderline
        
        picker3Label.text = "Пол"
        picker3Label.textColor = colorForLabels
        picker3Label.font = UIFont.boldSystemFont(ofSize: 16)
        
        genderTextField.placeholder = "Добавить"
        genderTextField.inputView = genderPicker
        genderPicker.dataSource = self
        genderPicker.delegate = self
        genderTextField.addSubview(picker3UnderlineView)
        picker3UnderlineView.backgroundColor = colorForUnderline
        
        picker4Label.text = "Instagram"
        picker4Label.textColor = colorForLabels
        picker4Label.font = UIFont.boldSystemFont(ofSize: 16)
        
        picker4.placeholder = "Добавить"
        picker4.addSubview(picker4UnderlineView)
        picker4UnderlineView.backgroundColor = colorForUnderline
        
    }

    private func addSubviews(){
        view.addSubview(profileImageView)
        view.addSubview(selectPhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(picker1Label)
        view.addSubview(dateTextField)
        view.addSubview(picker2Label)
        view.addSubview(ageTextField)
        view.addSubview(picker3Label)
        view.addSubview(genderTextField)
        view.addSubview(picker4Label)
        view.addSubview(picker4)
    }
    
    private func setConstraints(){
        
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(95)
            make.width.equalTo(140)
            make.height.equalTo(profileImageView.snp.width)
        }

        selectPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(300)
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
            make.top.equalTo(nameUnderlineView.snp.bottom).offset(10)
        }
        
        dateTextField.snp.makeConstraints { make in
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
        picker2Label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalTo(picker1UnderlineView.snp.bottom).offset(10)
        }
        ageTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.top.equalTo(picker2Label.snp.bottom).offset(10)
        }
        picker2UnderlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        
        picker3Label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalTo(picker2UnderlineView.snp.bottom).offset(10)
        }
        genderTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.top.equalTo(picker3Label.snp.bottom).offset(10)
        }
        picker3UnderlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
        
        picker4Label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalTo(picker3UnderlineView.snp.bottom).offset(10)
        }
        picker4.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.top.equalTo(picker4Label.snp.bottom).offset(10)
        }
        picker4UnderlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
        }
    }
    
    
    
    @objc func addButtonTapped() {
       
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func selectPhotoButtonTapped() {
            // Show the image picker controller to select a photo
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            present(imagePickerController, animated: true, completion: nil)
        }
    func datePicketParam () {
        // создаем тул бар
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //создаем бар баттон
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButton], animated: true)
        //добавляем тул бар
        dateTextField.inputAccessoryView = toolbar
        dateOfBirthdayPicker.datePickerMode = .date
    }
    
    func createPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        
        ageTextField.inputAccessoryView = toolbar
        genderTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneDateAction () {
        //выбираем формат
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        dateTextField.text = formatter.string(from: dateOfBirthdayPicker.date)
        //убрать пикер по кнопке done
        view.endEditing(true)
    }
    
    @objc func doneAction(){
        // убрать пикер по кнопке
        view.endEditing(true)
    }

}

extension ViewController3: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController3: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return genders.count
        case 1: return 100
        default: return 0
        }
    }
}

extension ViewController3: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0: return genders[row]
        case 1: return "\(row + 1)"
        default: return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0: genderTextField.text = genders[row]
        case 1: ageTextField.text = "\(row + 1)"
        default: return
        }
    }
}
