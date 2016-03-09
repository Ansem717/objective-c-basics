//: Playground - noun: a place where people can play

import UIKit

/* 



Number Objects

int, float, and long are NOT objects, they are primitive data types.
They do not live anywhere on the heap.

NSNumber can be used to create objects from these types.

If you store a number inside NSNumber though, make sure to recieve it with the same type (Like Int <-> Int, or Double <-> Double)

use <#isEqualToNumber#> method to compare if two numbers are equal and <#compare:#> to compare higher, lower, or equal.


Using <#@2#> defines a numerical litteral. This is the same as <#[NSNumber alloc] initWith... 2]#> where the initWith is int, double, or long based on what the numerical value was.


Using <#[NSString alloc] stringWithFormat...]#> to initalize new strings with certain values. This can be used to create an NSString with string interpolation.


The <#@#> shorthand will force values to be immutable. This means constant. To make a variable, we can't even use NSString, or NSNumber or NSArray but instead we use NSMutableString, NSMutableNumber, etc.<##>

Sometimes immutable values are still mutable in Objective C. To avoid this, once the object you wish to be immutable returns, copy it instead of pointing a reference to it. <#OBJECT-TO-COPY.copy() as! IMMUTABLE_CLASS#>


<#NSString *string;#>
<#string = @"Hello";#>
<#string = @"World";#>
<#NSLog(@"%@", string)#>

Result: "World"

Even though <#string#> is a constant, what's going on here is that a new string <#@"World";#> is replacing whatever the original <#string#> constant was pointing at. 
Let constants in Objective-C are not always immutable. Be careful!

Objective-C arrays are naturally [AnyObject], but only an Object. It cannot contain basic data types.

<#[NSMutableArray new]#> == <#[NSMutableArray alloc] init]#>



<#/* Declaring Properties */#>

@property NSString *name;
@property NSString *email;

Apple removed the need for @synthesize, manual setters and manual getters.

By default they are <#__ATOMIC OR NON ATOMIC__#>? I don't know! We supposedly looked at this before??
Properties can have options set to them.

@property (copy, nonatomic) NSString *name;

You can still utilize the same setter method when using @properties.

This allows you to apply willSet and didSet.


    LOOK UP:
<#@Documentation#>
<#NSFileManager#> and it's Delegate
<#Atomic vs Nonatomic#>



<#Memory Management#>

Cleaning up used memory so we can use it again. 
--Manual reference counting and auto release pool
--Automatic reference counting

ARC is enabled by default.

All object's inital reference count is set to 1. 
Sending a retain message to an object will increase it's reference count by one. Sending a release message decreases the count by one.

When an object is added to <#NSMutableArray#> with <#addObject:#>, this increases the reference count by one.
<#removeObjectAtIndex:#> decreases the count by one.

Releasing an object that doesn't have a reference count causes a crash.
Reference count is readable, but unreliable.

NSAutoreleasePool was created in order to track objects to be released at a later time in an object known as an autorelease pool. 
The autorelease pool gets drains at certain times.

You must manually release anything starting with <#alloc#>, <#copy#>, <#mutableCopy#> or <#new#>

<#Event Loop#>

To process a new event, the system creates a new auto release pool. When you're done handling the event, that event's autorelease pool is drained.




<#HOW TO CODE WITH MRC#>

1) New Project -> iOS SPA -> name it whatever
2) Build Settings -> search "LLVM 7.0 - Language" -> Set ARC to No
3) Create Person class with a few variables. Don't use <#@property#>

4) for setVariable:

[variable retain];
[_variable release];
_variable = variable;


5) OVERRIDE DEALLOC within Person class, since they own the name and email

- (void)dealloc {
    [_variable release];
    _variable = nil;
    [super dealloc];
}

6) in ViewDidLoad make a person and give him a name.
7) Click and hold a playbutton and click analyze.
8) Now add autorelease like so: [[[Person alloc]init]autorelease]

9)
- (Person *)doSomething {
Person alloc init
return [person autorelease]
}

If we did

Person 1 has name
Person 2 has email
Person 3 is Person 1's name with Person 2's email

Then before <#return [person3 autorelease]#> we must <#[person1 release];#> and do that again for Person 2.

We're also able to say <#NSLog(@"%i", [person1 retainCount]);#> but this is unreliable.





______________________________________________________

<#ARC#>
AUTOMATIC REFERENCE COUNTING

Arc does all the reference counting for you. Theoretically, MRC is faster, but it's very minimal compared to the effort putting in.


In swift, frameworks are Structures, causing them to be value types.
In Objective C, everything is a Class, causing them to be reference types.

*/














