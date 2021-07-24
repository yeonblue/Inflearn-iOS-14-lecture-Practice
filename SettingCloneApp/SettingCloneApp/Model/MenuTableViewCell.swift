//
//  MenuTableViewCell.swift
//  SettingCloneApp
//
//  Created by yeonBlue on 2021/07/23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setup
    func generateCell(data: SettingModel) {
        leftImageView.image = UIImage(systemName: data.leftImageName)
        rightImageView.image = UIImage(systemName: data.rightImageName ?? "" )
        menuNameLabel.text = data.menuTitle
    }
}
