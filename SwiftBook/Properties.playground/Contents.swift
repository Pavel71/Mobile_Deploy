import UIKit

////////////////////// Propertes ///////////

/////////////////// Работа с экземплярами типа /////////

struct Circel {
    
    var coordinates: (x: Int, y: Int)
    var radius: Float
    // Вычеслаемые properties с помощью замыканий
    var perimetr: Float {
        
        get {
            return 3.14 * 2.0 * self.radius
        }
        
        set(newValue) {
            
            self.radius = newValue / (3.14 * 2.0)
        }
        
    }
}

var circleTest = Circel(coordinates: (0,0), radius: 10)
circleTest.perimetr
circleTest.perimetr = 31.4
circleTest.radius


/////// Observer Наблюдатели ///////////


struct Circel_2 {
    
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        
        // Это мы делаем перед установкой
        willSet(newValue) {
            
            print("Вместо старого значения \(self.radius) установим \(newValue)")
        }
        
        // Это мы делаем сразу после назначения нового значение
        didSet(oldValue) {
            
            print("Вместо старого значения \(oldValue) установим \(self.radius)")
        }
        
        
    }
    // Вычеслаемые properties с помощью замыканий
    var perimetr: Float {
        
        get {
            return 3.14 * 2.0 * self.radius
        }
        
        set(newValue) {
            
            self.radius = newValue / (3.14 * 2.0)
        }
        
    }
}

//var circel_Test_2 = Circel_2(coordinates: (x:0,y:0), radius: 15.0)
//circel_Test_2.radius = 10


///////////// Свойства типа ///////////

struct SomeStructure {
    
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1 }
}

SomeStructure.storedTypeProperty

class SomeClass{
    static var storedTypeProperty = "Some value."
    
    static var computedTypeProperty: Int {
        return 3
    }
    
    // Это свойвство нужно чтобы его мог использовать подкласс
    class var overrideableComputedTypeProperty: Int {
        return 4
    }
}


struct AudioChannel {
    
    // type stored property
    static var maxVolume = 5
    
    //Storedproperty - хранит какое то значение
    var volume: Int {
        
        didSet {
            if volume > AudioChannel.maxVolume {
                volume = AudioChannel.maxVolume
            }
        }
    }
}

var LeftChannel = AudioChannel(volume: 2)

var RightChannel = AudioChannel(volume: 3)

RightChannel.volume = 6
RightChannel.volume

AudioChannel.maxVolume = 10
RightChannel.volume = 6
RightChannel.volume
