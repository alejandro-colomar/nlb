NginX network load balancer for `<alejandro-colomar.es>`.


________________________________________________________________________________

Deployment
==========

Deploy with default values (stable)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: BASH

	sudo make stack-deploy;

Configure the load balancer of ``www`` to point to ``stable``:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: BASH

	make www-stable;
	sudo make stack-reboot;

Configure the load balancer of ``www`` to point to ``test``:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: BASH

	make www-test;
	sudo make stack-reboot;

Turn off the load balancer
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: BASH

	make stack-rm;
