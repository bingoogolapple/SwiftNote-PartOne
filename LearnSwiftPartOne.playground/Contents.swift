import Foundation

// 字符串
func demo1() {
    // var声明常量
    var name = "王浩"
    name = name + "bingo"
    name = name + "\(100)"
    // let声明变量
    let id = 50
    let address:String = "重庆市"
    print("id=\(id),name=\(name),address=\(address)")
    // 按住option光标移到变量上，显示？时点击就可以看见变量的类型
    
    let x = 1, y = 2, z = 3, b = true
    print(x, y, z, b, separator:"-")
    print("hello")
    
    // 默认的结束符是回车
    print(x, y, z, b, separator:"-", terminator:"我是结束符")
    print("hello")
    
    
    print(x, "*", y, "=", x * y)
    
    
    
    
    var test1 = "Hello, Swift"
    let startIndex = test1.startIndex
    test1[startIndex]
    test1[startIndex.advancedBy(5)]
    test1[startIndex.advancedBy(6)]
    
    let spaceIndex = startIndex.advancedBy(6)
    spaceIndex
    test1[spaceIndex]
    // 查看前一个
    test1[spaceIndex.predecessor()]
    // 查看后一个
    test1[spaceIndex.successor()]
    
    let endIndex = test1.endIndex
    // [startIndex, endIndex)
    test1[endIndex.predecessor()]
    
    test1[startIndex..<spaceIndex]
    let range = startIndex ..< spaceIndex.predecessor()
    test1.replaceRange(range, with: "Hi")
    test1.appendContentsOf("!!!")
    test1.insert("?", atIndex: test1.endIndex)
    test1.removeAtIndex(test1.endIndex.predecessor())
    test1.removeRange(test1.endIndex.advancedBy(-2)..<test1.endIndex)
    test1.hasPrefix("Hi")
    test1.hasSuffix("ift!")
    test1.containsString("Swi")
    test1.uppercaseString
    test1.lowercaseString
    test1.capitalizedString
    
    let test2: String = NSString(format: "on third is %.2f", 1.0/3.0) as String
    test2
    let test3 = "   --- Hello --------   " as NSString
    test3.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " "))
    test3.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "- "))
    test3.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " -"))
}

//demo1()


// 类型
func demo2() {
    let minIntValue = Int.min
    let maxIntValue = Int.max
    let minInt8Value = Int8.min
    let maxInt8Value = Int8.max
    let minUInt8Value = UInt8.min
    let maxUInt8Value = UInt8.max
    print("minIntValue=\(minIntValue),maxIntValue=\(maxIntValue)")
    print("minInt8Value=\(minInt8Value),maxInt8Value=\(maxInt8Value)")
    print("minUInt8Value=\(minUInt8Value),maxUInt8Value=\(maxUInt8Value)")
    
    let value1 = 12_000_000  // 只是为了可读性
    let value2 = 1_000_000.000_000_1
    print("value1=\(value1),value2=\(value2)")
    
    
    let value3:Float = 1.3
    let value4:Double = 1.3
    let value5 = 1.3
    print("value3=\(value3),value4=\(value4),value5=\(value5)")
}

//demo2()

func add(num1:Int,num2:Int)->(Int,Int,Int) {
    let result = num1 + num2
    return (num1,num2,result)
}

// 元组、多返回值
func demo3() {
    let (num1,num2,result) = add(2, num2: 3)
    print("\(num1) + \(num2) = \(result)")
    
    
    let point = (5, 2)
    // 通过索引来取
    point.0
    point.1
    
    let (x, y) = point
    x
    y
    
    
    let httpResponse = (404, "Not Found")
    httpResponse.0
    httpResponse.1
    let (statusCode, statusMessage) = httpResponse
    statusCode
    statusMessage
    
    
    let point2:(Int, Int, Int) = (2, 3, 5)
    point2.0
    
    
    
    let httpResponse2:(Int, String) = (404, "Not Found")
    httpResponse2.0
    
    let point3 = (x : 3, y: 2)
    point3.0
    point3.1
    point3.x
    point3.y
    
    let point4:(x:Int, y:Int) = (2, 3)
    point4.0
    point4.1
    point4.x
    point4.y
    
    let loginResult = (true, "username")
    // 不想取的值用下划线占位
    let(isLoginSuccess, _) = loginResult
    if isLoginSuccess {
        print("登陆成功")
    }
    
}

