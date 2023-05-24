from .views import home


class routes:
    def init_app(app):
        # Register main routes.
        app.add_url_rule("/", view_func=home)
        app.add_url_rule("/home", view_func=home)
        app.add_url_rule("/index", view_func=home)
        app.add_url_rule("/index.html", view_func=home)

        # Register blueprint routes.
        # app.register_blueprint(_bp, url_prefix="")
