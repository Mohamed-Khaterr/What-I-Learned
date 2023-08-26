# C Programming Language

# Basics
### C Program Life Cycle
1. Source Code (MyFile.c)
2. Object Code (MyFile.obj)
3. Object Code (MyFile.exe)

IDE: is a software that is used to edit, compile and link a programs to produce executable program.
***
### Compiler & Interpreter
Both are used to convert the code of **High Level Language** int **Machine Language**

- Compiler: Run all program at once
- Interpreter: Run each statement of Code (each line).

**Writing C is in Compiler**
***
### Static & Dynamic Linking
- Static Link (.lib): is reference of libraries that need to call in each file or program, Big in Size.


- Dynamic Link (.dll): is reference of libraries that are stored in Operating System, Small in Size.
```C
#include <stdio.h>


printf(); // Call a library
```
***
### Deployment
- Direct: First time publish the app.
- Parallel: App that is publish and update (update some from Objective-C to Swift while the app is published).
- Phase: Publish app with the first feature then add new feature next.
***
### Errors
- Syntax Error: Compile Time Error
- Logical Error: Run Time Error (App is run but the result is not right).
- Warning: ex: forgot to remove object from memory

# Variables
Variable is named location in memory.
- Store Data in Memory
- Use space in memory according size of the DataType of data
- OS interact with this variable by his Address

Create Variable:
Data_Type Variable_Name = Value_of_Data;

DataTypes:
- int/long: 1005
- float/double: 10.3
- char: 'a'
- string: "Aly"

Variable Names can contain: (**C is case sensitive**)
- Characters (a-z A-Z): Num or num
- NumbersL: Num1
- Underscore: _num

**Variable Name can't start with numbers (1num) or contain spaces ( num first) or use reserved key words ( int , double, etc... )**

```C
int x; // store location in memory, size: 4 byte, type:  signed number, location name: x
// value of x will be rubbish data

/* Can't Name variable like this */
int current page;

int int;

int double;

int 1num;
```

**if you don't set a value of variable then it's value will be rubbish**

# Print
Printf() is to display on screen.
    
Library:
- stdio.h -> Standard I/O 

Parameters:
- String **required**
- Arguments **not required**


```C
// printf(String, Arguments);
printf("This is String");


/* Scap Sequence */
// \n -> new line
printf("\nPrint in Second Line");


// \t -> space tap (8 spaces) 
printf("\tPrint after 8 spaces");


// \a -> alert sound
printf("\aYou will hear alert sound"); 
```

**Format Specifier:**
- %d: Decimal (int)
- %ld: Decimal (long)
- %c: Character (char)
- %f: Floating (float)
- %lf: Double
- %x: Hexadecimal
- %s: String

```C
int i = 1020;
printf("%d", i);


char a = 'a';
printf("%c", a);


float f = 1.123;
printf("%f", f);


// Can Do Hexadecimal on all variables
printf("%x", i);
printf("%x", a);
printf("%x", f);


// Print more than one variable
int x = 10;
int y = 55;
printf("%d %d", x, y); // First %d -> x | Second %d -> y
```

# Scan
scanf() is to get input from user.

getch() is to get one input from user (character).

Library:
- stdio.h -> Standard I/O 

Parameters:
- Format Specifier **required**
- Address of Variable **required**

```c
int x=0;
scanf("%d", &x); // user input 4 -> set x = 4


char a;
scanf("%c", &c); // user input B -> set a = 'B'

// OR
a = getch(); // user input c -> set a = 'c'


float f;
scanf("%f", &f); // user input 1.12 -> set f = 1.12


double d;
scanf("%lf", &d); // user input 1.231231123 -> set d = 1.231231123
```

# ASCII Table
- Decimal 
- Hex
- Char


# Athematic Operators
- Binary Operators: +, -, *, /, %, =, <, >
```C
int x = 10;
int y = 55;


int z; // value is rubbish data

z = x + y; // z = 10 + 55

z = x - y; // z = 10 - 55

z = x * y; // z = 10 x 55
// and so on
```
- Unary Operators: ++, --
```C
int x = 10;

x++; // x = x + 1;

x--; // x = x - 1;
```

- Associativity: LTR, RTL
```C
int x = 5*2/3; // 10 / 3 LTR

int x = 5*(2/3); // 5 * 0 RTL
```

# Boolean
- 0 is False
- any value rather than 0 is True

# if Statement
```c
// if there are more than one statement it will throw an Error
if(condition)
    printf("True");
    ; // Error: (bec, more than one statement) need {}
else 
    printf("True");
    // No Error: bec. one statement
```

