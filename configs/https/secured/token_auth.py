from flask import Flask, request, abort, send_file

app = Flask(__name__)

# Simple token for demonstration
VALID_TOKEN = "SECURETOKEN2026"

@app.route("/secure")
def secure_page():
    token = request.args.get("token")
    if token != VALID_TOKEN:
        abort(401)
    return send_file("index.html")

@app.route("/")
def home():
    return "Secured HTTP Service Running. Access /secure?token=SECURETOKEN2026"
    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
