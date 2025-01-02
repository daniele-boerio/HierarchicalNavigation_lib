import Foundation

public struct Point: Hashable, Codable {
    private var _x: Float
    private var _y: Float
    private var _heading: Float?
    private var _name: String?

    public var x : Float {
        get {
            return _x
        }
        set(newValue) {
            _x = newValue
        }
    }

    public var y : Float {
        get {
            return _y
        }
        set(newValue) {
            _y = newValue
        }
    }
    
    public var heading : Float {
        get {
            return _heading ?? 0
        }
        set(newValue) {
            _heading = newValue
        }
    }
    
    public var name : String {
        get {
            return _name ?? ""
        }
        set(newValue) {
            _name = newValue
        }
    }

    public init(x: Float, y: Float, heading: Float? = nil, name: String? = nil) {
        self._x = x
        self._y = y
        self._heading = heading
        self._name = name
    }
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(Float(_x))
        hasher.combine(Float(_y))
        hasher.combine(Float(_heading ?? 0))
        hasher.combine(String(_name ?? ""))
    }
    
    enum CodingKeys: String, CodingKey {
        case _x = "x"
        case _y = "y"
        case _heading = "heading"
        case _name = "name"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_x, forKey: ._x)
        try container.encode(_y, forKey: ._y)
        try container.encode(_heading, forKey: ._heading)
        try container.encode(_name, forKey: ._name)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._x = try container.decode(Float.self, forKey: ._x)
        self._y = try container.decode(Float.self, forKey: ._y)
        self._heading = try container.decodeIfPresent(Float.self, forKey: ._heading)
        self._name = try container.decodeIfPresent(String.self, forKey: ._name)
    }
}