# Switch Statement
Switch only work with int & char only other than that it will give error
You can write switch statement without:
- default
- break (Grouping)
```C
switch (variable){
    case value1:
    // Code
    case value2:
    // Code

    default:
        break;
}

/* Grouping */
// The cases will run until it found a break statement
int x = 2;

switch (x){ // x = 2
    case 1:
    case 2:
        // Code will run first
    case 3:
        // this code will run second
        break; // exit switch
    case 4:
    case 5:
        break;

    default:
        break;
}

int y=4
switch (x){
    case y:// Error
}

switch (x){
    case 1: {} // You Can write {} in case
    case 2 {} // Error need (:)
}
```

# Array (Static Array)
Array Characteristic:
- Fixed Size (size of array can not change)
- Homogenous (all values has same datatype)
- Consecutive  (sorted sequentially in memory)
- Static Size (size of array must be set at declaration (before compile time))

**Size of array must be defined before the compilation time (called preprocessing)**

```C
// Array Declaration
int arr[3]; // Size: 4 byte (int size) * 10 

// Or
int arr2[3] = {10, 20, 30};

int arr3[3] = {0}; // All values in array equal 0

int arr4[5] = {10, 20}; // Other values will be equal to 0


// if we set more values than size of array it will be undetermined behavior
int arr5[3] = {10, 20, 30, 40, 50, 60}; // Undetermined Behavior


int arr6[] = {10, 20, 30}; // C will know that the size of array is 3 (no error)


int arr7[]; // Can not do that in old C


// Set Value of index 0
arr[0] = 99;

// Set Value of index 1
arr[1] = 55;

// Set Value of index 2
arr[2] = 11;


/* Scan index (get value from user) */
scanf("%d", &arr[0]);
scanf("%d", &arr[1]);


/* Print index (display value to user) */
printf("%d", arr[0]); // print value of index 0 in array
printf("%d", arr[1]); // print value of index 1 in array


/* Preprocessing Statement*/
#define SIZE 3 // Preprocessing (called before compile time)

int arr8[SIZE];

int r = 4;
int arr9[r]; // Error

for(int i=0;i<SIZE;i++)
```

# 2D Array
```C
// 2D Array Declaration
// arr[Rows][Column]
int arr[3][4]; // Size: 4 byte (int size) * 3 * 4 
//  ^ The data in this array right now is rubbish data


// OR
#define row 2
#define col 3

int arr2[row][col] = {
    // Row 0
    {
        1, // Col 0
        2, // Col 1
        3  // Col 2
    }, 
    // Row 1
    {
        4, // Col 0
        5, // Col 1
        6  // Col 2
    }
}

// Set Value of index row: 0, column: 0
arr[0][0] = 20;

/* Scan index (get value from user) */
scanf("%d", &arr[0][1]); // Set Value for row: 0, column: 1
scanf("%d", &arr[1][2]); // Set Value for row: 1, column: 2


/* Print index (display value to user) */
printf("%d", arr[0][0]); // print value of row: 0, column: 0
printf("%d", arr[0][1]); // print value of row: 0, column: 1
```

# String
```C
// Character ''
char ch = 'a';


// String ""
char c[5] = "ABCD"; // The array size is actually 4 not 5 bec last value will equal to Null character ('\0')
// c[0] = 'A' : 1
// c[1] = 'B' : 2
// c[2] = 'C' : 3
// c[3] = 'D' : 4
// c[4] = '\0' : 5


// Initialize String without any rubbish data
char c2[5] = {'\0'};

// OR
char c3[5] = ""; 


/* Override String */
c = "HI"; // Error: Compilation Error


// To change the value of String use strcpy(array, value);
strcpy(c, "HI"); // or to change value use loop to change every single character


// Other way to override the value of c is by the user
scanf("%s", c); // user input "HI"
// it will be look like this in the Memory
// c2[0] = 'H'
// c2[1] = 'I'
// c2[2] = '\0' 
// c2[3] = 'D'
// c2[4] = rubbish data
// NOTE: we don't use (&) in scanf() for c array because c is a pointer


/* Concatenate */
strcat(c, "JK"); // c = "ABCDHI"


/*
    NOTE: if we create string with size of 10 and we set value to be less than the size of array 
    then the last character will be Null character ('\0') and the remaining spaces will be rubbish data 
*/


// Example
char c3[5] = "AB"; 
// in this char array the size is 5 and we initialized it with value less
// than the size the array will look like this
// c3[0] = 'A'
// c3[1] = 'B'
// c3[2] = '\0' 
// c3[3] = rubbish data
// c3[4] = rubbish data
// and the other values will be rubbish data


/* Print (display value to user) */
char name[10] = "Khater";
printf("%s", name);
// OR
puts(name);


/* Scan (get value from user) */
scanf("%s", name); // NOTE: we don't use (&) in name array because name is a pointer

// NOTE: if user add value which characters is greater than or equal the size of the array it will be undetermined behavior

// NOTE: scanf() doesn't get any value after the space
// ex: user enter "Mo Salah" then name will be equal to "MO" and " Salah" will be neglected


// To get value with spaces you will need to use gets()
gets(name); // This will get value from the user with spaces
```

