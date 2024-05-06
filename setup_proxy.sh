#!/bin/bash

# Hỏi người dùng nhập danh sách các địa chỉ IP, cách nhau bằng khoảng trắng
read -p "Nhập danh sách các địa chỉ IP (cách nhau bằng khoảng trắng): " IP_LIST

# Hỏi người dùng nhập tên người dùng
read -p "Nhập tên người dùng: " USERNAME

# Hỏi người dùng nhập mật khẩu
read -sp "Nhập mật khẩu: " PASSWORD
echo

# Chuyển đổi chuỗi IP_LIST thành một mảng
read -ra IP_ARRAY <<< "$IP_LIST"

# Vòng lặp để tạo tài khoản cho mỗi địa chỉ IP trong danh sách
for IP in "${IP_ARRAY[@]}"
do
    # Tạo tài khoản và mật khẩu cho mỗi địa chỉ IP
    htpasswd -b /etc/squid/squid_passwd "${USERNAME}_${IP}" "${PASSWORD}"
done
