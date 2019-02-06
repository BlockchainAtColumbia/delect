import os
from flask import Flask, request, Response, jsonify
from flask_cors import CORS, cross_origin

app = Flask(__name__)
cors = CORS(app)

# Sending Ballot to the Smart Contract
@app.route('/sendBallot', methods=['POST','OPTIONS'])
@cross_origin(origin='*')
def sendBallot():
    data = request.get_data()
    print(data)

    resp = jsonify(success=True)
    print(resp)
    return resp


if __name__ == "__main__":
  import click

  @click.command()
  @click.option('--debug', is_flag=True)
  @click.option('--threaded', is_flag=True)
  @click.argument('HOST', default='0.0.0.0')
  @click.argument('PORT', default=8081, type=int)
  def run(debug, threaded, host, port):
    """
    This function handles command line parameters.
    Run the server using:
        python server.py
    Show the help text using:
        python server.py --help
    """

    HOST, PORT = host, port
    print (f"running on {HOST} {PORT}")
    print (f"debug: {debug} and threaded: {threaded}")
    app.run(host=HOST, port=PORT, debug=debug, threaded=threaded)

run()
