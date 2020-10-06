//
//  SecondPageViewController.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/26.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit
import Alamofire

class SecondPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var titleName: String? = ""
    var movieInfoss: [MovieInfo] = []
    @IBOutlet weak var tableView: UITableView!
    let urls = "http://connect-boxoffice.run.goorm.io/movie?id=5a54c286e8a71d136fb5378e"
    var movies: Movie!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = titleName
        
        tableViewSettings()
        fetchMovies()
        
        
        self.tableView.rowHeight = 800

    }
    
    func tableViewSettings() {
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    //MARK: Alamofire
    func fetchMovies() {
        AF.request("http://connect-boxoffice.run.goorm.io/movie?id=5a54c286e8a71d136fb5378e").validate()
            .responseDecodable(of: MovieInfo.self) { [self] (response) in
                guard let movieInfos = response.value else { return }
                self.movieInfoss = [movieInfos]
                tableView.reloadData()
                print(movieInfoss)
            }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfoss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
        cell.movieinfos = movieInfoss[indexPath.row]
        return cell
    }
    
    @IBAction func commentTapButton(_sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as! ThirdViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("hello")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
