#Importing the necessary module see requirements.txt
from flask import Flask       
import os          

#Declare the app as Flask
app = Flask(__name__)            

#Declare the web path and function
@app.route("/hello")                  
def hello():                     
    return "Hello Brand new World!"     

#Run main
if __name__ == "__main__":    
    app.run(host='0.0.0.0', port=8080)
