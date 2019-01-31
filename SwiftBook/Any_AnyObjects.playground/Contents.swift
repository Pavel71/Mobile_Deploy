import UIKit

////////////// ANY ////////////


var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })


for thing in things {

    switch thing {
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Troll"))
    default:
        print("something else")
    }

}

let someObjects: [AnyObject] = [Dog(),NoisyDog(),Dog()]

for object in someObjects {
    
    _ = object as! Dog
    print("This is bad Dog")
    
}

for object in someObjects as! [Dog]{
    print("This is bad Dog")
}

