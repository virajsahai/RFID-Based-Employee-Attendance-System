#!/usr/bin/python
import serial
import MySQLdb
from datetime import datetime
dbConn=MySQLdb.connect("127.0.0.1","root","mobile","employee")or die("couldn't connect to DB") ##Dont forget to change the username and password for the mysql db

device="\\.\COM3" ##Change this to the COMM port where your Arduino is Connected
while True:
    cursor=dbConn.cursor() ##Defining a DB Cursor
    try:
        print "Trying...",device
        arduino=serial.Serial(device, 9600) ##Make sure the baud rate is synched between your COM Port and the Arduino
    except serial.SerialException:
        a=0
    try:
        data=""
        data=arduino.readline();
        data=data.strip();
        data=" "+data
        arduino.flush()
        try:
            cursor.execute("select emp_id, emp_name from employee_dat where rfid_num=(%s)",(data))
            result=cursor.fetchone()
            if result:
                empl_id=result[0]
                empl_id=str(empl_id)
            x=int(cursor.rowcount)
            if x!=0:
                temp="select * from %s where mon_yr="%(empl_id+"_attn_mo")
                temp+="(%s)"
                
                cursor.execute(temp,(str(datetime.now().month)+str(datetime.now().year)))
                result=cursor.fetchone()
                if result:
                    mont_yr=str(result[1])
                x=int(cursor.rowcount)
                if x!=0:
                    month="%02d"%datetime.now().month
                    day="%02d"%datetime.now().day
                    hour="%02d"%datetime.now().hour
                    minute="%02d"%datetime.now().minute
                    second="%02d"%datetime.now().second
                    temp="show tables like '%s'"%(empl_id+"_"+mont_yr);
                    cursor.execute(temp)
                    tabch=cursor.fetchone()
                    
                    y=int(cursor.rowcount)
                    if y==0:
                        temp="create table %s (srl int(11) AUTO_INCREMENT NOT NULL PRIMARY KEY, att_date date, in_time time,out_time time)"%(empl_id+"_"+mont_yr)
                        cursor.execute(temp)
                        dbConn.commit()
                    temp="select * from %s where att_date='%s'"%(empl_id+"_"+mont_yr,str(datetime.now().year)+"-"+month+"-"+day)
                    cursor.execute(temp)
                    result=cursor.fetchone()
                    x=int(cursor.rowcount)
                    if x!=0:
                        if result[2] is not None:
                            if result[3] is None:
                                temp="update %s set out_time='%s' where att_date='%s'"%(empl_id+"_"+mont_yr,hour+":"+minute+":"+second,str(datetime.now().year)+"-"+month+"-"+day)
                                cursor.execute(temp)
                                print "Out Time Marked"
                                arduino.write("Out Marked")
                            else:
                                print "Entry exists"
                                arduino.write("Entry exists")
                    else:
                        temp="insert into %s (att_date,in_time) values "%(empl_id+"_"+mont_yr)
                        temp+="(%s,%s)"
                        cursor.execute(temp,(str(datetime.now().year)+"-"+month+"-"+day,hour+":"+minute+":"+second))
                        print "Attendance Marked"
                        arduino.write("Attn. marked")
                else:
                    temp="insert into %s(mon_yr) values "%(empl_id+"_attn_mo")
                    temp+="(%s)"
                    cursor.execute(temp,(str(datetime.now().month)+str(datetime.now().year)))
                    print "Scan again"
                    arduino.write("Scan Again")
            else:
                print "User doesnt exist"
                arduino.write("User not found!")
            dbConn.commit()
            arduino.flush()
            time.sleep(4) ##Time to flush the data line
            
            cursor.close()
        except MySQLdb.IntegrityError:
            print "failed to fetch data"
            a=0
        finally:
            cursor.close()
    except:
        a=0

        
    
