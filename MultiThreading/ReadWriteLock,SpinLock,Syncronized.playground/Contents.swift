import Foundation

var str = "Также несколько блокировок"

class ReadWriteLock {
  
  private var lock = pthread_rwlock_t()
  private var attribute = pthread_rwlockattr_t()
  
  // Наша критическая секция которая будет записыватся о считыватся безопасно
  private var globalProperty: Int = 0
  
  init() {
    
    pthread_rwlock_init(&lock, &attribute)
  }
  var workproperty: Int {
    
    get {
      // Блокировка на запись По идеии нужно делать на чтение
      pthread_rwlock_rdlock(&lock)
      // Безопасная секция
      let temp = globalProperty
      
      pthread_rwlock_unlock(&lock)
      return temp
    }
    
    set {
      // Блокировка на запись
      pthread_rwlock_wrlock(&lock)
      // Безопасная секция
      globalProperty = newValue
      pthread_rwlock_unlock(&lock)
      
    }
    
  } // workProperty
  
}

// DEPricated

//class SpinLock {
//
//  private var lock = OS_SPINLOCK_INIT
//
//
//}

class UnfairLock {
  
  private var lock = os_unfair_lock_s()
  
  var array = [Int]()
  
  func some() {
    os_unfair_lock_lock(&lock)
    array.append(1)
    os_unfair_lock_unlock(&lock)
  }
}

// Блокировка!
class SynchronizedObjc {
  
  private let lock = NSObject()
  
  var array = [Int]()
  
  func some() {
    
    objc_sync_enter(lock)
    
    array.append(1)
    
    objc_sync_exit(lock)
  }
}



