

import Foundation
struct Items : Codable {
	let itemID : String?
	let itemTitle : String?
	var itemCount : Int?
    let itemPrice : Int?

	enum CodingKeys: String, CodingKey {

		case itemID = "itemID"
		case itemTitle = "itemTitle"
		case itemCount = "itemCount"
        case itemPrice = "itemPrice"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		itemID = try values.decodeIfPresent(String.self, forKey: .itemID)
		itemTitle = try values.decodeIfPresent(String.self, forKey: .itemTitle)
        itemCount = try values.decodeIfPresent(Int.self, forKey: .itemCount)
        itemPrice = try values.decodeIfPresent(Int.self, forKey: .itemPrice)
	}

}

