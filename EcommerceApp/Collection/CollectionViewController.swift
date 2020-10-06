//
//  CollectionViewController.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/24.
//  Copyright © 2020 정수현. All rights reserved.
//

import UIKit
import Alamofire

// icon protocol 만들어보기 : https://stackoverflow.com/questions/42141576/view-controller-changing-tab-bar-icon-and-action
// 탭바 다른거 : https://medium.com/sprinthub/creating-a-customized-tab-bar-in-ios-with-swift-41ed380f2a30

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellidentifier = "CollectionViewCell"
    var collectionViwFlowLayout: UICollectionViewFlowLayout!
    
    var movies: [Movie] = []
    let url = "http://connect-boxoffice.run.goorm.io/movies?order_type=0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupcollectionView()
        
        // title
        titleChange(title: "예매율순")
        fetchMovies(urls: url)

        // rightBarButton
        let itemimage = UIImage(systemName: "gearshape.fill")
        let rightBarButton = UIBarButtonItem(image: itemimage, style: .plain, target: self, action: #selector(showActionsheet))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        print("collection")
    }
    
    private func setupcollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellidentifier)
    }
    
    func titleChange(title: String) {
        self.navigationItem.title = title
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewLayout()
    }
    
    private func setupCollectionViewLayout() {
        if collectionViwFlowLayout == nil {
            let lineSpacing: CGFloat = 1
            let interItemSpacing: CGFloat = 15
            
            collectionViwFlowLayout = UICollectionViewFlowLayout()
            collectionViwFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViwFlowLayout.scrollDirection = .vertical
            collectionViwFlowLayout.minimumLineSpacing = lineSpacing
            collectionViwFlowLayout.minimumInteritemSpacing = interItemSpacing

            collectionView.setCollectionViewLayout(collectionViwFlowLayout, animated: true)
        }
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
            collectionView.reloadData()
          }
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath) as? CollectionViewCell {
            cell.movie = movies[indexPath.row]
            //cell.configure(with: self.movies[indexPath.row])
           
            return cell

        }
        return UICollectionViewCell()
      

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "SecondPageViewController") as! SecondPageViewController
        vc.movies = movies[indexPath.row]
        vc.titleName = movies[indexPath.row].title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numbeOfItemPerRow: CGFloat = 2
        let textAreaHeight: CGFloat = 35
        let interItemSpacing: CGFloat = 15
    
        let width: CGFloat = (collectionView.frame.width - (numbeOfItemPerRow - 1) * interItemSpacing) / numbeOfItemPerRow
        let height: CGFloat = (width * 1.5) + textAreaHeight
        return CGSize(width: width, height: height)
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
