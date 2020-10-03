//
//  TableViewController.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/24.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit
import Alamofire

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    let url = "http://connect-boxoffice.run.goorm.io/movies?order_type=0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 130
        
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        //title
        titleChange(title: "예매율순")
        fetchMovies(urls: url)
        
        // rightBarButton
        let itemimage = UIImage(systemName: "gearshape.fill")
        let rightBarButton = UIBarButtonItem(image: itemimage, style: .plain, target: self, action: #selector(showActionsheet))
        self.navigationItem.rightBarButtonItem = rightBarButton
        print("table")
    }
    
    func titleChange(title: String) {
        self.navigationItem.title = title
    }

    //MARK: Actionsheet
    @objc func showActionsheet() {
        let actionsheet = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요", preferredStyle: .actionSheet)
        // 예매율
        actionsheet.addAction(UIAlertAction(title: "예매율", style: .default, handler: { action in
            self.titleChange(title: "예매율순")
            self.fetchMovies(urls: "http://connect-boxoffice.run.goorm.io/movies?order_type=0")
        }))
        // 큐레이션
        actionsheet.addAction(UIAlertAction(title: "큐레이션", style: .default, handler: {action in
            print("dismiss")
            self.titleChange(title: "큐레이션순")
            self.fetchMovies(urls: "http://connect-boxoffice.run.goorm.io/movies?order_type=1")
        }))
        // 개봉일
        actionsheet.addAction(UIAlertAction(title: "개봉일", style: .default, handler: {action in
            self.titleChange(title: "개봉일순")
            self.fetchMovies(urls: "http://connect-boxoffice.run.goorm.io/movies?order_type=2")
        }))
        // 취소
        actionsheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: {action in
            print("tapped")

        }))

        present(actionsheet, animated: true)
    }

    //MARK: Alamofire
    func fetchMovies(urls: String) {
        AF.request(urls).validate()
            .responseDecodable(of: Movies.self) { [self] (response) in
            guard let movies = response.value else { return }
            self.movies = movies.all
            tableView?.reloadData()
          }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell {
            cell.movie = movies[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SecondPageViewController") as! SecondPageViewController
        vc.movies = movies[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        print("sss")
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
