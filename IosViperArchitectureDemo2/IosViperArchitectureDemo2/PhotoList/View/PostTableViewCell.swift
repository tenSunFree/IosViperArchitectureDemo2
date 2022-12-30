import UIKit
import AlamofireImage

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func set(forPost post: PhotoModel) {
        self.selectionStyle = .none
        titleLabel?.text = post.title
        titleLabel?.numberOfLines = 2
        let url = URL(string: post.imageUrl)!
        let uIImage = UIImage(named: "uIImage")
        // let image = UIImage.circle(diameter: 30)
        postImageView.layer.cornerRadius = postImageView.frame.height/2
        postImageView.clipsToBounds = true
        postImageView?.af_setImage(withURL: url, placeholderImage: uIImage)
    }
}
