//
//  PostListView.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit
import PKHUD

class PostListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: PostListPresenterProtocol?
    var postList: [PhotoModel] = []
    
    override func viewDidLoad() {
        NSLog("PostListView, viewDidLoad")
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
}

extension PostListView: PostListViewProtocol {
    
    func showPosts(with posts: [PhotoModel]) {
        NSLog("PostListView, showPosts")
        postList = posts
        tableView.reloadData()
    }
    
    func showError() {
        NSLog("PostListView, showError")
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
}

extension PostListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        
        let post = postList[indexPath.row]
        cell.set(forPost: post)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("PostListView, tableView, indexPath: \(indexPath)")
        // presenter?.showPostDetail(forPost: postList[indexPath.row])
    }
    
}
