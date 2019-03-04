//
//  RTTuple.swift
//  RayTracerChallenge
//
//  Created by Raymond Farnham on 3/3/19.
//  Copyright © 2019 Raymond Farnham. All rights reserved.
//

import Foundation

typealias RTTuple = (x: Double, y: Double, z: Double, w: Double)

func +(left: RTTuple, right: RTTuple) -> RTTuple { // 1
    return (
        left.x + right.x,
        left.y + right.y,
        left.z + right.z,
        left.w + right.w
    )
}

func -(left: RTTuple, right: RTTuple) -> RTTuple { // 1
    return (
        left.x - right.x,
        left.y - right.y,
        left.z - right.z,
        left.w - right.w
    )
}

prefix func -(a: RTTuple) -> RTTuple {
    return rttuple(-a.x, -a.y, -a.z, -a.w)
}

func *(a: RTTuple, s: Double) -> RTTuple {
    return (
        a.x * s,
        a.y * s,
        a.z * s,
        a.w * s
    )
}

func *(s: Double, a: RTTuple) -> RTTuple {
    return a * s
}

func /(a: RTTuple, s: Double) -> RTTuple {
    return (
        a.x / s,
        a.y / s,
        a.z / s,
        a.w / s
    )
}

func ==(left: RTTuple, _ right: RTTuple) -> Bool {
    return left.x.isEqual(to: right.x)
        && left.y.isEqual(to: right.y)
        && left.z.isEqual(to: right.z)
        && left.w.isEqual(to: right.w)
}

func magnitude(_ t: RTTuple) -> Double {
    return sqrt(pow(t.x, 2) + pow(t.y, 2) + pow(t.z, 2) + pow(t.w, 2))
}

func isVector(_ t: RTTuple) -> Bool {
    return t.w.isEqual(to: 0)
}

func isPoint(_ t: RTTuple) -> Bool {
    return t.w.isEqual(to: 1)
}

func rttuple(_ x: Double, _ y: Double, _ z: Double, _ w: Double) -> RTTuple {
    return (x, y, z, w)
}


func point(_ x: Double, _ y: Double, _ z: Double) -> RTTuple {
    return (x, y, z, 1)
}

func vector(_ x: Double, _ y: Double, _ z: Double) -> RTTuple {
    return (x, y, z, 0)
}

