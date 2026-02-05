# 🔧 C Programming Lab: Change Values

<div align="center">

![Language](https://img.shields.io/badge/Language-C-A8B9CC?style=for-the-badge&logo=c)
![Topic](https://img.shields.io/badge/Topic-Variable_Swapping-orange?style=for-the-badge)

**"Understanding Pass by Value vs Pass by Reference"**

</div>

---

## 🎯 Learning Objectives

- เข้าใจการสลับค่าตัวแปร (Variable Swapping)
- รู้จัก Temporary Variable
- เข้าใจ Pass by Value vs Pass by Reference
- ใช้ Pointers เบื้องต้น

---

## 📝 Problem: Swap Two Variables

### วิธีที่ 1: ใช้ Temporary Variable
```c
#include <stdio.h>

int main() {
    int a = 10;
    int b = 20;
    int temp;
    
    printf("Before: a=%d, b=%d\n", a, b);
    
    // Swap
    temp = a;
    a = b;
    b = temp;
    
    printf("After: a=%d, b=%d\n", a, b);
    return 0;
}
```

**Output:**
```
Before: a=10, b=20
After: a=20, b=10
```

### วิธีที่ 2: ใช้ Function (Pass by Reference)
```c
#include <stdio.h>

void swap(int *x, int *y) {
    int temp = *x;
    *x = *y;
    *y = temp;
}

int main() {
    int a = 10, b = 20;
    
    printf("Before: a=%d, b=%d\n", a, b);
    swap(&a, &b);  // ส่ง address
    printf("After: a=%d, b=%d\n", a, b);
    
    return 0;
}
```

---

## 💡 Key Concepts

### Pass by Value
```c
void func(int x) {
    x = 100;  // เปลี่ยนแค่ copy ไม่กระทบต้นฉบับ
}

int main() {
    int a = 10;
    func(a);
    printf("%d", a);  // ยังเป็น 10
}
```

### Pass by Reference (ใช้ Pointer)
```c
void func(int *x) {
    *x = 100;  // เปลี่ยนค่าจริง
}

int main() {
    int a = 10;
    func(&a);  // ส่ง address
    printf("%d", a);  // เป็น 100
}
```

---

## 🚀 Compile & Run

```bash
gcc change_values.c -o change_values
./change_values
```
