import UIKit

class PhotoListWireFrame: PostListWireFrameProtocol {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func createPostListModule() -> UIViewController {
        NSLog("PostListWireFrame, createPostListModule")
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PostsNavigationController")
        // if let view = navController.childViewControllers.first as? PostListView {
        if let view = navController.children.first as? PostListView {
            let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
            NSLog("PostListWireFrame, createPostListModule, presenter: \(presenter)")
            let interactor: PostListInteractorInputProtocol & PostListRemoteDataManagerOutputProtocol = PostListInteractor()
            NSLog("PostListWireFrame, createPostListModule, interactor: \(interactor)")
            // let localDataManager: PostListLocalDataManagerInputProtocol = PostListLocalDataManager()
            // NSLog("PostListWireFrame, createPostListModule, localDataManager: \(localDataManager)")
            let remoteDataManager: PostListRemoteDataManagerInputProtocol = PostListRemoteDataManager()
            NSLog("PostListWireFrame, createPostListModule, remoteDataManager: \(remoteDataManager)")
            let wireFrame: PostListWireFrameProtocol = PhotoListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            // interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        NSLog("PostListWireFrame, createPostListModule2")
        return UIViewController()
    }
    
    // func çç(from view: PostListViewProtocol, forPost post: PostModel) {
    //     let postDetailViewController = PostDetailWireFrame.createPostDetailModule(forPost: post)
    //     if let sourceView = view as? UIViewController {
    //        sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
    //     }
    // }
    
}
