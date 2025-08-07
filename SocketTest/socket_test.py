import socket
import struct

def send_message(msg_id: int, payload: str):
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.connect("/tmp/sock_file")
    payload_bytes = payload.encode("utf-8")
    msg = struct.pack("!B H", msg_id, len(payload_bytes)) + payload_bytes
    sock.sendall(msg)
    sock.close()

send_message(0x01, "85")     # SPEED
send_message(0x02, "D")         # GEAR
send_message(0x03, "STOP")      # SIGN
send_message(0x04, "1")         # THEME: 1 = light, 0 = dark