# Structure
```C
// Create new datatype
struct emp{ // size of emp is 4 + 20 + 4 = 28 bytes
    int id; // 4 bytes
    char name[20]; // 20 bytes
    int age;  // 4 bytes

    int z = 10; // Error: Can't initialize inside the struct
}; // NOTE: ; is important


/* Declaration */
struct emp e1; // Data in e1 is now rubbish data


e1.id = 3;
strcpy(e1.name, "Mohamed");
e1.age = 23;


//               id   name    age
struct emp e2 = {1, "Khater", 23};
// NOTE: if you forgot element in struct it will cause Undetermined Behavior


e1 = e2; // You can do that in struct


if(e1 == e2) // But can't do that
if(e1 < e2) // and can't do that


/* Print (display value to user) */
printf("%d", e1.id);
printf("%s", e1.name);


printf("%d", e1); // NOTE: Will print the first element in struct


/* Scan (get value from user) */
scanf("%d", &(e1.id));
scanf("%s", (e1.name));
```

# Array of Structures
```C
struct emp{ // size of emp is 4 + 20 + 4 = 28 bytes
    int id; // 4 bytes
    char name[20]; // 20 bytes
    int age;  // 4 bytes
};

/* Declaration */
struct emp arr[5]; // 5 elements in memory, each element is a struct emp

struct emp arr2[5] = {{0}}; // initialize without any rubbish data

/* Scan (get value from user) */
scanf("%d", &arr[0].id);
scanf("%s", arr[0].name);

/* Print (display value to user) */
printf("%d", arr[0].id);
printf("%s", arr[0].name);
```

# Pointers
Pointer is a variable that hold address of other variable with the same Datatype.

```C
/* Declaration */
int *ptr; // Create a Pointer Variable

int x = 10;

ptr = &x; // Now ptr hold the address of variable x

/* Print (display value to user) */
printf("%p", ptr); // Output: Address of x though ptr
printf("%p", &x); // Output: Address of x

// To get the value of value in x by pointer ptr:
printf("%d", *ptr); // Output: The value of x which is 10 though ptr
printf("%d", x); // Output: The value of x which is 10

// NOTE: ptr is equivalent to &x and *ptr is equivalent to x

/* Scan */
// Now we can change the value of x through variable ptr
scanf("%d", ptr); // The input from the user will set the value of x

/* Pointer to Pointer */
int **ptp = &ptr; // Create pointer that hold other pointer

// Now: ptp -> ptr -> &x
// *ptp => ptr
// **ptp => ptr => x

printf("%p", x); // Output: Value of x
printf("%p", *ptr); // Output: The value of x though ptr
printf("%d", **ptp); // Output: The value of x though ptp
```

## Pointers with Array
Arrays in C are pointers that hold address of elements in memory.

**The array name is fixed pointer (value is constant) to first element in the Array.**
```C
// Static Array
int arr[3] = {1,2,3};

// NOTE: arr is pointer that hold first element in the array, So:
printf("%d", *arr); // Output: 1

printf("%p", arr); // Output: Address of the  first element

// NOTE: *arr is equivalent to arr[0]
// NOTE: arr is equivalent to &arr[0]


/* Access element by pointer */

// Now we know that arr is a pointer to first element
printf("%d", *(arr + 1)); // Output: Value of second element

// NOTE: *(arr + 1)
// arr + 1 -> go to the next address in the array which is address of index 1
// * -> to get the value of this address 

/* Print Array using Pointers */
for(int i=0;i<arrSize;i++){
    printf("\nAddress of index %d: %p", i, (arr + i));
    printf(" Value of this address is %d", *(arr + i));
}

// NOTE: Because we know that arr is now a pointer now we can do that
int *ptr = arr; // Now ptr is an array

// So we can do that without any problems
for(int i=0;i<arrSize;i++){
    printf("\nAddress of index %d: %p", i, (ptr + i));
    printf(" Value of this address is %d", *(ptr + i));
}

// Also we can do that too
for(int i=0;i<arrSize;i++){
    printf("\nValue of index %d is %d", i, ptr[0]);
}

ptr++; // NOTE: if we do that ptr now is not an array and it will hold the address of second element 
// and it will be Undetermined Behavior

# Function
```C
// Function Prototype or Function Declaration
void myFunc(); // NOTE: if you don't add a prototype some compliers may work and other will show Error.
// NOTE: But the Standard is to add Prototype

