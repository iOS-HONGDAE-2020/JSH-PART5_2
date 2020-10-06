//
//  TableViewCell.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/24.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var firstLable: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rankColor: UIImageView!
    
    var movie: Movie! {
        didSet {
            let url = URL(string: String(self.movie.thumb))
            let data = try! Data(contentsOf: url!)
            imageView?.image = UIImage(data: data)
            imageView?.contentMode = .scaleAspectFit
            
            titleLable.text = self.movie.title
            firstLable.text = "평점 : \(self.movie.user_rating)"
            secondLabel.text = "예매순위 : \(self.movie.reservation_grade)"
            thirdLabel.text = "예매율 : \(self.movie.reservation_rate)"
            dateLabel.text = "개봉일 : \(self.movie.date)"
            
            let movieGrade = self.movie.grade
            if movieGrade == 19 {
                rankColor.image = UIImage(named: "ic_19")
            } else if movieGrade == 15 {
                rankColor.image = UIImage(named: "ic_15")
            } else if movieGrade == 12 {
                rankColor.image = UIImage(named: "ic_12")
            } else {
                rankColor.image = UIImage(named: "ic_allages")
            }
        }
    }
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
}
