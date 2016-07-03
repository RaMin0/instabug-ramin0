object @app

node(:count) { |app| app.bugs_count(cached: false) }
