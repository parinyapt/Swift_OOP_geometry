//
//  Geometry.swift
//  assignment1-oop-geometry
//
//  Created by Parinya Termkasipanich on 25/8/2565 BE.
//

import Cocoa

class Geometry: NSObject {
    var radius:Float = 0
    var length:Float = 0
    var width:Float = 0
    var base:Float = 0
    var height:Float = 0
    var edgeLength:Float = 0
    
    func Init(radiusIN:Float,lengthIN:Float,widthIN:Float,baseIN:Float,heightIN:Float,edgeLengthIN:Float) {
        radius = radiusIN
        length = lengthIN
        width = widthIN
        base = baseIN
        height = heightIN
        edgeLength = edgeLengthIN
    }
    
    // วงกลม = area = พาย * radius * radius
    func Circle() -> (Bool,Float) {
        return (radius > 0 ? (true, Float.pi*radius*radius) : (false, 0))
    }
    
    // สามเหลี่ยม = 1/2 x ฐาน x สูง
    func Triangle() -> (Bool,Float) {
        return (base > 0 && height > 0 ? (true, (base*height)/2) : (false, 0))
    }
    
    // สี่เหลี่ยมผืนผ้า = กว้าง x ยาว
    func Rectangle() -> (Bool,Float) {
        return (width > 0 && length > 0 ? (true, width*length) : (false, 0))
    }
    
    // สี่เหลี่ยมจัตุรัส = ด้าน x ด้าน
    func Square() -> (Bool,Float) {
        return (edgeLength > 0 ? (true, edgeLength*edgeLength) : (false, 0))
    }
    
    //สี่เหลี่ยมด้านขนาน = ฐาน x สูง
    func Parallelogram() -> (Bool,Float) {
        return (base > 0 && height > 0 ? (true, base*height) : (false, 0))
    }
}
