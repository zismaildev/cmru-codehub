# 📐 C Programming Lab: Find Area

<div align="center">

![Language](https://img.shields.io/badge/Language-C-A8B9CC?style=for-the-badge&logo=c)
![Topic](https://img.shields.io/badge/Topic-Math_Functions-blue?style=for-the-badge)

**"Mathematical Calculations in C"**

</div>

---

## 🎯 Learning Objectives

- ใช้สูตรคณิตศาสตร์ใน C
- ทำงานกับ float และ double
- รับ Input และแสดงผล
- ใช้ printf formatting

---

## 📝 Problems

### ข้อ 1: พื้นที่สี่เหลี่ยมผืนผ้า
```c
#include <stdio.h>

int main() {
    float width, height, area;
    
    printf("Enter width: ");
    scanf("%f", &width);
    
    printf("Enter height: ");
    scanf("%f", &height);
    
    area = width * height;
    
    printf("Area = %.2f\n", area);
    return 0;
}
```

### ข้อ 2: พื้นที่วงกลม
```c
#include <stdio.h>
#define PI 3.14159

int main() {
    float radius, area;
    
    printf("Enter radius: ");
    scanf("%f", &radius);
    
    area = PI * radius * radius;
    
    printf("Area = %.2f\n", area);
    return 0;
}
```

### ข้อ 3: พื้นที่สามเหลี่ยม
```c
#include <stdio.h>

int main() {
    float base, height, area;
    
    printf("Enter base: ");
    scanf("%f", &base);
    
    printf("Enter height: ");
    scanf("%f", &height);
    
    area = 0.5 * base * height;
    
    printf("Area  = %.2f\n", area);
    return 0;
}
```

---

## 💡 Key Concepts

### Data Types for Numbers
| Type | Size | Range | Format |
|:---|:---:|:---|:---:|
| `int` | 4 bytes | -2B to 2B | `%d` |
| `float` | 4 bytes | 6-7 digits | `%f` |
| `double` | 8 bytes | 15-16 digits | `%lf` |

### scanf() and printf()
```c
// Input
int x;
scanf("%d", &x);  // ต้องใส่ &

float y;
scanf("%f", &y);  // ต้องใส่ &

// Output
printf("x = %d\n", x);
printf("y = %.2f\n", y);  // .2f = 2 ทศนิยม
```

---

## 🚀 Compile & Run

```bash
gcc find_area.c -o find_area
./find_area
```
