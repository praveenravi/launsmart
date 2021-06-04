
import Foundation
struct Json4Swift_Base : Codable {
	let items1 : [Items]?
    let items2 : [Items]?

	enum CodingKeys: String, CodingKey {

		case items1 = "items1"
        case items2 = "items2"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		items1 = try values.decodeIfPresent([Items].self, forKey: .items1)
        items2 = try values.decodeIfPresent([Items].self, forKey: .items2)
	}

}
