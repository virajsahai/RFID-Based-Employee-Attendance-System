import MySQLdb
from datetime import datetime
dbConn=MySQLdb.connect("127.0.0.1","root","mobile","employee_n")or die("couldn't connect to DB")
emp_name=raw_input("Enter your name: ")
emp_email=raw_input("Enter your email: ")
emp_pass=raw_input("Enter validation text: ")
emp_adr=raw_input("Enter Address: ")
emp_con=input("Enter Contact Number: ")
month="%02d"%datetime.now().month
day="%02d"%datetime.now().day
emp_date=str(datetime.now().year)+"-"+month+"-"+day
emp_rfid=raw_input("Enter given rfid number: ")
emp_rfid=" "+emp_rfid
cursor=dbConn.cursor()
cursor.execute("Select * from employee_dat where email=(%s)",(emp_email))
result=cursor.fetchall()
x=int(cursor.rowcount)
if(x!=0):
    print "User already exists"
else:
    
    cursor.execute("insert into employee_dat (emp_name,emp_pass,email,contact,emp_add,join_date,rfid_num) values (%s,%s,%s,%s,%s,%s,%s)",(emp_name,emp_pass,emp_email,emp_con,emp_adr,emp_date,emp_rfid))
    cursor.execute("select emp_id from employee_dat where email=(%s)",(emp_email))
    result=cursor.fetchone()
    result=str(result[0])
    qry="create table %s(serial int(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,mon_yr varchar(6))"%(result+"_attn_mo")
    cursor.execute(qry)
dbConn.commit()
cursor.close()

