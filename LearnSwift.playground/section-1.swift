//
//  main.swift
//  LearnSwift
//
//  Created by bingoogol on 14-6-5.
//  Copyright (c) 2014年 bingoogol. All rights reserved.
//

import Foundation

// 字符串
func demo1() {
    var name = "王浩"
    name = name + "bingo"
    name = name + "\(100)"
    var id = 50
    var address:String = "重庆市"
    println("id=\(id),name=\(name),address=\(address)")
}


// 类型
func demo2() {
    let minIntValue = Int.min
    let maxIntValue = Int.max
    let minInt8Value = Int8.min
    let maxInt8Value = Int8.max
    let minUInt8Value = UInt8.min
    let maxUInt8Value = UInt8.max
    println("minIntValue=\(minIntValue),maxIntValue=\(maxIntValue)")
    println("minInt8Value=\(minInt8Value),maxInt8Value=\(maxInt8Value)")
    println("minUInt8Value=\(minUInt8Value),maxUInt8Value=\(maxUInt8Value)")
    
    let value1 = 12_000_000  // 只是为了可读性
    let value2 = 1_000_000.000_000_1
    println("value1=\(value1),value2=\(value2)")
    
    
    let value3:Float = 1.3
    let value4:Double = 1.3
    let value5 = 1.3
    println("value3=\(value3),value4=\(value4),value5=\(value5)")
}

func add(num1:Int,num2:Int)->(Int,Int,Int) {
    var result = num1 + num2
    return (num1,num2,result)
}

// 多返回值
func demo3() {
    let (num1,num2,result) = add(2, 3)
    println("\(num1) + \(num2) = \(result)")
}

func sayHello(name:String) {
    println("Hello \(name)")
}

// 函数也是一个对象，意味着可以直接当做一个变量来使用
func demo4() {
    var fun = sayHello
    fun("王浩")
}

// 数组
func demo5() {
    var arr1 = ["Hello","World",5]
    println(arr1)
    println(arr1[2])
    
    var arr2 = [] // 存放任意数据类型
    
    var arr3 = [String]() // 只能存放特定类型
    arr3.append("Hello")
    arr3.append("Swift")
    
    println(arr3)
}

// 字典
func demo6() {
    var dict = ["name":"王浩","address":"重庆市"]
    dict["sex"] = "男"
    
    println(dict)
    println(dict["name"])
    
    var dict2:Dictionary<String,Int> = ["name":1,"address":2,"hehe":3,"sdfsdf":4]
    if dict2.removeValueForKey("name") != nil {
        println("删除了")
    } else {
        println("没删除")
    }
    println(dict2.count)
    
    for key in dict2.keys {
        println(key)
    }
    
    for value in dict2.values {
        println(value)
    }
    
    let keys = Array(dict2.keys)
    println(keys)
    let values = Array(dict2.values)
    println(values)
}

// 循环
func demo7() {
    var arr1 = [String]()
    // 包含0，不包含5
    for index in 0...5 {
        arr1.append("Item \(index)")
    }
    println(arr1)
    
    
    for value in arr1 {
        println(value)
    }
    
    
    for (index, value) in enumerate(arr1) {
        println("enumerate index\(index),\(value)")
    }
    
    var i = 0
    while i<arr1.count {
        println(arr1[i])
        i++
    }
    
    var dict = ["name":"王浩","address":"重庆市"]
    
    for (key,value) in dict {
        println("key=\(key),value=\(value)")
    }
}

// 流程控制，可选变量
func demo8() {
    for index in 0 ... 5 {
        if index%2 == 0 {
            println(index)
        }
    }
    
    var name:String? = "bingoogol"
    //name = nil
    if var name2 = name {
        println(name2)
    }
    
    if name != nil {
        println(name)
    }
}

class Animal {
    func sayHi() {
        println("Hi bingoogol")
    }
    
    func sayClassName() {
        println("Animal")
    }
}

class Cat : Animal {
    
    var _name:String
    
    init(name:String) {
        self._name = name
    }
    
