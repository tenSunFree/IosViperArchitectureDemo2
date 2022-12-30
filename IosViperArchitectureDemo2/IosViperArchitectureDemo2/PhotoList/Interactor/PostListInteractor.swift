//
//  PostListInteractor.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import UIKit

class PostListInteractor: PostListInteractorInputProtocol {
    weak var presenter: PostListInteractorOutputProtocol?
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        do {
            // if let postList = try localDatamanager?.retrievePostList() {
            //     let postModelList = postList.map() {
            //         return PostModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: // $0.thumbImageUrl!)
            //     }
            //     if  postModelList.isEmpty {
            //         remoteDatamanager?.retrievePostList()
            //     }else{
            //        presenter?.didRetrievePosts(postModelList)
            //     }
            // } else {
            //     remoteDatamanager?.retrievePostList()
            // }
            
            NSLog("PostListInteractor, retrievePostList")
            remoteDatamanager?.retrievePostList()
            
        } catch {
            presenter?.didRetrievePosts([])
        }
    }
        
}

extension PostListInteractor: PostListRemoteDataManagerOutputProtocol {
    
    func onPostsRetrieved(_ posts: [PhotoModel]) {
        NSLog("PostListInteractor, onPostsRetrieved")
        presenter?.didRetrievePosts(posts)
    }
    
    func onError() {
        NSLog("PostListInteractor, onError")
        presenter?.onError()
    }
    
    func onError2() {
        NSLog("PostListInteractor, onError2")
    }
}
