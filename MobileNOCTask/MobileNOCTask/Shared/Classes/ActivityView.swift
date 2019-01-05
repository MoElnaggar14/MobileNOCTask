//
//  ActivityView.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/5/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import UIKit

public class ActivityView: UIView {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ref = UIActivityIndicatorView()
        ref.color = #colorLiteral(red: 0.5696326494, green: 0.8211737871, blue: 0.9179508686, alpha: 1)
        ref.translatesAutoresizingMaskIntoConstraints = false
        ref.hidesWhenStopped = true
        return ref
    }()
    
    init(){
        super.init(frame: .zero)
        setupIndicator()
    }
    
    fileprivate func setupIndicator() {
        addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIndicator()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupIndicator()
    }
    
    
    func startAnimating(){
        activityIndicator.startAnimating()
    }
    
    
    func stopAnimating(){
        activityIndicator.stopAnimating()
    }
    
}
