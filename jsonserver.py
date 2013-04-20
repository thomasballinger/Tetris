from flask import Flask, request
app = Flask(__name__)

import json

scores = []

def score_sort(score):
    return score.get('score', -1)


{'score': 123,
 'name' : 'tom'}

@app.route("/scores", methods=["GET", "POST"])
def hello():
    if request.method == 'POST':
        scores.append(json.loads(request.data or request.form.keys()[0]))
        scores.sort(key=score_sort)
        return 'OK\n'
    else:
        return json.dumps(scores)

@app.route("/reset")
def reset():
    global scores
    scores = set()

if __name__ == "__main__":
    app.run(port=12345, host='', debug=False)
