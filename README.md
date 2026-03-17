# PinBreaker

*iOS Device Application Development*

## Project Description

โปรเจกต์ **PinBreaker** เป็นเกมแนว logic game สำหรับระบบปฏิบัติการ iOS
พัฒนาด้วย **SwiftUI** โดยผู้เล่นจะต้องเดารหัสลับ (PIN) ที่ระบบสุ่มขึ้นมา
ซึ่งประกอบด้วยตัวเลข (0–9) ภายในจำนวนครั้งที่ต้องใช้การวิเคราะห์

ระบบจะแสดงผลการเดาในแต่ละครั้ง โดยแสดงสถานะของแต่ละ digit บนตำแหน่งนั้น ๆ
เพื่อช่วยให้ผู้เล่นสามารถวิเคราะห์และปรับปรุงการเดาในรอบถัดไป

โปรเจกต์นี้พัฒนาต่อยอดจาก CodeBreaker และจัดทำขึ้นตามโจทย์รายวิชา
*CN436 iOS Device Application Development*

---

## Tasks Implemented

โปรเจกต์นี้ได้พัฒนาให้ตรงตามข้อกำหนดดังต่อไปนี้

### 1. PinBreaker Game Logic

* เกมทำงานเหมือน CodeBreaker แต่เปลี่ยนจากสีเป็น **ตัวเลข (0–9)**
* ระบบสุ่มรหัสลับ (Master PIN)
* ผู้เล่นสามารถเดาและตรวจสอบผลลัพธ์ได้ในแต่ละรอบ

---

### 2. Numeric Peg System (0–9)

* Peg ถูกเปลี่ยนจาก Color เป็น **ตัวเลข 0–9**
* ผู้เล่นเลือกตัวเลขจาก Peg Chooser เพื่อสร้างรหัสที่ต้องการเดา

---

### 3. Per-Digit Feedback (On-Peg Display)

* แสดงผลการจับคู่บน Peg แต่ละตัวโดยตรง (ไม่ใช้ MatchMarkers แยก)
* โดยใช้การแสดงผล เช่น

  * 🟩 **Exact** → ตัวเลขถูกและตำแหน่งถูก
  * 🟨 **Inexact** → ตัวเลขถูกแต่ตำแหน่งผิด
  * ⬜ **No Match** → ไม่มีอยู่ในรหัส

---

### 4. Peg Chooser (0–9 in Two Rows)

* ตัวเลือกตัวเลขครบ **10 ตัว (0–9)**
* จัดเรียงเป็น **2 แถว**
* ผู้เล่นสามารถกดเลือกเพื่อใส่ในตำแหน่งที่เลือก

---

### 5. Dynamic PIN Length (3–6 Digits)

* รหัสสามารถมีความยาวตั้งแต่ **3 ถึง 6 หลัก**
* ระบบรองรับการเปลี่ยนแปลงจำนวน digit ได้แบบ dynamic

---

### 6. Randomized New Game

* เมื่อเริ่มเกมใหม่ (Restart)
* ระบบจะสุ่ม:

  * จำนวน digit (3–6)
  * ค่าของ PIN
* ทำให้แต่ละเกมมีความแตกต่างกัน

---

### 7. Restart Function

* มีปุ่ม **Restart**
* ใช้สำหรับเริ่มเกมใหม่ทันที
* รีเซ็ตสถานะทั้งหมดของเกม

---

### 8. Animation & UI Interaction

* มี animation เพื่อเพิ่มความลื่นไหลของ UI เช่น

  * Peg เด้งเมื่อกดเลือก
  * Guess row และ Attempt row มี transition
  * เปลี่ยนสี Peg แบบ smooth ตามผลลัพธ์
  * Restart มี animation transition
* ใช้ SwiftUI Animation และ Transition อย่างเหมาะสม

---

## Team Members

* พลอยพรรณ เต็งประยูร
  รหัสนักศึกษา: 6510615245

* นัชชานนท์ โปษยาอนุวัตร์
  รหัสนักศึกษา: 6510615146

---

## Demo VDO

Link: https://youtu.be/dl8fZqkRdPo

---

## GitHub Repository

Link: https://github.com/npybird/as2-pinbreaker