    override func sayClassName() {
        println("Cat")
    }
    
    func sayName() {
        println(self._name)
    }
}


func demo9() {
    var animal = Animal()
    animal.sayHi()
    animal.sayClassName()
    
    var cat = Cat(name: "加菲猫")
    cat.sayHi()
    cat.sayClassName()
    cat.sayName()
}

//(num:Int) -> Bool 闭包Closure参数类型
func hasClosureMath(arr:[Int],value:Int,cb:(num:Int,value:Int) -> Bool) ->Bool{
    for item in arr {
        if cb(num:item,value:value) {
            return true
        }
    }
    return false
}



//闭包
func demo10() {
    var arr = [20,9,100,34,89,39]
    // 找是否arr中有比110大的数字
    var v1 = hasClosureMath(arr,110,{
            (num:Int,value:Int) -> Bool in
                return num >= value
            //这里$0表示num   $1表示value
            //return $0 >= $1
        })
    println("v1 is \(v1)")
}

struct QFTest {
    var x = 0;
    var y = 0;
    
    // 真正的构造函数
    // 定义一个空的够着函数，构造函数是以init开头的，自动调用
    init() {
        println("init invoked")
    }
    
    //定义带有两个参数的构造函数
    init(x:Int,y:Int) {
        self.x = x
        self.y = y
        println("init(x:Int,y:Int) invoked")
    }
    
    // _ 这个可以让调用哪个的时候不用谢 x:  y:
    init(_ x:Int,_ y:Int) {
        self.x = x
        self.y = y
        println("init(x:Int,y:Int) invoked")
    }
    
    func getCenter() -> Int {
        return (x + y)/2
    }
    
    // 载调用的时候 xxx.addOffset(100,deltaY:100)，不需要写deltaX
    mutating func addOffset(deltaX:Int,deltaY:Int) {
        // 结构体是一个拷贝的对象，默认是不能修改结构体内部的变量，加上mutating可以让函数修改结构体里面变量的值
        self.x += deltaX
        self.y += deltaY
    }
}

func demo11() {
    var s1 = QFTest(x:100,y:200)
    println("x:\(s1.x)  y:\(s1.y)")
    var s2 = QFTest()
    s2.x = 400
    s2.y = 300
    s2.addOffset(100,deltaY:100)
    println("x:\(s1.x)  y:\(s1.y)  center:\(s2.getCenter())")
}

// NSMutableArray练习
func demo12() {
    var arr = NSMutableArray(capacity: 4)
    arr.addObject(1)
    arr.addObject(2)
    arr.addObject(3)
    arr.addObject(4)
    
    arr.removeObjectAtIndex(1)
    
    arr.insertObject(5, atIndex: 2)
    
    arr.exchangeObjectAtIndex(0,withObjectAtIndex:2)
}

