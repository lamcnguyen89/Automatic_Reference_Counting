//
//  main.swift
//  Automatic_Reference_Counting
//
//  Created by M_2022814 on 12/17/21.
//

import Foundation

// MARK: - Automatic Reference Counting
// ARC isused to track and manage your app's memory usage.
// Put simply it works by counting the number of active references to variables and constants in your code. When the number of references to the variable/constant reaches zero, Swift removes it from memory.
// If there is an issue with ARC, a memory leak occurs. Symptoms of memory leak are gradual reductions in system performance due to insufficient available memory. Eventually the application may crash because of a lack of memory

// MARK: - Strong Reference
// Everytime you create a new instance of a class, ARC allocates a chunk of memory to store info about that instance. This memory holds info about the type of the instance, together with the values of any stored properties associated with that instance.
// When you assign a class instance to a property, constant or variable, a strong reference is created.
// The more references are made to that class instance, the higher the count of references to that class instance.


// MARK: - Strong Reference Cycles
// Occurs when two classes refer to each other in a strong reference. Therefore neither can be released from memory and a memory leak occurs.
// To solve this issue, you specify a weak reference in one of the referring classes:

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being initialized,")}
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit}
    weak var tenant: Person? // Create a weak reference
    deinit { print("Apartment \(unit) is being deinitialized")}
}

// MARK: - Unowned Optional References
// You can mark an optional reference to a class as unowned. In terms of the ARC ownership model, an unowned optional reference and a weak reference can both be used in the same contexts.
// The difference is that when you use an unowned optional reference, you're responsible for making sure it always refers to a valid object or is set to nil

class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}

// MARK: - Unowned References and Implicitly Unwrapped Optional Properties

// MARK: - Strong Reference Cycles for Closures

// MARK: - Resolving Strong Reference Cycles for Closures
