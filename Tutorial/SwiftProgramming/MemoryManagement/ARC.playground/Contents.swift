import UIKit
/* ARC:
 Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance. This memory holds information about the type of the instance, together with the values of any stored properties associated with that instance.

Additionally, when an instance is no longer needed, ARC frees up the memory used by that instance so that the memory can be used for other purposes instead. This ensures that class instances don’t take up space in memory when they’re no longer needed.
         
 
 */

class Person{
    
    var name:String
    var car:Car?
    
    init(name:String){
        debugPrint("\(name):Person init called")
        self.name = name
    }
    
    func sayHello() -> String{
        return "Hello, my name is \(name)."
    }
    
    deinit {
        debugPrint("\(name): Person deinit called")
    }
    
}


//Example 1
// 1 == 1 to trick compiler that object inside that will no longer use able. Here deinit is called.
if 1 == 1 {
    var person = Person(name: "John")
}


//Example 2
 var persion1: Person?
var persion2: Person?


// Here dinit never called because object's are still in use
if 1 == 1 {
    var person = Person(name: "Amit")
    persion1 = person
    persion2 = person
    person.sayHello()
}

persion1 = nil // still dinit never call because persion2 is still using it.
persion2 = nil // Finalley dinit called because no one is using it.




//Example 3  - Retain cycle

class Car {
    var name: String?
    var owner: Person?
    
    init(name: String) {
        self.name = name
        debugPrint("\(name): Car init called")
    }
    
    deinit {
        debugPrint("\(name ?? ""): Car deinit called")
    }
}




if 1 == 1 {
    // deinit will be called
    let car = Car(name: "Toyota Corolla")
    let person = Person(name: "Raj")
    person.car = car
    //-----------------
    // deinit will not be called becaue both objects are pointing to each other. And to solve this we mush use weak keyword while decleare class instance var
  //  car.owner = person
}



// Use of weak, unowned and stronge
