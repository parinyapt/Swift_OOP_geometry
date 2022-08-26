//
//  main.swift
//  assignment1-oop-geometry
//
//  Created by Parinya Termkasipanich on 25/8/2565 BE.
//

import Foundation

var menu_select:Int = 0
var use_status:Bool = true

var temp_status:Bool = false
var temp_text:String = ""

var temp_return_status:Bool = false
var temp_return_value:Float = 0

var inputValue:[String:Float] = [
    "Radius":0,
    "Length":0,
    "Width":0,
    "Base":0,
    "Height":0,
    "EdgeLength":0
]
var suggestInputValue:[String:String] = [
    "Radius":"For: Circle",
    "Length":"For: Rectangle",
    "Width":"For: Rectangle",
    "Base":"For: Triangle",
    "Height":"For: Triangle",
    "EdgeLength":"For: Square"
]

var geometry = Geometry()

repeat{
  print("""
  == Menu ==
  1 > Input Value
  2 > Reset Value
  3 > Calcurate Geometry
  4 > Exit
  """)
  repeat {
    temp_status = false
    print("Enter menu : ",terminator: "")
    temp_text = readLine()!
    if Int(temp_text) != nil && temp_text != "" {
      menu_select = Int(temp_text)!
      temp_status = true
    }
  }while(temp_status == false)
    
    if(menu_select == 1) {
        for (key,_) in inputValue {
            repeat {
                temp_status = false
                print("Enter \(key) (\(suggestInputValue[key]!)) or 0 if don't want to calculate this geometry : ",terminator: "")
                temp_text = readLine()!
                if Float(temp_text) != nil && Float(temp_text)! >= 0 {
                    inputValue[key] = Float(temp_text)!
                    temp_status = true
                }
            }while(temp_status == false)
        }
        geometry.Init(radiusIN: inputValue["Radius"]!, lengthIN: inputValue["Length"]!, widthIN: inputValue["Width"]!, baseIN: inputValue["Base"]!, heightIN: inputValue["Height"]!, edgeLengthIN: inputValue["EdgeLength"]!)
        print("Input Value Success")
    }else if(menu_select == 2){
        geometry.Init(radiusIN: 0, lengthIN: 0, widthIN: 0, baseIN: 0, heightIN: 0, edgeLengthIN: 0)
        print("Reset Value Success")
    }else if(menu_select == 3){
        (temp_return_status,temp_return_value) = geometry.Circle()
        if temp_return_status == true {
            print("Area of Circle is : \(temp_return_value)")
        }else{
            print("Area of Circle is : Can't calculate because radius value is 0")
        }
        
        (temp_return_status,temp_return_value) = geometry.Triangle()
        if temp_return_status == true {
            print("Area of Triangle is : \(temp_return_value)")
        }else{
            print("Area of Triangle is : Can't calculate because base or height value is 0")
        }
        
        (temp_return_status,temp_return_value) = geometry.Rectangle()
        if temp_return_status == true {
            print("Area of Rectangle is : \(temp_return_value)")
        }else{
            print("Area of Rectangle is : Can't calculate because width or length value is 0")
        }
        
        (temp_return_status,temp_return_value) = geometry.Square()
        if temp_return_status == true {
            print("Area of Square is : \(temp_return_value)")
        }else{
            print("Area of Square is : Can't calculate because edge length value is 0")
        }

    }else if(menu_select == 4){
        use_status = false
    }else{
        print("Menu not found!")
    }
}while(use_status != false)

