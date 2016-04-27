import Foundation

struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

// 为了能够在实例方法中修改属性值，可以在方法定义前添加关键字 mutating
struct Point {
    var x = 0, y = 0
    
    mutating func moveXBy(x:Int,yBy y:Int) {
        self.x += x
        self.y += y
    }
}
var p = Point(x: 5, y: 5)
p.moveXBy(3, yBy: 3)

//另外，在值类型的实例方法中，也可以直接修改self属性值。
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()


class Animal {
    func sayHi() {
        print("Hi bingoogol")
    }
    
    func sayClassName() {
        print("Animal")
    }
}

class Cat : Animal {
    
    var _name:String
    
    init(name:String) {
        self._name = name
    }
    
    override func sayClassName() {
        print("Cat")
    }
    
    func sayName() {
        print(self._name)
    }
}


func demo9() {
    let animal = Animal()
    animal.sayHi()
    animal.sayClassName()
    
    let cat = Cat(name: "加菲猫")
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
    let arr = [20,9,100,34,89,39]
    // 找是否arr中有比110大的数字
    let v1 = hasClosureMath(arr,value: 110,cb: {
        (num:Int,value:Int) -> Bool in
        return num >= value
        //这里$0表示num   $1表示value
        //return $0 >= $1
    })
    print("v1 is \(v1)")
}


 struct QFTest {
 var x = 0;
 var y = 0;
 
 // 真正的构造函数
 // 定义一个空的够着函数，构造函数是以init开头的，自动调用
 init() {
    print("init invoked")
 }
 
 //定义带有两个参数的构造函数
 init(x:Int,y:Int) {
    self.x = x
    self.y = y
    print("init(x:Int,y:Int) invoked")
 }
 
 // _ 这个可以让调用哪个的时候不用谢 x:  y:
 init(_ x:Int,_ y:Int) {
    self.x = x
    self.y = y
    print("init(x:Int,y:Int) invoked")
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
 let s1 = QFTest(x:100,y:200)
 print("x:\(s1.x)  y:\(s1.y)")
 var s2 = QFTest()
 s2.x = 400
 s2.y = 300
 s2.addOffset(100,deltaY:100)
 print("x:\(s1.x)  y:\(s1.y)  center:\(s2.getCenter())")
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
 let arrays:NSMutableArray=NSMutableArray()
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
 let str1=$0 as! String
 let str2=$1 as! String
 print("str1 = \(str1) str2 = \(str2)")
 if str1 > str2 {
 return NSComparisonResult.OrderedAscending
 }else{
 return NSComparisonResult.OrderedDescending
 }
 })
 print(arrays)
 
 let array:NSArray = [3,4,2,1]
 // 3,4,2,1
 // 3,4,1,2
 // 3,1,2,4
 // 1,2,3,4
 array.sortedArrayUsingComparator({p1, p2 in
 let pp1 = p1 as! Int
 let pp2 = p2 as! Int
 print("pp1 = \(pp1) pp2 = \(pp2)")
 if pp1 > pp2 {
 return NSComparisonResult.OrderedAscending
 }else{
 return NSComparisonResult.OrderedDescending
 }
 })
 print(array)
 }
 ////////////////////////////////////////////////////////////////////////////////////////
 func getLengthAndWidth(p0:(x:Double,y:Double),p1:(x:Double,y:Double)) -> (length:Double,width:Double) {
 return (abs(p0.y - p1.y),abs(p0.x - p1.x))
 }


 //元组作为参数的函数
 func demo14() {
 let p0:(x:Double,y:Double) = (0,0)
 let p1:(x:Double,y:Double) = (6,6)
 let w = getLengthAndWidth(p0,p1: p1).width
 let len = getLengthAndWidth(p0,p1: p1).length
 print("w=\(w) len=\(len)")
 }


/*
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
 
 // 泛型
 func swapValue<T>(inout a:T,inout b:T) {
 let temp = a
 a = b
 b = temp
 }
 
 class ClassA<T> {
 func getValue(value:T) {
 println(value)
 }
 }
 
 func demo24() {
 var a = 12
 var b = 13
 swapValue(&a, &b)
 println("a = \(a)   b=\(b)")
 var s1 = "123"
 var s2 = "321"
 swapValue(&s1, &s2)
 println("s1 = \(s1)   s2=\(s2)")
 }
 
 
 demo24()
 */





