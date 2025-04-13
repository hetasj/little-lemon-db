import mysql.connector

# Connect to the LittleLemonDB
conn = mysql.connector.connect(
    host="localhost",
    user="your_mysql_username",      # ← Change this
    password="your_mysql_password",  # ← Change this
    database="LittleLemonDB"
)

cursor = conn.cursor()
print("✅ Connected to the LittleLemonDB database!")

cursor.close()
conn.close()
