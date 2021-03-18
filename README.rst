NginX network load balancer for `<alejandro-colomar.es>`.


________________________________________________________________________________

Deployment
==========

Update the digest in the manifests to match the current architecture.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Run this before any of the other commands.  Re-run this after checking out
any git commit, because the default digest may be the digest of a different
architecture.

.. code-block:: BASH

	make digest;

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
