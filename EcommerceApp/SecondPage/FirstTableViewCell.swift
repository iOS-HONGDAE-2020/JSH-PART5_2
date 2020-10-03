//
//  FirstTableViewCell.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/26.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    static let identifier = "FirstTableViewCell"
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    var movieinfos: MovieInfo! {
        didSet {
            let url = URL(string: String(movieinfos.image))
            let data = try! Data(contentsOf: url!)
            self.imgView?.image = UIImage(data: data)
            titleLabel?.text = movieinfos.title
            dateLable?.text = movieinfos.date
            infoLabel.text = "\(movieinfos.genre), \(movieinfos.duration)분"
            firstLabel.text = "\(movieinfos.reservation_grade)위 \(movieinfos.reservation_rate)%"
            secondLabel.text = String(movieinfos.user_rating)
            thirdLabel.text = String(movieinfos.audience)
            storyLabel.text = movieinfos.synopsis
            directorLabel.text = movieinfos.director
            actorLabel.text = movieinfos.actor
            
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
        UINib(nibName: "FirstTableViewCell", bundle: nil)
    }
    

    
}
