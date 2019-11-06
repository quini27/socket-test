# socket-test
The program socket test for Windows let you control the NodeMCU 1.0 board through a user-friendly interface designed using the IDE RAD Studio Tokio 10.2. The communication between the program and the board is via a WiFi connection, using a local fixed IP address.

Before using this program, it is necessary to download the sketch test_socket.ino from the Arduino IDE to the nodeMCU board. This skecth connects the board to a fixed local IP address. This IP must be a free address of the router and must be previously known. The sketch reports the status of the connection in the serial monitor and starts the loop routine. In this routine the program waits until a client is connected, reads a command sent from the client, put on or put off the builtin led according to the command, and sends the status of the builtin button (pressed or unpressed) to the client. Once these tasks are completed, it closes the connection with the client.

The program Socket test for Windows presents a Delphi developed interface. This program is based on the use of the client socket component. This component connects the program with an internet host address (which can be first introduced on a small form visible when the start button is pressed), connects the socket to the host in order to receive the sentences sent by the server, prints these sentences in a memo log (which also reports the status of the connection). The program also allows to set the status of the builtin led and to send a string to the server that the sketch loaded in the nodeMCU will be print on the serial monitor. Every time that the user clicks on the Connect button, led on or led off buttons, or send string button, the connection starts and it remains active for a few seconds, enough to the server to execute the tasks indicated by the command and to send the builtin button status.

Following the philosophy of this program, it is easy to design a control startegy on the computer to control a plant, using the nodeMCU board just as an interface, or to send the set points to adjust the output variables of the plant through the internet connection.
