//
//  ViewController2.swift
//  
//
//  Created by Игорь Пачкин on 29/3/23.
//

import UIKit
import SnapKit

protocol twoVCDelegate: AnyObject {
    func update(name: String, age: String, date: String, photo: UIImage)
}

class ViewController2: UIViewController, twoVCDelegate {
    
    var foto = UIImageView()
    var nameL = UILabel()
    var ageL = UILabel()
    var dateL = UILabel()
    
    private lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addButtonTapped))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        foto.layer.cornerRadius = foto.bounds.width / 2.0 // Set the corner radius to half the width to make it a circle
    }
    

    func update(name: String, age: String, date: String, photo: UIImage) {
        nameL.text = name.capitalized
        ageL.text = "Возраст: " + age
        dateL.text = "Дата рождения: " + date
        
        foto.image = photo
        
    }
   
    
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = addButton
        navigationItem.title = "List"
        
        foto.contentMode = .scaleAspectFill
        foto.layer.masksToBounds = true
        foto.clipsToBounds = true
        foto.layer.borderColor = UIColor.gray.cgColor
        //foto.layer.borderWidth = 1.0
        
        nameL.text = ""
        nameL.font = UIFont.boldSystemFont(ofSize: 16)
        ageL.text = ""
        dateL.text = ""
        
        
    }
    
    private func addSubviews() {
        view.addSubview(foto)
        view.addSubview(nameL)
        view.addSubview(ageL)
        view.addSubview(dateL)
    }
    
    private func setConstraints() {
        
        foto.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(160)
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(80)
            make.height.equalTo(foto.snp.width)
        }
        
        addButton.customView?.snp.makeConstraints { (make) in
            make.width.height.equalTo(32)
        }
        
        nameL.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(100)
            make.top.equalToSuperview().inset(150)
        }
        
        ageL.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(100)
            make.top.equalTo(nameL.snp.bottom).offset(15)
        }
        
        dateL.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(100)
            make.top.equalTo(ageL.snp.bottom).offset(15)
        }
    }
    
    @objc func addButtonTapped() {
        let thirdVC = ViewController3()
        thirdVC.delegate = self
        thirdVC.modalPresentationStyle = .formSheet
        present(thirdVC, animated: true, completion: nil)
        //navigationController?.pushViewController(thirdVC, animated: true)
    }

   
}

