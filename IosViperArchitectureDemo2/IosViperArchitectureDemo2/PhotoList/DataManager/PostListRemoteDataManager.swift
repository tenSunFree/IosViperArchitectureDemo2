//
//  PostListRemoteDataManager.swift
//  iOS-Viper-Architecture
//
//  Created by Amit Shekhar on 18/02/17.
//  Copyright © 2017 Mindorks NextGen Private Limited. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import UIKit


class PostListRemoteDataManager:PostListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol?
    
    func retrievePostList() {
        Alamofire
            .request(Endpoints.Posts.fetch.url, method: .get)
            .validate()
            .responseArray(completionHandler: { (response: DataResponse<[PhotoModel]>) in
                switch response.result {
                case .success(let posts):
                    NSLog("PostListRemoteDataManager, retrievePostList, success")
                    self.remoteRequestHandler?.onPostsRetrieved(posts)
                    
                case .failure(let e):
                    NSLog("PostListRemoteDataManager, retrievePostList, failure, e: \(e)")
                    // self.remoteRequestHandler?.onError()
                    var postModelList = [PhotoModel]()
                    postModelList.append(PhotoModel(id: 0, title: "000", imageUrl: "https://i02piccdn.sogoucdn.com/98c721d4456e57f5", thumbImageUrl: "https://i02piccdn.sogoucdn.com/98c721d4456e57f5"))
                    postModelList.append(PhotoModel(id: 1, title: "111", imageUrl: "https://tupian.qqw21.com/article/UploadPic/2019-7/20197242324372851.jpeg", thumbImageUrl: "https://tupian.qqw21.com/article/UploadPic/2019-7/20197242324372851.jpeg"))
                    postModelList.append(PhotoModel(id: 2, title: "222", imageUrl: "https://tva1.sinaimg.cn/large/0075TGutgy1gv7pmiofp0j60b40b475l02.jpg", thumbImageUrl: "https://tva1.sinaimg.cn/large/0075TGutgy1gv7pmiofp0j60b40b475l02.jpg"))
                    postModelList.append(PhotoModel(id: 3, title: "333", imageUrl: "https://p6.toutiaoimg.com/origin/pgc-image/f464ebf5873a486e946557988d728803?from=pc", thumbImageUrl: "https://p6.toutiaoimg.com/origin/pgc-image/f464ebf5873a486e946557988d728803?from=pc"))
                    self.remoteRequestHandler?.onPostsRetrieved(postModelList)
                }
            })
    }
    
}
