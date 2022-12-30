import Foundation
import ObjectMapper

struct PhotoModel {
    var id = 0
    var title = ""
    var imageUrl = ""
    var thumbImageUrl = ""
}

extension PhotoModel: Mappable {
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        title     <- map["title"]
        imageUrl     <- map["url"]
        thumbImageUrl     <- map["thumbnailUrl"]
    }
}
