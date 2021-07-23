//
//  ProfileTableViewCell.swift
//  SettingCloneApp
//
//  Created by yeonBlue on 2021/07/23.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeImageCircle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - SetUp
    func makeImageCircle() {
        guard let height = profileImageView?.bounds.width else { return }
        profileImageView?.layer.cornerRadius = CGFloat(height / 2)
    }
    
    func setUpLabels() {
        mainLabel.textColor = .blue
        mainLabel.font = .systemFont(ofSize: 20)
        
        detailLabel.textColor = .darkGray
        detailLabel.font = .systemFont(ofSize: 16)
    }
    
}
