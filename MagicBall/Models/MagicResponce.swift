

struct ResponceAPI: Codable{
    let magic: MagicResponseModel
}
struct MagicResponseModel: Codable {
    
    let question,answer,type : String
}


