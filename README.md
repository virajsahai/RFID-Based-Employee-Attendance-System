This project implements a RFID based employee attendance system using Arduino Uno

The system is fully capabale of handling all types of cases mentioned in the SDS, "RFID Based Employee Attendance System.docx" and these in general include all the expected outcomes and scenarios of such a system.

SOME IMPORTANT POINTS-----

1.  To understand the design of the system refer to "RFID Based Employee Attendance System.docx"
2.  The ER diagram can be found in "ER Diagram.docx"
3.  The MySQL DB is saved as "employee.sql". Make sure to import it before use.
4.  For quick referencing for every employee with certain "emp_id", say n, a separate table named as "n_attn_mon" is created which keeps a track of the months the          employee was present. Next say employee was present at least on one day in Dec 2016, then this data will be stored in "n_attn_mon" as "122016". Also a table for        that month, here Dec, will be created as "n_122016" and this table will keep the day to day attendance track for the employee. This makes future referencing     easier.
5.  The arduino sketch is stored under Arduino Sketch folder.
6.  For the system Arduino Uno and MFRC522 RFID Sensor has been used. The corresponding MFRC522 libraries can be found at https://github.com/miguelbalboa/rfid and is
    courtesy of a fellow github user Miguel Balboa and he holds the license rights. Although the main MFRC522.cpp and MFRC522.h files have been included with the           project. For installation of these libraries follow Miguel's instructions.
7.  For the setup of the Arduino, feel free to ping me at virajsahai32@hotmail.com or vsahai@usc.edu. They can however be understood from the code too.
8.  Python has been used for interfacing between the Arduino and the MySQL Db.
9.  Before using the system don't forget to install the respective Python libraries.
10. The system was coupled with an employee portal website which I can't push to Git as I have lost the code and the files. However, I have created a temporary Python     file input.py to input new user data to the Database.