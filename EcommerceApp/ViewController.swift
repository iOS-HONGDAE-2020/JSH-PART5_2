//
//  ViewController.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/18.
//  Copyright © 2020 정수현. All rights reserved.
// https://www.raywenderlich.com/6587213-alamofire-5-tutorial-for-ios-getting-started
// https://swapi.dev/api/films/
import UIKit
import Alamofire
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //var items: [Displayable] = []
    var movies: [Movie] = []
    private let url = "http://connect-boxoffice.run.goorm.io/movies?order_type=1"
    //private let url = URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=1")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //fetchData()
        fetchFilms()
        
    }
    
    func fetchFilms() {
        // 1
//        let request = AF.request(url, method: .get)
        // 2
//        request.responseJSON { (data) in
//          print(data)
//        }

        AF.request(url).validate()
            .responseDecodable(of: Movies.self) { [self] (response) in
            guard let movies = response.value else { return }
            self.movies = movies.all
            tableView.reloadData()
            //print(movies.all)
            //print(self.movies)
          }

        
    }
  

    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath)
        let movie = self.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.date
        
        return cell
    }


}

