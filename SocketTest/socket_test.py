import socket
import struct
import os
import time
import itertools

SOCKET_PATH = "/tmp/sock_file"

# Remove the socket file if it already exists
if os.path.exists(SOCKET_PATH):
    os.remove(SOCKET_PATH)

# Create the Unix domain socket server
server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
server.bind(SOCKET_PATH)
server.listen(1)

print(f"Listening on {SOCKET_PATH}... Waiting for Qt client to connect...")

# Accept one connection from Qt app
conn, _ = server.accept()
print("Client connected.")

# Helper function to send framed messages
def send_message(msg_id: int, payload: str):
    payload_bytes = payload.encode("utf-8")
    header = struct.pack("!BH", msg_id, len(payload_bytes))
    message = header + payload_bytes
    try:
        conn.sendall(message)
        print(f"Sent: msg_id=0x{msg_id:02X}, payload='{payload}'")
    except BrokenPipeError:
        print("Connection lost. Exiting.")
        conn.close()
        server.close()
        exit(1)

# Setup value sequences
gear_cycle = itertools.cycle(["P", "N", "D", "R"])
sign_cycle = itertools.cycle(["STOP", "SpeedLimit", "TurnLeft", "TurnRight"])
theme_cycle = itertools.cycle(["1", "0"])  # 1 = true, 0 = false

# Speed ramp up and down
speed_values = list(range(0, 181, 15)) + list(range(165, -1, -15))  # up to 180, then back down
speed_cycle = itertools.cycle(speed_values)

# Main loop
try:
    while True:
        speed = next(speed_cycle)
        gear = next(gear_cycle)
        sign = next(sign_cycle)
        theme = next(theme_cycle)

        send_message(0x01, f"{speed}")    # SPEED
        send_message(0x02, gear)          # GEAR
        send_message(0x03, sign)          # SIGN
        send_message(0x04, theme)         # THEME

        time.sleep(3)  # Wait 3 seconds before next update
except KeyboardInterrupt:
    print("\nServer shutting down.")
finally:
    conn.close()
    server.close()
    if os.path.exists(SOCKET_PATH):
        os.remove(SOCKET_PATH)

