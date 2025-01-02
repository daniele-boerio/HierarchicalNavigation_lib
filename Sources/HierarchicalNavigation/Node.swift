public class Node: Hashable, Codable {
    private let _row : Int
    private let _column : Int
    private let _center : Point
    private let _isBoundary : Bool
    private let _isObstacle : Bool
    private let _isKeyPoint : Bool
    private var _direction : Int8
    private var _cost: Int
    private var _f_score : Int
    private var _h_score : Int
    private var _g_score : Int
    private var _parent: Node?
    
    init(row : Int, column : Int, center : Point, isBoundary : Bool, isObstacle : Bool, isKeyPoint : Bool, direction : Int8 = -1, cost: Int = 0,
         f_score : Int = -1, h_score: Int = -1, g_score : Int = -1, parent: Node? = nil) {
        self._row = row
        self._column = column
        self._center = center
        self._isBoundary = isBoundary
        self._isObstacle = isObstacle
        self._isKeyPoint = isKeyPoint
        self._direction = direction
        self._cost = cost
        self._f_score = f_score
        self._h_score = h_score
        self._g_score = g_score
        self._parent = parent
    }
    
    // Getter per ogni proprietà
    public var row : Int {
        get {
            return _row
        }
    }
    
    public var column : Int {
        get {
            return _column
        }
    }
    
    public var center : Point {
        get {
            return _center
        }
    }
    
    public var isBoundary : Bool {
        get {
            return _isBoundary
        }
    }
    
    public var isObstacle : Bool {
        get {
            return _isObstacle
        }
    }
    
    public var isKeyPoint : Bool {
        get {
            return _isKeyPoint
        }
    }
    
    public var direction : Int8 {
        get {
            return _direction
        }
        set(newValue) {
            _direction = newValue
        }
    }
    
    public var cost : Int {
        get {
            return _cost
        }
        set(newValue) {
            _cost = newValue
        }
    }
    
    public var f_score : Int {
        get {
            return _f_score
        }
        set(newValue) {
            _f_score = newValue
        }
    }
        
    public var h_score : Int {
        get {
            return _h_score
        }
        set(newValue) {
            _h_score = newValue
        }
    }
    
    public var g_score : Int {
        get {
            return _g_score
        }
        set(newValue) {
            _g_score = newValue
        }
    }
    
    public var parent : Node? {
        get {
            return _parent
        }
        set(newValue) {
            _parent = newValue
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_row)
        hasher.combine(_column)
        hasher.combine(_center)
        hasher.combine(_isBoundary)
        hasher.combine(_isObstacle)
        hasher.combine(_isKeyPoint)
        hasher.combine(_direction)
        hasher.combine(_cost)
        hasher.combine(_f_score)
        hasher.combine(_h_score)
        hasher.combine(_g_score)
        hasher.combine(_parent)
    }
    
    enum CodingKeys: String, CodingKey {
        case _row = "row"
        case _column = "column"
        case _center = "center"
        case _isBoundary = "isBoundary"
        case _isObstacle = "isObstacle"
        case _isKeyPoint = "isKeyPoint"
        case _direction = "direction"
        case _cost = "cost"
        case _f_score = "f_score"
        case _h_score = "h_score"
        case _g_score = "g_score"
        case _parent = "parent"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_row, forKey: ._row)
        try container.encode(_column, forKey: ._column)
        try container.encode(_center, forKey: ._center)
        try container.encode(_isBoundary, forKey: ._isBoundary)
        try container.encode(_isObstacle, forKey: ._isObstacle)
        try container.encode(_isKeyPoint, forKey: ._isKeyPoint)
        try container.encode(_direction, forKey: ._direction)
        try container.encode(_cost, forKey: ._cost)
        try container.encode(_f_score, forKey: ._f_score)
        try container.encode(_h_score, forKey: ._h_score)
        try container.encode(_g_score, forKey: ._g_score)
        try container.encode(_parent, forKey: ._parent)
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._row = try container.decode(Int.self, forKey: ._row)
        self._column = try container.decode(Int.self, forKey: ._column)
        self._center = try container.decode(Point.self, forKey: ._center)
        self._isBoundary = try container.decode(Bool.self, forKey: ._isBoundary)
        self._isObstacle = try container.decode(Bool.self, forKey: ._isObstacle)
        self._isKeyPoint = try container.decode(Bool.self, forKey: ._isKeyPoint)
        self._direction = try container.decode(Int8.self, forKey: ._direction)
        self._cost = try container.decode(Int.self, forKey: ._cost)
        self._f_score = try container.decode(Int.self, forKey: ._f_score)
        self._h_score = try container.decode(Int.self, forKey: ._h_score)
        self._g_score = try container.decode(Int.self, forKey: ._g_score)
        self._parent = try container.decodeIfPresent(Node.self, forKey: ._parent)
    }
}

public func < (lhs: Node, rhs: Node) -> Bool {
    return (lhs.cost + lhs.f_score) < (rhs.cost + rhs.f_score)
}

public func == (lhs: Node, rhs: Node) -> Bool {
    return lhs === rhs
}
