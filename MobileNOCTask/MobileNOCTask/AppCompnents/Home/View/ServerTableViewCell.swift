//
//  ServerTableViewCell.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/4/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import UIKit

class ServerTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = 20
            profileImage.clipsToBounds = true
        }
    }
    @IBOutlet weak var serverNameLabel: UILabel!
    @IBOutlet weak var serverSerialLabel: UILabel!
    @IBOutlet weak var serverIPLabel: UILabel!
    @IBOutlet weak var subnetIPLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var voiceButton: UIButton!
    @IBOutlet weak var serverReasonLabel: UILabel! {
        didSet {
            serverReasonLabel
            .layer.cornerRadius = 10
            serverReasonLabel.clipsToBounds = true
            serverReasonLabel.layer.borderWidth = 1
            serverReasonLabel.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0.5)
        }
    }
    @IBOutlet weak var serverStatusLabel: UILabel! {
        didSet {
            serverStatusLabel
                .layer.cornerRadius = 15
            serverStatusLabel.clipsToBounds = true
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureCell(serverDetails: Content) {
        serverNameLabel.text = serverDetails.name
        serverSerialLabel.text = serverDetails.serialNumber
        serverIPLabel.text = serverDetails.ipAddress
        subnetIPLabel.text = serverDetails.ipSubnetMask

        switch serverDetails.status.id {
        case 1:
            serverStatusLabel.backgroundColor = .green
        case 2:
            serverStatusLabel.backgroundColor = .orange
        case 3:
            serverStatusLabel.backgroundColor = .yellow
        case 4:
            serverStatusLabel.backgroundColor = .red
        default:
            serverStatusLabel.backgroundColor = .black
        }
//        serverReasonLabel.text = serverDetails.status.statusValue
    }
    
    override func prepareForReuse() {
        serverNameLabel.text = nil
        serverSerialLabel.text = nil
        serverIPLabel.text = nil
        subnetIPLabel.text = nil
        serverReasonLabel.text = nil
        serverStatusLabel.text = nil
    }
}
