import os

from flask import Flask
from flask_rebar import errors, Rebar
from marshmallow import fields, Schema

rebar = Rebar()

registry = rebar.create_handler_registry(prefix='/v1')


class TodoSchema(Schema):
    id = fields.Integer()
    complete = fields.Boolean()
    description = fields.String()

# This schema will validate the incoming request's query string


class GetTodosQueryStringSchema(Schema):
    complete = fields.Boolean()

# This schema will marshal the outgoing response


class GetTodosResponseSchema(Schema):
    data = fields.Nested(TodoSchema, many=True)


@registry.handles(
    rule='/todos',
    method='GET',
    query_string_schema=GetTodosQueryStringSchema(),
    # for versions <= 1.7.0, use marshal_schema
    response_body_schema=GetTodosResponseSchema(),
)
def get_todos():
    """
    This docstring will be rendered as the operation's description in
    the auto-generated OpenAPI specification.
    """
    # The query string has already been validated by `query_string_schema`
    complete = rebar.validated_args.get('complete')

    ...

    # Errors are converted to appropriate HTTP errors
    raise errors.Forbidden()

    ...

    # The response will be marshaled by `marshal_schema`
    return {'data': []}


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    rebar.init_app(app)

    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        app.config.from_pyfile('config.py', silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route("/hello")
    def home():
        return "Hello, World!"

    from . import db
    db.init_app(app)

    from . import auth
    app.register_blueprint(auth.bp)

    from . import blog
    app.register_blueprint(blog.bp)
    app.add_url_rule('/', endpoint='index')

    return app