//demo3()


func sayHello(name:String) -> String{
    return "Hello \(name)"
}
func sayHelloTo1(name:String, greeting:String) {
    print(name, greeting)
}
func sayHelloTo2(name:String, withGreetingWord greeting:String) {
    print(name, greeting)
}
func sayHello3(to name:String, withGreetingWord greeting:String) {
    print(name, greeting)
}
func sayHello4(to name:String, withGreetingWord greeting:String = "Hello") {
    print(name, greeting)
}
func sayHello5(to name:String = "bga", withGreetingWord greeting:String = "Hello") {
    print(greeting, name)
}

// 加上下划线，调用时可省略num2
func mutiply(num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}
func mean(numbers: Double ...) -> Double {
    var sum: Double = 0
    for number in numbers {
        sum += number;
    }
    return sum / Double(numbers.count)
}
func customSwap(inout a: Int, inout _ b: Int) {
    //    let t: Int = a;
    //    a = b;
    //    b = t
    
    (a, b) = (b, a)
}

func changeScore(score: Int) -> Int {
    return Int(sqrt(Double(score)) * 10)
}
func isPassOrFail(score: Int) -> String {
    return score < 60 ? "Fail" : "Pass"
}
func fail(score: Int) -> Bool {
    return score < 60
}
func add(num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}
func concatenate(str: String, num: Int) -> String {
    return str + String(num) + " "
}


func tier1MailFeeByWeight(weight: Int) -> Int {
    return 1 * weight
}
func tier2MailFeeByWeight(weight: Int) -> Int {
    return 3 * weight
}
func chooseMailFeeCalculationByWeight(weight: Int) -> (Int) -> Int {
    return weight <= 10 ? tier1MailFeeByWeight : tier2MailFeeByWeight
}
func feeByUnitPrice(price: Int, weight: Int) -> Int {
    let mailFeeByWeight = chooseMailFeeCalculationByWeight(weight)
    return mailFeeByWeight(weight) + price * weight
}

// 函数也是一个对象，意味着可以直接当做一个变量来使用
func demo4() {
    let scores = [65, 91, 45, 97, 87, 72, 33]
    scores.map(isPassOrFail)
    scores.filter(fail)
    scores.reduce(0, combine: add)
    scores.reduce(0, combine: +)
    scores.reduce("", combine: concatenate)
    
    
    
    mutiply(1, 2)
    let fun = sayHello
    print(fun("hahahahha"))
    let anthorSayHello1:(String) -> String = sayHello
    // 一个参数时可省略括号
    let anthorSayHello2:String -> String = sayHello
    
    sayHello5()
    sayHello5(to: "bingoogolapple")
    sayHello5(withGreetingWord: "Hi")
    sayHello5(to: "bingoogolapple", withGreetingWord: "Hi")
    sayHello5(withGreetingWord: "Hi", to: "bingoogolapple")
    
    var x:Int = 1
    var y:Int = 2
    customSwap(&x, &y)
    x
    y
    
    // swift中数组、字典、集合都是值传递
    
    
    let anotherSayHelloTo21 = sayHelloTo2
    let anotherSayHelloTo22: (String, String) -> () = sayHelloTo2
//    anotherSayHelloTo21("one", withGreetingWord: "Hi")
    anotherSayHelloTo22("one", "Hello")
    
}

demo4()