// 数组排序
func demo13() {
    var arrays:NSMutableArray=NSMutableArray()
    //增加数据
    arrays.addObject("1")
    arrays.addObject("2")
    arrays.addObject("3")
   // arc4random_uniform(2)
    /*
    arrays.sortUsingComparator({
        (s1:AnyObject!,s2:AnyObject!) -> NSComparisonResult in
            var str1=s1 as String
            var str2=s2 as String
            if str1>str2{
                return NSComparisonResult.OrderedAscending
            }else{
                return NSComparisonResult.OrderedDescending
            }
    })
    */
    /*
    arrays.sortUsingComparator({ s1, s2 in
            var str1=s1 as String
            var str2=s2 as String
            if str1 > str2 {
                return NSComparisonResult.OrderedAscending
            }else{
                return NSComparisonResult.OrderedDescending
            }
        })
    */
    arrays.sortUsingComparator({
        var str1=$0 as String
        var str2=$1 as String
        println("str1 = \(str1) str2 = \(str2)")
        if str1 > str2 {
            return NSComparisonResult.OrderedAscending
        }else{
            return NSComparisonResult.OrderedDescending
        }
        })
    println(arrays)
    
    var array:NSArray = [3,4,2,1]
    // 3,4,2,1
    // 3,4,1,2
    // 3,1,2,4
    // 1,2,3,4
    array.sortedArrayUsingComparator({p1, p2 in
            var pp1 = p1 as Int
            var pp2 = p2 as Int
            println("pp1 = \(pp1) pp2 = \(pp2)")
            if pp1 > pp2 {
                return NSComparisonResult.OrderedAscending
            }else{
                return NSComparisonResult.OrderedDescending
            }
        })
    println(array)
}
////////////////////////////////////////////////////////////////////////////////////////
func getLengthAndWidth(p0:(x:Double,y:Double),p1:(x:Double,y:Double)) -> (length:Double,width:Double) {
    return (abs(p0.y - p1.y),abs(p0.x - p1.x))
}
//元组作为参数的函数
func demo14() {
    let p0:(x:Double,y:Double) = (0,0)
    let p1:(x:Double,y:Double) = (6,6)
    let w = getLengthAndWidth(p0,p1).width
    let len = getLengthAndWidth(p0,p1).length
    println("w=\(w) len=\(len)")
}
////////////////////////////////////////////////////////////////////////////////////////
//外部参数和内部参数相等
func method1(#p1:Double,#p2:Double) {
    println("p1=\(p1) p2=\(p2)")
}
//外部参数和内部参数不相等，method2等价于method1
func method2(p1 rp1:Double,p2 rp2:Double) {
    println("rp1=\(rp1) rp2=\(rp2)")
}
//第一个参数有外部参数，第二个没有外部参数
func method3(p1 rp1:Double,rp2:Double) {
    println("rp1=\(rp1) rp2=\(rp2)")
}
//第一个参数没有外部参数，第二个参数有外部参数
func method4(rp1:Double,p2 rp2:Double) {
    println("rp1=\(rp1) rp2=\(rp2)")
}
func demo15() {
    method1(p1: 1, p2:2)
    method2(p1:1,p2:2)
    method3(p1:1,2)
    method4(1,p2:2)
}
////////////////////////////////////////////////////////////////////////////////////////
//函数的默认参数
func joinString(s1:String,toString s2:String,joiner s3:String = "?") {
    println(s1 + s3 + s2)
}
//带有默认参数的参数会自动加上外部参数，相当于自动加了一个#号,在调用的时候必须加上外部参数
//在最新版本的swift中，默认参数可以出现在参数的任意位置
func joinString2(s1:String,toString s2:String,joiner:String = "?") {
    println(s1 + joiner + s2)
}
func demo16() {
    joinString("hello",toString:"world")
    joinString("hello",toString:"world",joiner:"#")
    
    joinString2("hello",toString:"world")
    joinString2("hello",toString:"world",joiner:"#")
}
////////////////////////////////////////////////////////////////////////////////////////
//常量函数和变量函数，默认是常量函数let，参数前面加上var就变成变量函数
//即使这时候是变量函数，但实际上是值传递，只是函数内部可以修改可变参数的值，不可以修改常量参数的值
func params1(var a:Int,b:Int) {
    let t = a
    a = b
    // 错误写法，常量函数不能被修改
    //b = t
}
////////////////////////////////////////////////////////////////////////////////////////
// 输入输出函数
func params2(inout a:Int,inout b:Int) {
    let t = a
    a = b
    b = t
}
func demo17() {
    var x = 10
    var y = 19
    params2(&x,&y)
    println("\(x),\(y)")
}
////////////////////////////////////////////////////////////////////////////////////////
//变参函数,必须放在最末尾
func add(a1:Int,array:Int...) -> Int {
    var sum = a1
    for i in array {
        sum += i
    }
    return sum
}
func demo18() {
    println(add(1,2,3,4,5))
}
////////////////////////////////////////////////////////////////////////////////////////
func type1(a:Int, b:Int) -> Int {
    return a+b
}
func type2(a:Int, b:Int) -> Int {
    return a-b
}
//函数作为参数
func typeTest(a:Int,b:Int,#op:(Int,Int) -> Int) -> Int {
    return op(a,b)
}

