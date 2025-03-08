FROM ubuntu:latest
WORKDIR /app

# نصب پیش‌نیازها
RUN apt update && apt install -y \
    git curl build-essential libssl-dev zlib1g-dev \
    libpcre3-dev libevent-dev gcc make

# کلون کردن سورس و کامپایل
RUN git clone https://github.com/TelegramMessenger/MTProxy.git && \
    cd MTProxy && \
    make && \
    cp objs/bin/mtproto-proxy /app/

# تنظیمات اجرای پروکسی
CMD ["/app/mtproto-proxy", "-u", "nobody", "-p", "8888", "-H", "443", "-S", "YOUR_SECRET", "--aes-pwd", "proxy-secret", "proxy-multi.conf", "-M", "1"]
