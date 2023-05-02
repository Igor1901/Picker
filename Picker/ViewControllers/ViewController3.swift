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
    private let picker1 = PickerTextField()
    private let picker1UnderlineView = UIView()
    private let picker2Label = UILabel()
    private let picker2 = PickerTextField()
    private let picker2UnderlineView = UIView()
    private let picker3Label = UILabel()
    private let picker3 = PickerTextField()
    private let picker3UnderlineView = UIView()
    private let picker4Label = UILabel()
    private let picker4 = UITextField()
    private let picker4UnderlineView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        addSubviews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
    }
    
    private func configureUI(){
        let colorForLabels = UIColor(red: 173/255, green: 194/255, blue: 239/255, alpha: 1)
        let colorForUnderline = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        
        // Set the image view's properties
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.masksToBounds = true
        profileImageView.clipsToBounds = true
        //profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0 // Set the corner radius to half the width to make it a circle
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
        
        picker1.placeholder = "Введите дату"
        picker1.addSubview(picker1UnderlineView)
        picker1UnderlineView.backgroundColor = colorForUnderline
        
        picker2Label.text = "Возраст"
        picker2Label.textColor = colorForLabels
        picker2Label.font = UIFont.boldSystemFont(ofSize: 16)
        
        picker2.placeholder = "Добавить"
        picker2.addSubview(picker2UnderlineView)
        picker2UnderlineView.backgroundColor = colorForUnderline
        
        picker3Label.text = "Пол"
        picker3Label.textColor = colorForLabels
        picker3Label.font = UIFont.boldSystemFont(ofSize: 16)
        
        picker3.placeholder = "Добавить"
        picker3.addSubview(picker3UnderlineView)
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
        view.addSubview(picker1)
        view.addSubview(picker2Label)
        view.addSubview(picker2)
        view.addSubview(picker3Label)
        view.addSubview(picker3)
        view.addSubview(picker4Label)
        view.addSubview(picker4)
    }
    
    private func setConstraints(){
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(150)
            make.height.equalTo(profileImageView.snp.width)
        }

        selectPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }

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
            make.top.equalTo(nameUnderlineView.snp.bottom).offset(10)
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
        picker2Label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalTo(picker1UnderlineView.snp.bottom).offset(10)
        }
        picker2.snp.makeConstraints { make in
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
        picker3.snp.makeConstraints { make in
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
    
    @objc private func selectPhotoButtonTapped() {
            // Show the image picker controller to select a photo
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            present(imagePickerController, animated: true, completion: nil)
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
