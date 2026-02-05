# ⭐ C Programming Lab: Pyramid Patterns

<div align="center">

![Language](https://img.shields.io/badge/Language-C-A8B9CC?style=for-the-badge&logo=c)
![Topic](https://img.shields.io/badge/Topic-Nested_Loops-purple?style=for-the-badge)

**"Master the Art of Pattern Printing"**

</div>

---

## 🎯 Learning Objectives

- ใช้ Nested Loops (for ซ้อน for)
- พิมพ์ Pattern ด้วยดาว (*)
- Algorithm Thinking
- ควบคุม Loop อย่างแม่นยำ

---

## 📝 Patterns

### Pattern 1: Right Triangle
```c
#include <stdio.h>

int main() {
    int n = 5;
    
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= i; j++) {
            printf("* ");
        }
        printf("\n");
    }
    return 0;
}
```

**Output:**
```
* 
* * 
* * * 
* * * * 
* * * * * 
```

### Pattern 2: Inverted Triangle
```c
for (int i = n; i >= 1; i--) {
    for (int j = 1; j <= i; j++) {
        printf("* ");
    }
    printf("\n");
}
```

**Output:**
```
* * * * * 
* * * * 
* * * 
* * 
* 
```

### Pattern 3: Pyramid (Centered)
```c
for (int i = 1; i <= n; i++) {
    // Print spaces
    for (int j = 1; j <= n - i; j++) {
        printf("  ");
    }
    // Print stars
    for (int k = 1; k <= (2 * i - 1); k++) {
        printf("* ");
    }
    printf("\n");
}
```

**Output:**
```
        * 
      * * * 
    * * * * * 
  * * * * * * * 
* * * * * * * * * 
```

### Pattern 4: Diamond
```c
// Top half
for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n - i; j++) printf("  ");
    for (int k = 1; k <= (2 * i - 1); k++) printf("* ");
    printf("\n");
}

// Bottom half
for (int i = n - 1; i >= 1; i--) {
    for (int j = 1; j <= n - i; j++) printf("  ");
    for (int k = 1; k <= (2 * i - 1); k++) printf("* ");
    printf("\n");
}
```

---

## 💡 Key Concepts

### Nested Loop Structure
```c
for (int i = 1; i <= rows; i++) {      // Outer: แถว
    for (int j = 1; j <= cols; j++) {  // Inner: คอลัมน์
        // Logic here
    }
    printf("\n");  // ขึ้นบรรทัดใหม่
}
```

### Pattern Formula
| Pattern | Spaces | Stars |
|:---|:---|:---|
| Right Triangle | 0 | i |
| Inverted | 0 | n - i + 1 |
| Pyramid | n - i | 2*i - 1 |

---

## 🚀 Compile & Run

```bash
gcc pyramid.c -o pyramid
./pyramid
```
