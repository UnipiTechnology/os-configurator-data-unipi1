
# Directory to specify Unipi extensions connected to Unipi 1.x boards via I2C bus.

Currently we support only EMO-RO8 extension

To define connection create in this directory (/etc/unipi-id) file with name

    module_id.N

where N is number 1..7 according to extension address 0x21..0x27

This file must contain text:

    0018


#Example:
-------------- 
- You have two EMO-RO8 extensions.
- One is on address 0x21, second is on address 0x25
- To specify this connection use following commands

    echo 0018 > /etc/unipi-id/module_id.1
    echo 0018 > /etc/unipi-id/module_id.5

- After changing configuration, call os-configurator and reboot 

    os-configurator --force
    reboot