// After the main
// Function Definition
void myFunc(){
    // Function Implementation
}


/* Function with Argument */
void myFunc2(int x); // Prototype
void myFunc2(int); // other way to write a Prototype

void myFunc2(int x){} 
// myFunc2: Function Header
// x: Function Parameter
// NOTE: if you call the function without passing the arguments it will cause an Error


/* Function with Return Type */
int myFunc3(int x, int y){
    return x + y;
}
// int: Return Type
// myFunc3: Function Header
// x & y: Function Parameters
// NOTE: if you don't add return in function body it will cause Undetermined Behavior
// NOTE: if you add second return it will be useless and it will run without error


/* Function with Array Parameter */
void myFunc4(int arr[], int arrSize){}
// myFunc4: Function Header
// arr: Function Parameters of type array of integers
// arrSize: Function Parameters of type integer
```

# Pass By Value
Pass by Value is send a copy of variable value, So if we change the value the variable value still the same.
```C
void myFunc(int x){
    x = 20;
}

int a = 10;
myFunc(a);

printf("%d", a); // Output: 10
// NOTE: The value of a doesn't change
```
**In the memory: it will `create space for the variable x` and when the function is finished it will variable x remove from the memory**

# Pass by Address
Pass by Address is sending the address of the variable, So if we change the value of the variable inside the function then the variable with this address will change to.
```C
void myFunc(int *x){
    // x: address
    // *x: value at address
    *x = 20;
}

int a = 10;
myFunc(&a);

printf("%d", a); // Output: 20
// NOTE: The value of a changed because myFunc have the address of a and it change it's value
```
**In the memory: it will `create space for x` and x will hold the address of passed variable (which is a) and after the function is finish x will remove from memory**

# Dynamic Array
In Dynamic Array we will use malloc function which is to allocate the size we want in the Memory (**Heap**)

The pointer variable is stored in the ***Memory Stack*** but the data is stored in the ***Memory Heap***.

**Require include `malloc.h`**
```C
#include <malloc.h>

//int *ptr = (datatype of the variable) malloc(5*sizeof(datatype of each element));

// malloc return void so we need to cast it
int *ptr = (int*) malloc(5*sizeof(int)); // Make malloc to store 5 * 4 bytes in memory (Heap)


// NOTE: Careful malloc can return NULL so you need to check if ptr is not null do continue the program
if (ptr == NULL){
    RETURN
}


// Or we can make user choose the size of the array
int size;
printf("Enter the size of the array: ");
scanf("%d", size);


int *ptr = (int*) malloc(5*sizeof(int));


/* Scan */
for(int i=0;i<size;i++){
    scanf("%d", &ptr[i]);
} 


/* Print */
for(int i=0;i<size;i++){
    printf("\n%d", ptr[i]);
    // OR
    printf("\n%d", *(ptr + i));
    // OR
    printf("\n%d" ptr++); // NOTE: if you use ptr again it will cause Undetermined Behavior
}


// NOTE: We need to free this spaces that malloc allocated in the memory after we finish using these spaces.
// To free these space we use function call free() and pass pointer to it
free(ptr);

// NOTE: if we don't free allocated spaces it will cause Memory Leak

// NOTE: if we Set New size for ptr we need to free old spaces.
ptr = malloc(50); // Set a Size
free(ptr); // Free old Size
ptr = malloc(1000); // Set New Size
```

# 2D Dynamic Array
```C
#include <malloc.h>

//datatype **name = (variable datatype) malloc(5 * sizeof(element datatype))
int **arr = (int**)malloc(5*sizeof(int*));

arr[0][0] = 30;
arr[1][1] = 10;

printf("%d", arr[0][0]);
printf("%d", arr[1][1]);
```

# Memory Sections in C
- Code Section
- Stack: Local Variable
- Heap: malloc
- Global Section

# To Search
```C

*ptr++; // address ++
*++ptr; // ++ address
++*ptr; // ++ value
(*ptr)++; // value ++


const int* ptr = &x; // x value is constant

int* const ptr = &x; // ptr pointer is constant
```