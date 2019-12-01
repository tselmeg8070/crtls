import mysql.connector

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  passwd="password",
  database="grinders"
)


#fname(varchar), lname(varchar), id_number(varchar), phone_number(int), location(text), password(varchar)
#query = "CREATE TABLE `users` ( `fname` VARCHAR(255), `lname` VARCHAR(255), `id_number` VARCHAR(255), `phone_number` INT(8), `location` TEXT(30000), `password` VARCHAR(255))"
#mydb.cursor().execute(query)

#users dotor data nemej baigaa baidal

#sql = "INSERT INTO users (fname, lname, id_number, phone_number,location, password ) VALUES (%s, %s, %s, %s, %s, %s)"
#val = ("BURI", "Batjargal", "UM00312716", "80501464", "Bayanzurkh district 2th khoroo 35-8", "otgonjargal")
#mycursor = mydb.cursor()
#mycursor.execute(sql, val)
#mydb.commit()
#print(mycursor.rowcount, "record inserted.")

cursor = mydb.cursor()
cursor.execute('select * from users;')
a = cursor.fetchall()
print(a)
