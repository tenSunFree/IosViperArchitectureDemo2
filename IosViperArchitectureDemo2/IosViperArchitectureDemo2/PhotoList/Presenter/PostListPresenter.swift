//
//  PostListPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class PostListPresenter: PostListPresenterProtocol {
    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        NSLog("PostListPresenter, viewDidLoad")
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showPostDetail(forPost post: PhotoModel) {
        // wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }
}

extension PostListPresenter: PostListInteractorOutputProtocol {
    
    func didRetrievePosts(_ posts: [PhotoModel]) {
        view?.hideLoading()
        view?.showPosts(with: posts)
    }
    
    func onError() {
        NSLog("PostListPresenter, onError")
        view?.hideLoading()
        view?.showError()
    }
}


