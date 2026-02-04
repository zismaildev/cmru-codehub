# 📐 Area Calculation Logic

<div align="center">

![Language](https://img.shields.io/badge/Language-C_Programming-A8B9CC?style=for-the-badge)
![Concept](https://img.shields.io/badge/Concept-Modular_Programming-green?style=for-the-badge)

</div>

---

## 🎯 Problem Statement
โปรแกรมคำนวณพื้นที่ (Area) ของรูปทรงต่างๆ เช่น วงกลม, สี่เหลี่ยม, และสามเหลี่ยม โดยเน้นการใช้ **User Input** และการแยก **Function**

## 🏗️ Algorithm Flow

```mermaid
graph LR
    Input[Select Shape] --> Switch{Switch Case}
    Switch -- 1 --> Circle[Area = πr²]
    Switch -- 2 --> Rect[Area = w * h]
    Switch -- 3 --> Tri[Area = 0.5 * b * h]
    Circle --> Result[/Display Result/]
    Rect --> Result
    Tri --> Result
```

## 💻 Tech Implementation
Using `#define` macros for constants and `switch-case` for menu selection.

```c
#define PI 3.14159

void main() {
    int choice;
    printf("1. Circle\n2. Rectangle\nChoose: ");
    scanf("%d", &choice);
    // ... logic inside switch
}
```
