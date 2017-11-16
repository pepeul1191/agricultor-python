## Boilerplate Flask Python

Requisitos de software previamente instalado:

	+ Python 2.7
	+ Python PIP
	+ NodeJS - NPM - Gulp

### Descipción

Servicio web desarrollado en PHP usando el framework FlightPHP, con patrones de diseño front-controller y distpacher y la interfaz de Idiorm para interactuar con la base de datos.

Instalación de dependencias:

	$ sudo pip install -r requirements.txt && npm install && bower install 

### Migraciones

Ejecutar migración

	$ sequel -m path/to/migrations postgres://host/database
	$ sequel -m path/to/migrations sqlite://db/db_agricultor.db

Ejecutar el 'down' de las migraciones de la última a la primera:

	$ sequel -m db/migrations -M 0 sqlite://db/db_agricultor.db

Ejecutar el 'up' de las migraciones hasta un versión especifica:

	$ sequel -m db/migrations -M #version sqlite://db/db_agricultor.db

Tipos de Datos de Columnas

	+ :string=>String
	+ :integer=>Integer
	+ :date=>Date
	+ :datetime=>[Time, DateTime].freeze, 
	+ :time=>Sequel::SQLTime, 
	+ :boolean=>[TrueClass, FalseClass].freeze, 
	+ :float=>Float
	+ :decimal=>BigDecimal
	+ :blob=>Sequel::SQL::Blob

### Rutas

	+ GET -> / : IndexController#index
	+ GET -> /error/404 : ErrorController#error_404
	+ POST -> /usuario/acceder : UsuarioController#acceder

### Generar 'dist'
	
	$ gulp layout && gulp app && gulp error-css

### Fuentes:

	+ http://flask.pocoo.org/
	+ http://exploreflask.com/en/latest/blueprints.html

Thanks/Credits

    Pepe Valdivia: developer Software Web Perú [http://softweb.pe]