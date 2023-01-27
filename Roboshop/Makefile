help:		## Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/://' -e 's/##//'
frontend:	## Install Frontend Component
	@bash frontend.sh
catalogue:	## Install Catalogue Component
	@bash catalogue.sh
cart:		## Install Cart Component
	@bash cart.sh
user:		## Install User Component
	@bash user.sh
shipping:	## Install Shipping Component
	@bash shipping.sh
payment:		## Install Payment Component
	@bash payment.sh
mongodb:		## Install MongoDB Component
	@bash mongodb.sh
redis:		## Install Redis Component
	@bash redis.sh
mysql:		## Install MySQL Component
	@bash mysql.sh
rabbitmq:	## Install RabbitMQ Component
	@bash rabbitmq.sh
databases:	## Install All Databases
databases:	mongodb redis mysql rabbitmq

