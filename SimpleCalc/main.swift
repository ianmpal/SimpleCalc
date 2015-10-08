//
//  main.swift
//  SimpleCalc
//
//  Created by Ian Palmgren on 10/7/15.
//  Copyright © 2015 Ian Palmgren. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

func count(input: [String]) -> Int {
    return (input.count)
}

func avg(input: [String]) -> Double {
    var total: Double = 0
    var count: Double = 0
    for number in input {
        total += Double(convert(number))
        count++
    }
    return total / count
}

func fact(input: [String]) -> Int {
    var inputNum = convert(input[0])
    var result = 1
    while (inputNum > 0) {
        result = result * inputNum
        inputNum--
    }
    return result
}

var keepCalculating = true
print("Welcome to SimpleCalc! Enter a number, followed by the enter key to perform a + - / * or % operation \n" + "\n")

while keepCalculating {

    let input1 = input()
    var textArray = input1.characters.split{$0 == " "}.map(String.init)
    let lastIndex: String = textArray[textArray.count-1].lowercaseString

    if lastIndex.rangeOfString("count") != nil || lastIndex.rangeOfString("fact") != nil || lastIndex.rangeOfString("avg") != nil {
        
        textArray.removeAtIndex(textArray.count-1)
        if input1.lowercaseString.rangeOfString("count") != nil {
            print("There are \(count(textArray)) numbers in that string")
        } else if input1.lowercaseString.rangeOfString("avg") != nil {
            print("The average is: \(avg(textArray))")
        } else if input1.lowercaseString.rangeOfString("fact") != nil {
            if textArray.count == 1 {
                print("The factorial of \(textArray[0]) is: \(fact(textArray))")
            } else {
                print("A factorial operation can only take in one number at a time. Pleas try again.")
            }
        }
        
    } else {
        let num1 = convert(input1)
        
        print("Enter an operation")
        let operation = input()
        
        print("Enter a number")
        let num2 = convert(input())
        
        var result = 0
        var resultDouble: Double = 0
        
        if operation == "+" {
            result = num1 + num2
        } else if operation == "-" {
            result = num1 - num2
        } else if operation == "/" {
            resultDouble = Double(num1)/Double(num2)
        } else if operation == "*" {
            result = num1*num2
        } else if operation == "%" {
            result = num1%num2
        }
        
        //print(resultDouble)
        
        if operation == "/" {
            print("The result of \(num1) \(operation) \(num2) =  \(resultDouble)")
        } else {
            print("The result of \(num1) \(operation) \(num2) =  \(result)")
        }

    }

    print("\n" + "Would you like to perform another calculation? Pleas enter \"yes\" or \"no\"")
    if input().lowercaseString.rangeOfString("no") != nil {
        keepCalculating = false
    }

    ///END CODE

}






/* println("")
print("Would you like to do another calculation?")
let ans

if string.lowercaseString.rangeOfString("swift") != nil {
    println("exists")
}
*/