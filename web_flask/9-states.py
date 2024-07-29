#!/usr/bin/python3
"""
Flask web application to display states and cities
"""

from flask import Flask, render_template
from models import storage
from models.state import State

app = Flask(__name__)

@app.teardown_appcontext
def teardown_db(exception):
    """Remove the current SQLAlchemy session"""
    storage.close()

@app.route('/states', strict_slashes=False)
def states():
    """Display a HTML page with a list of states"""
    states = storage.all(State).values()
    states = sorted(states, key=lambda state: state.name)
    return render_template('9-states.html', states=states)

@app.route('/states/<id>', strict_slashes=False)
def state_id(id):
    """Display a HTML page with a list of cities for a specific state"""
    state = None
    for s in storage.all(State).values():
        if s.id == id:
            state = s
            break
    return render_template('9-states.html', state=state)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
