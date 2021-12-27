# import main Flask class and request object
from flask import Flask, request, jsonify
from data_collect import get_search_stat
from flask_cors import CORS

# create the Flask app
app = Flask(__name__)
CORS(app)


@app.route('/views_info')
def query_example():
    req_name = request.args.get('key_word') or "Guitar"
    req_amount = request.args.get('req_amount') or 20
    req_order = request.args.get('req_order') or 'viewCount'

    d = get_search_stat(req_name, int(req_amount))
    object_to_send = {}
    for i in d:
        object_to_send[i[0]] = [i[1], i[2]]

    response = jsonify(object_to_send)
    response.headers.add("Access-Control-Allow-Origin", "*")
    response.headers.add("Access-Control-Allow-Headers", "*")
    response.headers.add("Access-Control-Allow-Methods", "*")
    return response


@app.route('/json-example')
def json_example():
    return 'JSON Object Example'


if __name__ == '__main__':
    # run app in debug mode on port 5000
    app.run(debug=True, port=5000)