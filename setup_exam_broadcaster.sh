#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install Wireshark
echo "Installing Wireshark..."
sudo apt install -y wireshark

# Add current user to the Wireshark group
echo "Adding user to the Wireshark group..."
sudo usermod -aG wireshark $(whoami)

# Install Nmap
echo "Installing Nmap..."
sudo apt install -y nmap

# Install Python3 if not already installed
echo "Installing Python3..."
sudo apt install -y python3

# Create a Python script for broadcasting exam questions
echo "Creating exam broadcaster script..."
cat << 'EOF' > /home/pi/exam_broadcaster.py
import socket
import time

def broadcast_exam_questions(questions):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server_socket.bind(('', 12345))  # Bind to all interfaces on port 12345

    for question in questions:
        server_socket.sendto(question.encode(), ('<broadcast>', 12345))
        print(f"Broadcasting: {question}")
        time.sleep(2)  # Wait for 2 seconds between questions

    server_socket.close()

if __name__ == "__main__":
    exam_questions = [
        "Question 1: What is the capital of France?",
        "Question 2: What is 2 + 2?",
        "Question 3: What is the boiling point of water?"
    ]
    broadcast_exam_questions(exam_questions)
EOF

# Make the Python script executable
chmod +x /home/pi/exam_broadcaster.py

# Set up basic firewall rules using iptables
echo "Setting up firewall rules..."
sudo iptables -A INPUT -p udp --dport 12345 -j ACCEPT  # Allow exam broadcasting port
sudo iptables -A INPUT -j DROP  # Drop all other incoming traffic

# Instructions for the user
echo "Setup complete!"
echo "You can run the exam broadcaster using the following command:"
echo "python3 /home/pi/exam_broadcaster.py"
echo "To capture network traffic, run Wireshark."
echo "Log out and log back in for Wireshark permissions to take effect."