// 数组
func demo5() {
    let test1: [Int] = [0, 1, 2, 3, 4]
    let test2: Array<Int> = [0, 1, 2, 3, 4]
    
    var emptyArr1: [Int] = []
    var emptyArr2: Array<Int> = []
    var emptyArr3 = [Int]()
    var emptyArr4 = Array<Int>()
    
    var allZeros = [Int](count: 5, repeatedValue: 0)
    var allZeros2 = Array<Int>(count: 5, repeatedValue: 0)
    
    // 返回的是可选类型
    test1.first
    test1.last
    emptyArr1.first
    
    test1.minElement()
    test1.maxElement()
    test1[2..<4]
    test1.contains(3)
    test1.indexOf(3)
    
    for number in test1 {
        print(number)
    }
    for (index, number) in test1.enumerate() {
        print("\(index + 1):\(number)")
    }
    
    
    var arr1 = ["Hello","World",5]
    print(arr1)
    print(arr1[2])
    
    
    var arr3 = [String]() // 只能存放特定类型
    arr3.append("Hello")
    arr3.append("Swift")
    print(arr3)
    
    
    let arr4 = [2,5,3,6,4]
    // 这种方式是生成新的数组
    let arr5 = arr4.sort({$0 < $1})
    print(arr5)
    
    
    var arr6 = [2,5,3,6,4]
    // 这种方式是直接改变原数组
    arr6.sortInPlace { (a, b) -> Bool in
        return a < b
    }
    print(arr6)
    arr6.sortInPlace({$0 > $1})
    print(arr6)
    
    var arr7 = [2,5,3,6,4]
    arr7.sortInPlace()
    print(arr7)
}

//demo5()


// 字典
func demo6() {
    var emptyDict1: [String: Int] = [:]
    var emptyDict2: Dictionary<Int, String> = [:]
    var emptyDict3 = [String: String]()
    var emptyDict4 = Dictionary<Int, Int>()
    
    var dict = ["name":"王浩","address":"重庆市"]
    dict["sex"] = "男"
    
    print(dict)
    print(dict["name"])
    
    if let value = dict["name"] {
        print(value)
    }
    
    var dict2:Dictionary<String,Int> = ["name":1,"address":2,"hehe":3,"sdfsdf":4]
    if dict2.removeValueForKey("name") != nil {
        print("删除了")
    } else {
        print("没删除")
    }
    print(dict2.count)
    
    for key in dict2.keys {
        print(key)
    }
    
    for value in dict2.values {
        print(value)
    }
    
    for (key, value) in dict2 {
        print("\(key),\(value)")
    }
    
    let keys = Array(dict2.keys)
    print(keys)
    let values = Array(dict2.values)
    print(values)
    
    
    
    var skillsOfA: Set<String> = ["swift", "OC", "OC", "html", "css"]
    skillsOfA.count
    var emptySet1: Set<Int> = []
    var emptySet2 = Set<Double>()
    var vowels = Set(["A", "E", "I", "O", "U"])
    // 集合是无需的，随机取出一个
    skillsOfA.first
    
    
    for skill in skillsOfA {
        print(skill)
    }
    
}

demo6()

// 循环
func demo7() {
    var arr = [String]()
    // 包含0，不包含5
    for index in 0..<5 {
        arr.append("Item \(index)")
    }
    print(arr)
    
    
    var arr1 = [String]()
    // 包含0，包含5
    for index in 0...5 {
        arr1.append("Item \(index)")
    }
    print(arr1)
    
    
    for value in arr1 {
        print(value)
    }
    
    
    //    for (index, value) in enumerate(arr1) {
    //        print("enumerate index\(index),\(value)")
    //    }
    
    var i = 0
    while i<arr1.count {
        print(arr1[i])
        i += 1
    }
    
    let dict = ["name":"王浩","address":"重庆市"]
    
    for (key,value) in dict {
        print("key=\(key),value=\(value)")
    }
    
    var result = 1
    let base = 2
    let power = 10
    for _ in 1...power {
        result *= base
    }
}

//demo7()

