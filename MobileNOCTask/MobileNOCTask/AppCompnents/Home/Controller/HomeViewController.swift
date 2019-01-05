//
//  HomeViewController.swift
//  MobileNOCTask
//
//  Created by Mohammed Elnaggar on 1/4/19.
//  Copyright © 2019 Mohammed Elnaggar. All rights reserved.
//

import UIKit
import Alamofire

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
            tableView.refreshControl = refresh
            activityIndicator = LoadMoreActivityIndicator(tableView: tableView)
        }
    }
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var activeButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var allLocationButton: UIButton!
    
    var currentPage: Int = 0
    var lastPage: Int = 0
    var servers = [Content]()
    
    lazy var refresh: UIRefreshControl = {
        let ref = UIRefreshControl()
        ref.addTarget(self, action: #selector(getServers), for: .valueChanged)
        return ref
    }()
    
    fileprivate var activityIndicator: LoadMoreActivityIndicator!
    
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
        getServers()
    }
    
    private func setupAllLocationButton() {
        allLocationButton.layer.borderColor = UIColor.lightGray.cgColor
        allLocationButton.layer.borderWidth = 1
        allLocationButton.layer.cornerRadius = 20
        allLocationButton.clipsToBounds = true
        allLocationButton.setImage(#imageLiteral(resourceName: "map").resizeImage(newSize: CGSize(width: 20, height: 20)), for: .normal)
    }
    
    @objc fileprivate func getServers() {
        (view as? ActivityView)?.startAnimating()
        CallAPI(ServerDetailsResponse.self) { [weak self](response) in
            guard let self = self else { return }
            (self.view as? ActivityView)?.stopAnimating()
            self.refresh.endRefreshing()
            
            switch response {
            case .failure(let error):
                Alert.showAlertDismiss(target: self, title: "Error!", message: error?.localizedDescription ?? "something get wrong!!")
            case .success(let value):
                self.currentPage = value.pageable.pageNumber
                self.lastPage = value.totalPages
                if self.currentPage == 0 {
                    self.servers = value.content
                } else {
                    self.servers.append(contentsOf: value.content)
                }
                self.tableView.reloadData()
            }
        }
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return servers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ServerTableViewCell", for: indexPath) as? ServerTableViewCell else { return UITableViewCell()}
        cell.configureCell(serverDetails: servers[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard currentPage <= lastPage, indexPath.row == self.servers.count - 1  else { return }
        getServers()
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

// TODO: Remove Quick Call and Call through generic network
extension HomeViewController: HandleAlamoResponse {
    private static var manager: Alamofire.SessionManager = {
        
        // Create the server trust policies
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "45.55.43.15": .disableEvaluation
        ]
        
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        
        return manager
    }()
    
    func CallAPI<T: CodableInit>(_ decoder: T.Type, debug: ((DataResponse<Any>) -> Void)? = nil,completion: CallResponse<T>) {
        HomeViewController.manager.request("https://45.55.43.15:9090/api/machine?page=\(self.currentPage)&size=10", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).authenticate(user: "admin@boot.com", password: "admin", persistence: .forSession).responseJSON { (results) in
            debug?(results)
            }.responseData {
                self.handleResponse($0, completion: completion)
        }
    }
}
