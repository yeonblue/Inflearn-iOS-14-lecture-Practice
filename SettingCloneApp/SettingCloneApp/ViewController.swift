//
//  ViewController.swift
//  SettingCloneApp
//
//  Created by yeonBlue on 2021/07/23.
//

import UIKit

private let profileMenuReuseIdentifier = "ProfileTableViewCell"
private let MenuReuseIdentifier = "MenuTableViewCell"

class ViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMenuTableView()
    }

    // MARK: - Setup
    func setUpMenuTableView() {
        let profileTableViewCellNib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        menuTableView.register(profileTableViewCellNib,
                               forCellReuseIdentifier: profileMenuReuseIdentifier)

        let menuTableViewCellNib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(menuTableViewCellNib,
                               forCellReuseIdentifier: MenuReuseIdentifier)
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
    }
}

// MARK: UITableViewDelegate/DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: profileMenuReuseIdentifier, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuReuseIdentifier, for: indexPath)
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 44
        }
    }
    
}