func optionDemo() {
    var name:String? = "aaa"
    name = "bbb"
    //    name = nil
    
    // 如果可选性变量name不为nil，则name解包赋值给unwrappedName，并执行花括号里的逻辑
    if let unwrappedName = name {
        // 解包后的unwrappedName就不是一个可选型了
        print(unwrappedName)
    }
    
    // 在这里允许使用相同的变量名，但是这个解包后的name只能在这个花括号内使用
    if let name = name {
        print(name)
    } else {
        print("name is nil")
    }
    
    // 可以用var，也可以用let
    if var name3 = name {
        name3 = name3 + "test"
        print(name3)
    }
    
    if name != nil {
        print(name)
    }
    
    
    let errorCode: Int? = 404
    let errorMessage: String? = ""
    // 判断多个可选性通过逗号分隔
    if let errorCode = errorCode, errorMessage = errorMessage where errorCode == 404 {
        print("Page Not Found")
        print("errorCode=\(errorCode),errorMessage=\(errorMessage)")
    }
    
    // 此时message不是可选性
    let message:String
    if let errorMessage = errorMessage {
        message = errorMessage
    } else {
        message = "No Error"
    }
    // 此时message2是可选性
    let message2 = errorMessage == nil ? "No Error" : errorMessage
    // 此时message3不是可选性
    let message3 = errorMessage ?? "No Error"
    
    errorMessage!.uppercaseString
    
    
    var error1: (errorCode: Int, errorMessage: String?) = (404, "Not Found")
    error1.errorMessage = nil
    error1
    // error1并不是可选性，不能设置为nil
    //    error1 = nil
    
    var error2: (errorCode: Int, errorMessage: String)? = (404, "Not Found")
    // error2.errorMessage并不是可选性，不能设置为nil
    //    error2?.errorMessage = nil
    error2 = nil
    
    var error3: (errorCode: Int, errorMessage: String?)? = (404, "Not Found")
    
    
    var ageInput: String = "abc"
    // 此时age是一个可选性，「当ageInput是数字字符串时，age就是对应的数字，否则age为nil」
    var age = Int(ageInput)
    
    if let age = Int(ageInput) where age < 20 {
        print("haha")
    }
    
    
    var greetings = "Hello"
    greetings.rangeOfString("ll")
    greetings.rangeOfString("oo")
}

//optionDemo()



// 流程控制，可选变量
func demo8() {
    for index in 0 ... 5 {
        if index%2 == 0 {
            print(index)
        }
    }
    
    
    // swift中必须穷举所有的可能性，否则必须写default，「switch也可以判断浮点数」「在每一个case后不用写break，默认会跳出」
    let rating = "A"
    switch rating {
    case "A":
        print("A")
    case "B", "C":
        print("B and C")
    default:
        () // 可以用小括号对来代替break
        //    default:
        //        break
    }
    
    
    let y = true
    switch y {
    case true:
        print("true")
    case false:
        print("false")
    }
    
    
    let score = 90
    switch score {
    case 0..<60:
        print("不及格")
    case 60:
        print("刚好及格")
    case 61...100:
        print("世纪东方机试的")
    default:
        print("错误的分数")
    }
    
    
    let vector = (8, 3)
    switch vector {
    case (0, 0):
        print("1")
    case (_, 5):
        print("2")
    case (8, _):
        print("3")
    fallthrough // 即使下一个case可能不满足条件也强制执行下一个case
    case (9, 9):
        print("4")
        fallthrough
    case (-2...2, -2..<3):
        print("5")
    case (let x, 3):
        print("x is \(x)")
    case (5, let y):
        print("y is \(y)")
    case (let x, let y):
        print("The point is(\(x),\(y))")
    }
    
    
    let age = 19
    switch age {
    case 10...19:
        print("teenager")
    default:
        print("not ateenager")
    }
    
    if case 10...19 = age {
        print("teenager")
    } else {
        print("not ateenager")
    }
    
    if age >= 10 && age <= 19 {
        print("teenager")
    } else {
        print("not ateenager")
    }
    
    if case 10...19 = age where age >= 18 {
        print("teenager and in a college")
    }
    
    
    
    let vector2 = (4,0)
    if case (let x, 0) = vector2 where x > 2 && x < 5 {
        print("haha")
    }
    
    
    
    for i in 1...10 {
        if i % 3 == 0 {
            print(i)
        }
    }
    
    for case let i in 1...10 where 1 % 3 == 0 {
        print(i)
    }
}

//demo8()
