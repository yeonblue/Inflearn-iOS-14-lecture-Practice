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

    // MARK: Properties
    var settingModel: [[SettingModel]]? {
        didSet {
            menuTableView.reloadData()
        }
    }
    
    // MARK: IBOutlets
    @IBOutlet weak var menuTableView: UITableView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuTableView()
        getSettingModelData()
        setupNavigationInfo()
    }

    // MARK: - Setup
    func setupMenuTableView() {
        let profileTableViewCellNib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        menuTableView.register(profileTableViewCellNib,
                               forCellReuseIdentifier: profileMenuReuseIdentifier)

        let menuTableViewCellNib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(menuTableViewCellNib,
                               forCellReuseIdentifier: MenuReuseIdentifier)
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
    }
    func getSettingModelData() {
        settingModel = SettingModel.makeSettingData()
    }
    
    func setupNavigationInfo() {
        navigationItem.title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: UITableViewDelegate/DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settingModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingModel?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let settingModel = settingModel else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: profileMenuReuseIdentifier, for: indexPath) as! ProfileTableViewCell
            cell.generateCell(data: settingModel[indexPath.section][indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuReuseIdentifier, for: indexPath) as! MenuTableViewCell
            cell.generateCell(data: settingModel[indexPath.section][indexPath.row])
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 0 {
            let generalVC = UIStoryboard(name: "GeneralMenuViewController", bundle: nil)
                .instantiateViewController(withIdentifier: "GeneralMenuViewController") as! GeneralMenuViewController
            
            self.navigationController?.pushViewController(generalVC, animated: true)
        }
    }
}
