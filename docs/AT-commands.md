### AT command
*(ATtention command set) A series of machine instructions used to activate features on an analog modem. *
**The instructions used for controlling the mobile phone or GSM/GPRS modem**
For raspi, when we do these command we should expect OK
```python
    port.write('AT'+'\r\n')
    rcv = port.read(10)
    print rcv
```
The part 'AT+CMGF=1" enable text mode. If = 0 will be in PDU mode.
```python
    port.write('AT+CMGF=1'+'\r\n')  # Select Message format as Text mode 
    rcv = port.read(10)
    print rcv
```

Few **SEND** command

| AT command |                   Meaning |
|-----------:|--------------------------:|
| +CMGS      | Send message              |
| +CMSS      | Send message from storage |
| +CMGW      | Write message to memory   |
| +CMGD      | delete meddage            |
| +CMGC      | send command              |
| +CMMS      | More messages to send     |

To send a command we use AT+[+name of the command]

When executed AT command, OK will always be returned if succed else ERROR

Few **RECIEVE** command

| AT command |                     Meaning |
|-----------:|----------------------------:|
| +CNMI      | New message indication      |
| +CMGL      | List messages               |
| +CMGR      | Read messages               |
| +CNMA      | New message acknowledgement |
[EXEMPLE USAGE](https://www.developershome.com/sms/howToReceiveSMSUsingPC.asp)

```AT
    AT+CMGL="ALL"
    +CMGL: 1,"REC READ","+85291234567",,"06/11/11,00:30:29+32"
    Hello, welcome to our SMS tutorial.
    +CMGL: 2,"REC READ","+85291234567",,"06/11/11,00:32:20+32"
```
    A simple demo of SMS text messaging.
