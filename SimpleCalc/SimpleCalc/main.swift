//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let eqOperator : String
        if Int(args[args.count-1]) != nil{
            eqOperator = args[args.count-2]
        }
        else {
            eqOperator = args[args.count-1]
        }

        let firstInt : Int! = Int(args[0])
        let secondInt : Int! = Int(args[2])

        switch eqOperator {
            case "count":
                if args.count>2 {
                    return args.count - 1
                }
                else {
                    return 0
                }
            case "avg":
                var count = args.count
                var total : Int = 0
                if count > 2 {
                    for x in 0...count-2 {
                        let int : Int! = Int(args[x])
                        total += int
                    }
                    return Int(total/(count-1))
                }
                else {
                    return 0
                }
            case "fact":
                var count = args.count;
                if count<=1 {
                    return 0
                }
                else if (args[0] == "1" || args[0] == "0") {
                    return 1 
                } // first num
                else {
                    var prod : Int! = Int(args[0])
                    var n = abs(prod)
                    for x in stride(from: n-1, to: 1, by: -1) {
                        n *= x
                    }
                    if prod > 0 {
                        return n
                    }
                    else {
                        return n * -1
                    }
                }
            case "+":
                return firstInt + secondInt
            case "-":
                return firstInt - secondInt
            case "%":
                return (firstInt % secondInt + secondInt) % secondInt
            case "/":
                return firstInt / secondInt
            case "*":
                return firstInt * secondInt
            default: 
                print("An error has ocurred with the calculator.")
        }
        return 0;
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

