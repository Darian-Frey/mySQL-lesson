import os
import pymongo

if os.path.exists("env.py"): # if env.py exists
    import env


MONGO_URI = os.environ.get("MONGO_URI")
DATABASE = "myFirstDB"
COLLECTION = "celebrities"


def mongo_connect(url):
    try:
        conn = pymongo.MongoClient(url)
        print("Mongo is connected")
        return conn
    except pymongo.errors.ConnectionFailure as e:
        print("Could not connect to MongoDB: %s") % e


conn = mongo_connect(MONGO_URI)

coll = conn[DATABASE][COLLECTION]

'''
#insert one item into DB
new_doc = {"first": "douglas", "last": "adams", "dob": "11/03/1952", "hair_color": "grey", "occupation": "writer", "nationality": "british"}

coll.insert(new_doc)
'''

'''
# insert multiple items into DB
new_docs = [{
    "first": "terry",
    "last": "pratchett",
    "dob": "28/04/1948",
    "gender": "m",
    "hair_color": "not much",
    "occupation": "writer",
    "nationality": "british"
}, {
    "first": "george",
    "last": "rr martin",
    "dob": "20/09/1948",
    "gender": "m",
    "hair_color": "white",
    "occupation": "writer",
    "nationality": "american"
}]

coll.insert_many(new_docs)
'''

'''
#show all DB
documents = coll.find()
'''

'''
# show item with first name douglas
documents = coll.find({"first": "douglas"})
'''

'''
# removes items with frist name douglas
coll.remove({"first": "douglas"})
'''

# change the first item with the nationality american to hair_color maroon
# to change more than one change update_one to update_many
coll.update_one({"nationality": "american"}, {"$set": {"hair_color": "maroon"}})

documents = coll.find()

for doc in documents:
    print(doc)


