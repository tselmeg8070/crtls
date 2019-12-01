# Importing modules
from flask import Flask, request, jsonify
import utils, pymongo
from pymongo import MongoClient
from bson.objectid import ObjectId
import jwt, datetime

# initilizing the web app
app = Flask(__name__)

# Database connector
client = MongoClient('mongodb://localhost:27017')

# Creatin a database
db = client['grinders']

# view with route register
# registers user to the database collection
@app.route('/register', methods=['POST'])
# Only POST method is allowed
def register():
 collection = db['users']
 if request.method == "POST":
# Check for request method
   data = request.json
   try:
# We created a unique index for phone numbers so id doesn't register a duplicate phone number
    result = collection.insert_one(data)
   except:
    return 'phone number exists!'
   else:
    return str(result.inserted_id)

# view with route login
@app.route('/login', methods=['POST'])
# only post request is accepted
def login():
 collection = db['users']
 if request.method == "POST":
# Login form data is received by following line of code
  data = request.json
  password_check = [x for x in collection.find({'phone_number' : data['phone_number']})][0]['password']
# Find the data of corresponding unique field 'phone_number'
  user_data = [x for x in collection.find({'phone_number' : data['phone_number']},{'password' : 0})][0]
  id = str(user_data['_id'])
  del user_data['_id']
  user_data.update({'_id' : id})
  result = dict()
# Standartizing the API data that will be sent back to the requester
  if data['password'] == password_check:
# Comparing the submitted password field data to the registered username's password
   encode_data = user_data.copy()
   encode_data.update({'expire_time' : (datetime.datetime.utcnow() + datetime.timedelta(minutes=180)).timestamp() })
# Creating the JSON Web Token
   result.update({'token' : jwt.encode(encode_data,'secret',algorithm='HS256')})
# setting the encoding algorithm to HS256 which will be decoded in the future using the same technique before told
   result.update({'user' : user_data})
   return result
  else:
   return 'Password does not match!'

# Sending a dummy data if token is valid
@app.route('/home')
def home():
 token = request.headers.get('Authorization')
 decoded = jwt.decode(token,'secret','HS256')
 exp_time = decoded['expire_time']
# session time information was encoded into the data written above
# checking if token time is valid
 dummy_data = {'income' : "1237520", "available_savings" : "458130" , "outcome" : "779390", "savings" : "{}".format(1237520-779390), "outcomes" : [{"title" : 'PCMALL', 'amount':'450000'},{'title':"EMART",'amount':"173560"},{'title':"YUNA_KOREAN", 'amount':"36450"},{'title':"STEAM.MN",'amount': "80000"},{'title':"ORGIO_KITCHEN",'amount':"39380"}]}
 if datetime.datetime.utcnow().timestamp() - exp_time > 0:
  return 'token expired'
 else:
  return jsonify(dummy_data)

#idk
@app.route('/state')
def check_state():
 return 'check for token valdity'

# NOSQL Relation
@app.route('/create_team', methods=['POST','GET'])
# route accepts post & get request
def teams():
# block command will be executed if post request is sent to this route
 if request.method == "POST":

# --------------------------------------------------#
# Finding similar from documents given by requester #
# --------------------------------------------------#

  collection_teams = db['teams']
  collection_users = db['users']

# Bunch of data standartizing
  request_data = request.json
  user_info_many = list()
  for p_num in request_data['phone_numbers'].replace(' ', "").split(','):
   user_data = [data for data in collection_users.find({'phone_number' : p_num},{"_id" : 1}) ]
   id = str(user_data[0]['_id'])
   del user_data[0]['_id']
   user_data[0].update({'_id' : id})
   user_info_many.append(user_data[0])
  collection_teams.insert_one({'members' : user_info_many, 'amount' : request_data['amount'], 'title' : request_data['title']})
  return jsonify(user_info_many)

# just some dummy data made for some view
@app.route('/teamsv2', methods=['GET','POST'])
def teamsv2():
 if request.method == "GET":
  collection_teams = db['teams']
  collection_users = db['users']
  result = {}
  last = {'teams' : []}
  for data in collection_teams.find():
   import random as rn
   a = {'_id':str(data['_id']),'title' : data['title'], 'amount' : data['amount'], 'deadline' : str( (datetime.datetime.utcnow() + datetime.timedelta(days=rn.randint(60,90))).date() ), 'progress' : '0'}
   last['teams'].append(a)
  from pprint import pprint
  pprint(last)
  return jsonify(last)


@app.route('/team_info', methods=['POST'])
def team_info():
 team = db['teams']
 users = db['users']
 if request.method == 'POST':
   result = {'members' : []}
   data = request.json
   team_info = [x for x in team.find({'_id' : ObjectId( data['_id'])})][0]['members']
   for member in team_info:
    member_info = [x for x in users.find({'_id' : ObjectId(member['_id'])},{'lname' : 1, 'fname' : 1, 'phone_number' : 1})]
    print(member_info)
    result['members'].append(member_info)
   return jsonify(team_info)



#real shit begins here
@app.route('/transaction', methods=['GET'])
def transaction():
 if request.method == "GET":
  collection_transaction = db['transaction']
  pass

@app.route('/user_data')
def user_data():
 collection = db['users']
 result = {}
 for data in collection.find():
  result.update({str(data):data})
 return jsonify(result)

# running the web app & making it visible on network with port number 5000
if __name__ == "__main__":
 app.run(host='0.0.0.0',debug=True,port=5000)

#teams
#* {
# * _id: ObjectID,
# * title: String,
# * amount: int,
# * deadline: Unix timestamp,
# * members: [User Object ID, ]
# * }

#transaction_data
#/**
# * {
# *  _id: ObjectID,
# *  user_id: ObjectID,
# *  team_id: ObjectID,
# *  amount: int,
# *  date: Unix Time stamp
# * }
#*/
