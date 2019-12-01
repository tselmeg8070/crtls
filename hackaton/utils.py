# Simple function for encrypting a string utilizing 256 bit security algorithm
def hash_password(password):
# importing the moddule
 import bcrypt
 password = password.encode('utf-8')
 salt = bcrypt.gensalt()
 hashed = bcrypt.hashpw(password, salt)
 return hashed.decode('utf-8')




if __name__ == "__main__":

 print(hash_password('buri'))

