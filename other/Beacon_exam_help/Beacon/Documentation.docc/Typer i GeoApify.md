1️⃣ Point
type: "Point"
coordinates: [lon, lat]
Eksempel: [10.75, 59.91]

2️⃣ MultiPoint
type: "MultiPoint"
coordinates: [[lon, lat], [lon, lat], ...]
Eksempel: [[10.75, 59.91], [11.00, 60.00]]

3️⃣ LineString
type: "LineString"
coordinates: [[lon, lat], [lon, lat], ...]
Eksempel: [[10.75, 59.91], [10.80, 59.95], [10.85, 59.97]]

4️⃣ MultiLineString
type: "MultiLineString"
coordinates: [
    [[lon, lat], [lon, lat], ...],
    [[lon, lat], [lon, lat], ...]
]
Eksempel: [
    [[10.75, 59.91], [10.80, 59.95]],
    [[11.00, 60.00], [11.05, 60.05]]
]

5️⃣ Polygon
type: "Polygon"
coordinates: [
    [[lon, lat], [lon, lat], [lon, lat], [lon, lat]]  // ytre ring
    , [[lon, lat], [lon, lat], [lon, lat]]            // evt. indre hull
]
Eksempel: [
    [[10, 59], [11, 59], [11, 60], [10, 60], [10, 59]]  // ytre ring
]

6️⃣ MultiPolygon
type: "MultiPolygon"
coordinates: [
    [ [[lon, lat], ...], [[lon, lat], ...] ], // første polygon (ytre + hull)
    [ [[lon, lat], ...] ]                     // andre polygon
]
Eksempel: [
    [ [[10,59],[11,59],[11,60],[10,60],[10,59]] ],
    [ [[12,58],[13,58],[13,59],[12,59],[12,58]] ]
]

7️⃣ GeometryCollection
type: "GeometryCollection"
geometries: [ {type: "Point", coordinates: [...]}, {type: "LineString", coordinates: [...]} ]
