//
//  CustomCell.swift
//  API_Naruto
//
//  Created by Omar Hisham on 4/23/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(naruto: NarutoInfo){
        title.text = naruto.title
        type.text = naruto.type
        
        guard let url = URL(string: naruto.image_url) else { return }

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.imgView.image = UIImage(data: data!)
            }
        }
        
    }

}
