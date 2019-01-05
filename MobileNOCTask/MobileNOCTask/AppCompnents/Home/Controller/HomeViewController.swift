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
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
            tableView.rowHeight = 70
            tableView.register(UINib(nibName: "ServerTableViewCell", bundle: nil), forCellReuseIdentifier: "ServerTableViewCell")
        }
    }
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
        
        setupAllLocationButton()

    }
    
    private func setupAllLocationButton() {
        allLocationButton.layer.borderColor = UIColor.lightGray.cgColor
        allLocationButton.layer.borderWidth = 1
        allLocationButton.layer.cornerRadius = 20
        allLocationButton.clipsToBounds = true
        allLocationButton.setImage(#imageLiteral(resourceName: "map").resizeImage(newSize: CGSize(width: 20, height: 20)), for: .normal)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServerTableViewCell", for: indexPath) as? ServerTableViewCell else { return UITableViewCell()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        let footerChildView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
        footerChildView.backgroundColor = UIColor.clear
        footerView.addSubview(footerChildView)
        return footerView
    }
}
