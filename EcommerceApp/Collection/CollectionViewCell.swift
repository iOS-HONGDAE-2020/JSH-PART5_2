//
//  CollectionViewCell.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/24.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textLable: UILabel!
    @IBOutlet weak var secondLable: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
//    required init?(coder aDecoder: NSCoder) {
//       super.init(coder: aDecoder)
//        self.isUserInteractionEnabled = true
//    }
    
    var movie: Movie! {
        didSet {
            let url = URL(string: String(self.movie.thumb))
            let data = try! Data(contentsOf: url!)
            self.imgView?.image = UIImage(data: data)

            textLable.text = movie.title
            secondLable.text = "평점 : \(self.movie.user_rating)"
            dateLabel.text = movie.date
        }
    }
    
//    public func configure(with model: Movie) {
//        let url = URL(string: String(model.thumb))
//        let data = try! Data(contentsOf: url!)
//        self.imgView?.image = UIImage(data: data)
//
//        textLable.text = "model.title"
//        secondLable.text = "평점 : \(model.user_rating)"
//        dateLabel.text = model.date
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
//    static func nib() -> UINib {
//        return UINib(nibName: "CollectionViewCell", bundle: nil)
//    }

}
