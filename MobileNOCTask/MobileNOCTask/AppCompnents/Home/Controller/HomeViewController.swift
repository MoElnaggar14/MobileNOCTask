//
//  HomeViewController.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/4/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var allLocationButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        headerView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        headerView.layer.shadowOpacity = 15
        
        companyImage.layer.cornerRadius = 8
        companyImage.clipsToBounds = true
        
        profileImage.layer.cornerRadius = 32.5
        profileImage.clipsToBounds = true
        
        setupButton()

    }
    
    private func setupButton() {
        activeButton.layer.borderColor = UIColor.lightGray.cgColor
        activeButton.layer.borderWidth = 1
        
        downButton.layer.borderColor = UIColor.lightGray.cgColor
        downButton.layer.borderWidth = 1
        
        allLocationButton.layer.borderColor = UIColor.lightGray.cgColor
        allLocationButton.layer.borderWidth = 1
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
