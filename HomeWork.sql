import sqlite3
import os
  
if os.path.exists('students.db'):
    os.remove('students.db')

conn = sqlite3.connect('students.db')
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE IF NOT EXISTS STUDENTS(
  ID INTEGER PRIMARY KEY,
  NAME TEXT NOT NULL,
  GRADE INTEGER NOT NULL,
  BIRTHYEAR INTEGER
);
''')

data = [
  (1, 'Noa', 85, 2010),
  (2, 'Lior', 90, 2011),
  (3, 'Dana', 78, 2009)
]


#4
cursor.executemany('''INSERT INTO STUDENTS (ID,NAME,GRADE,BIRTHYEAR)
VALUES (?,?,?,?);
''',data)


#5
cursor.execute('''
UPDATE STUDENTS 
SET GRADE = 88 
WHERE NAME = 'Dana';
''')


#6
cursor.execute('''
DELETE FROM STUDENTS WHERE ID = 2;
''')


#7
cursor.execute('''
SELECT * FROM STUDENTS
''')
result = cursor.fetchall()
for row in result:
    print(row)


#8
while True:
    try:
        id1 = int(input('Enter your ID:'))
        name = str(input('Enter your Name: '))
        grade = float(input('Enter your Grade: '))
        birthyear = float(input('Enter your Birthyear'))
        cursor.execute('''
                INSERT INTO STUDENTS(ID,NAME,GRADE,BIRTHYEAR)
                VALUES (?,?,?,?);''', (id1, name, grade, birthyear))
        cursor.execute('''
            SELECT * FROM STUDENTS WHERE ID = ?;
        ''', (id1,))
        result = cursor.fetchall()
        for row in result:
            print(row)
        break
    except Exception as ValueError:
        print("You must enter an NUMBER")




conn.commit()
conn.close()
