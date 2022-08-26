openstack server create --image d795d957-19e4-4997-a06c-1d0725267ef3 --flavor 1ff86526-c425-4b48-87ac-83826e1b7136 --nic net-id=net1 --key-name mmaldoor_key windows-server_test

nova get-password windows-server_test mmaldoor_key.pem