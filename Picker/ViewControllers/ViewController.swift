//
//  ViewController.swift
//  Picker
//
//  Created by Игорь Пачкин on 27/3/23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    private let signInLabel = UILabel()
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let underlineView = UIView()
    private let passwordLabel = UILabel()
    private let passwordTextField = UITextField()
    private let myButton = CustomButton()
    private let underlineView2 = UIView()
    private let switchLabel = UILabel()
    private let faceIDSwitch = UISwitch()
    private let button = UIButton(type: .system)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        setConstraints()
    }
    
    private func configureUI(){
        
        imageView.image = UIImage(named: "birthday_reminder_logo")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        myButton.firstImage = UIImage(named: "eye_slash")
        myButton.secondImage = UIImage(named: "eye")
        myButton.setImage(myButton.firstImage, for: .normal)
        myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        
        view.backgroundColor = .white
       
        let colorForLabels = UIColor(red: 173/255, green: 194/255, blue: 239/255, alpha: 1)
        let colorForUnderline = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        
        signInLabel.text = "Sign In"
        signInLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        emailLabel.text = "Email"
        emailLabel.textColor =  colorForLabels
        emailLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        emailTextField.borderStyle = .none
        emailTextField.addSubview(underlineView)
        
        underlineView.backgroundColor = colorForUnderline
        
        passwordLabel.text = "Password"
        passwordLabel.textColor = colorForLabels
        passwordLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        passwordTextField.borderStyle = .none
        passwordTextField.addSubview(underlineView2)
        passwordTextField.isSecureTextEntry = true
        
        underlineView2.backgroundColor = colorForUnderline
        
        switchLabel.text = "Вход по Face ID"
        switchLabel.textColor = .black
        switchLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(entryButton), for: .touchUpInside)
        
        
        
        
    }
    
    private func addSubviews(){
        view.addSubview(imageView)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(myButton)
        view.addSubview(switchLabel)
        view.addSubview(faceIDSwitch)
        view.addSubview(button)
    }
    
    private func setConstraints(){
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(95)
            make.width.equalTo(140)
            make.height.equalTo(imageView.snp.width)
        }
        
        signInLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(250)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalTo(signInLabel.snp.bottom).offset(25)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
        }
        
        underlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalTo(underlineView.snp.bottom).offset(25)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(50)
            make.height.equalTo(40)
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
        }
        
        myButton.snp.makeConstraints { make in
            make.left.equalTo(passwordTextField.snp.right).offset(-25)
            make.centerY.equalTo(passwordTextField)
            make.size.equalTo(CGSize(width: 22, height: 22))
        }
        
        underlineView2.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        switchLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(150)
            make.top.equalTo(underlineView2.snp.bottom).offset(25)
        }
        
        faceIDSwitch.snp.makeConstraints { make in
            make.left.equalTo(switchLabel.snp.right).offset(10)
            make.centerY.equalTo(switchLabel)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.top.equalTo(switchLabel.snp.bottom).offset(25)
            make.height.equalTo(40)
        }
        
    }
    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry.toggle() // Изменение значения secureTextEntry
        
    }
    
    @objc func buttonTapped(_ sender: CustomButton) {
        sender.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }


    @objc func entryButton(){
        let secondController = ViewController2()
        navigationController?.pushViewController(secondController, animated: true)
    }
    
}

