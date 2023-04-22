//
//  ViewController2.swift
//  
//
//  Created by Игорь Пачкин on 29/3/23.
//

import UIKit

class ViewController2: UIViewController {
    
    private lazy var addButton = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(addButtonTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        addSubviews()
        setConstraints()
       

    }
    
    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func addSubviews() {
       
    }
    
    private func setConstraints() {
        addButton.customView?.snp.makeConstraints { (make) in
            make.width.height.equalTo(32)
        }
    }
    
    @objc func addButtonTapped() {
        let thirdVC = ViewController3()
        navigationController?.pushViewController(thirdVC, animated: true)
        
    }
   
}
