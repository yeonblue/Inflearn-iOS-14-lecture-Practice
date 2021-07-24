//
//  GeneralMenuViewController.swift
//  SettingCloneApp
//
//  Created by yeonBlue on 2021/07/24.
//

import UIKit

private let generalCellReuseIdentifier = "GeneralTableViewCell"

class GeneralTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var generalMenuLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!

    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helpers
    func generateCell(data: SettingGeneralModel) {
        generalMenuLabel.text = data.leftTitle
        rightImageView.image = UIImage(systemName: "chevron.right")
    }
}

class GeneralMenuViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var generalTableView: UITableView!
 
    // MARK: - Properties
    var data: [[SettingGeneralModel]]? {
        didSet {
            generalTableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGenerateTableView()
        getSettingGeneralModelData()
        setNavigationInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: - Setup
    func setupGenerateTableView() {
        generalTableView.dataSource = self
        generalTableView.delegate = self
    }
    
    func getSettingGeneralModelData() {
        data = SettingGeneralModel.makeSettingGeneralData()
    }
    
    func setNavigationInfo() {
        navigationItem.title = "General"
    }
}

// MARK: - UITableViewDelegate/DataSource
extension GeneralMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell() }
        let cell =
            tableView.dequeueReusableCell(withIdentifier: generalCellReuseIdentifier,
                                          for: indexPath) as! GeneralTableViewCell
        cell.generateCell(data: data[indexPath.section][indexPath.row])
        return cell
    }
}