func testMax(a:Int,b:Int) -> Int {
    return a > b ? a : b
}
func testMin(a:Int,b:Int) -> Int {
    return a < b ? a : b
}
// 函数作为返回值
func chooseFunc(#getMax:Bool) -> (Int,Int) -> Int {
    return getMax ? testMax : testMin
}
// 函数类型
func demo19() {
    // (Int,Int) -> Int
    var callFunc:(Int,Int) -> Int = type2
    println(callFunc(5,3))
    
    println(typeTest(8,2,op:type1))
    println(typeTest(8,2,type2))
    
    var myFunc:(Int,Int) -> Int = chooseFunc(getMax:false)
    println(myFunc(50,100))
}
////////////////////////////////////////////////////////////////////////////////////////
func fa(a:Int,b:Int) -> Int {
    return a + b
}
// 闭包无函数名，闭包有传入、传出，in间隔传入传出的语句块
// 没有函数名的语句块。相当于将函数的形参部分(a:Int,b:Int)和返回类型部分 -> Int写到花括号中，并用in隔开
var fb = {(a:Int,b:Int) -> Int in
    return a + b
}
// 第一个参数可以放函数，也可以放闭包
func ffb(f:(Int,Int) -> Int,x:Int,y:Int) {
    println(f(x,y))
}
func demo20() {
    ffb(fa,5,10)
    ffb(fb,10,20)
    ffb({(a:Int,b:Int) -> Int in
        return a + b
        },30,40)
    //简化1：类型推断，去掉传入传出类型，简化闭包
    ffb({a,b in
        return a + b
        },50,60)
    //简化2：单语句闭包，如果闭包语句体里只有return语句，return关键字可以不写
    ffb({a,b in
        a + b
        },70,80)
    //简化3：参数名简化，位置替换参数，$0表示第一个参数，$1表示第二个参数
    ffb({
        $0 + $1
        },90,100)
}
////////////////////////////////////////////////////////////////////////////////////////
//闭包练习1，交换两个数的值
func fswap(fs:(Int,Int) -> (Int,Int),x:Int,y:Int) {
    var t = fs(x,y)
    println("swapResult is \(t)")
}
func demo21() {
    var fcl1 = {(var a:Int,var b:Int) -> (Int,Int) in
        var t = a
        a = b
        b = t
        return (a,b)
    }
    fswap(fcl1,11,12)
    // 简化后的闭包
    fswap({($1,$0)},13,14)
}
////////////////////////////////////////////////////////////////////////////////////////
//闭包练习2 filter,map,sort的使用
var fx = 1
func fil(y:Int) -> Bool {
    if fx == y {
        return true
    } else {
        return false
    }
}

func fmap(t : Int) -> Int {
    return t + 101
}

func fsort(p1:Int,p2:Int) -> Bool {
    return p1 > p2
}
func demo22() {
    var a:Array<Int> = [1,9,4,1,8,4,7,3,1,1]
    var aa = a.filter(fil)
    println(aa)
    
    var bb = a.filter({$0 == fx})
    println(bb)
    
    var cc = a.map(fmap)
    println(cc)
    
    var dd = a.map({$0 + 11})
    println(dd)
    
    //a.sort(fsort)
    println(a)
    
    //a.sort({$0 > $1})
    println(a)
    
    /*
    protocol Comparable : Equatable {
        func <=(lhs: Self, rhs: Self) -> Bool
        func >=(lhs: Self, rhs: Self) -> Bool
        func >(lhs: Self, rhs: Self) -> Bool
    }
    */
    // 应该不算闭包吧？
    a.sort(>)
    println(a)
}
////////////////////////////////////////////////////////////////////////////////////////

// TODO 谓词练习
func demo23() {
    var predicate:NSPredicate = NSPredicate(format: "self CONTAINS 'o'")!
    var text = "hello"
    println(predicate.evaluateWithObject(text))
}
demo23()






