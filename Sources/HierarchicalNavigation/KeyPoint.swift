import Foundation

public struct KeyPoint: Hashable, Codable {
    
    private let _type: String
    private let _x: Float
    private let _y: Float
    private let _from: String
    private let _to: String
    

    public var type : String{
        get {
            return _type
        }
    }
    
    public var x : Float {
        get {
            return _x
        }
    }

    public var y : Float {
        get {
            return _y
        }
    }
    
    public var from : String {
        get {
            return _from
        }
    }
    
    public var to : String{
        get {
            return _to
        }
    }
    
    public init(type: String, x: Float, y: Float, from: String, to: String) {
        self._type = type
        self._x = x
        self._y = y
        self._from = from
        self._to = to
    }
    
    public static func == (lhs: KeyPoint, rhs: KeyPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(Float(_x))
        hasher.combine(Float(_y))
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _x = "x"
        case _y = "y"
        case _from = "from"
        case _to = "to"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_type, forKey: ._type)
        try container.encode(_x, forKey: ._x)
        try container.encode(_y, forKey: ._y)
        try container.encode(_from, forKey: ._from)
        try container.encode(_to, forKey: ._to)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._type = try container.decode(String.self, forKey: ._type)
        self._x = try container.decode(Float.self, forKey: ._x)
        self._y = try container.decode(Float.self, forKey: ._y)
        self._from = try container.decode(String.self, forKey: ._from)
        self._to = try container.decode(String.self, forKey: ._to)
    }
}
