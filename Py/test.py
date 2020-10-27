# !/usr/bin/python
'''
██╗  ██╗ ██████╗ ████████╗██╗    ██╗ ██████╗ ██████╗ 
╚██╗██╔╝██╔═══██╗╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗
 ╚███╔╝ ██║   ██║   ██║   ██║ █╗ ██║██║   ██║██║  ██║
 ██╔██╗ ██║   ██║   ██║   ██║███╗██║██║   ██║██║  ██║
██╔╝ ██╗╚██████╔╝   ██║   ╚███╔███╔╝╚██████╔╝██████╔╝
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═════╝ 

Usage:
hex2dec.py -H 0xFFFFFFFA
return -6

if theres are spaces in the HEX value, just wrap the argument in ""
hex2dec.py -H "0xFF FF FF FA"
return -6
'''
#----Imports required argparse,pyserial----#
import argparse
import time
import serial.tools.list_ports, serial 
import io
from re import sub

#----Arg parsing----#
parser = argparse.ArgumentParser(description='Example: hex2dec.py -H 0xFFFFFFFA -C 29')
parser.add_argument("-H","--hex",metavar='',help="2's complement hex value",required=False)
parser.add_argument("-C","--com",metavar='',type=str,help="Comport for the T3439",required=True)
args = parser.parse_args()

#----Functions----#
def twos_comp(val, bits):
    """compute the 2's complement of int value val"""
    if (val & (1 << (bits - 1))) != 0: # if sign bit is set e.g., 8bit: 128-255
        val = val - (1 << bits)        # compute negative value
    return val

def stripspacesfromargsparseing(val):
    if args.hex:
        hexvaluefromargs = args.hex
        hexvaluefromargs = ''.join(hexvaluefromargs.split())
        return hexvaluefromargs
    if val:
        hexvaluefromargs = val
        hexvaluefromargs = ''.join(hexvaluefromargs.split())
        return hexvaluefromargs

def StripJunkFromUART():
    return True

#----Main----#
if __name__ == "__main__":
    
    uutcomport = args.com
    TOKCOM = "254"
    x = 0
    
    #Connect to T3439
    ser = serial.Serial()
    ser.baudrate = 9600
    ser.parity = serial.PARITY_NONE
    ser.bytesize = serial.EIGHTBITS
    ser.stopbits = serial.STOPBITS_ONE
    print("baudrate set to: %s" % ser.baudrate)
    #connect with COM
    ser.port = 'COM%s' % uutcomport
    print("T3439 COMPORT: %s" % ser.port)
    #Open com and flush bus
    ser.open()
    ser.flush()
    #Connect to Test-Track
    #Opening serial port 254 with following settings 115200,None,8,1
    ser1 = serial.Serial()
    ser1.baudrate = 9600
    ser1.parity = serial.PARITY_NONE
    ser1.bytesize = serial.EIGHTBITS
    ser1.stopbits = serial.STOPBITS_ONE
    ser1.port = TOKCOM
    print("baudrate set to: %s" % ser1.baudrate)
    #connect with COM
    ser1.port = 'COM%s' % TOKCOM
    print("TOK COMPORT: %s" % ser1.port)
    ser1.open()
    ser1.flush()


    #Start test T3439
    sendbuff = 'START\r\n'
    ser.write(sendbuff.encode('utf-8'))
    ser.write(sendbuff.encode('utf-8'))
    ser.write(sendbuff.encode('utf-8'))
    #Read 59 bytes from T3439
    buffer = ser.read(59).hex()
    buffertostr = str(buffer)
    #take the buffer and split the string at the 06 commmand
    print(buffertostr.find("06"))
    splithex = buffertostr.split("06")
    #start from 1 and count 6 up, print each val as 2comps decimal
    #Proceed to send the data over COMPORT 254 to Testtrack
    for x in range(1,7):
        print(splithex[x][0:8])
        twocompval = splithex[x][0:8]
        print(twos_comp(int(twocompval,16), 32))
        twocompdec = twos_comp(int(twocompval,16), 32)
        fortesttrack = twos_comp(int(twocompval,16), 32)
        print(twocompdec)   
        ser1.write(str(fortesttrack).encode('utf-8'))
    ser.close()
    ser1.close()