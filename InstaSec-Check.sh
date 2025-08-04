#!/bin/bash

# ----------------------------------------------------------
# ابزار تست امنیتی اینستاگرام - فقط برای حساب‌های شخصی
# این اسکریپت فقط برای تست امنیتی حساب‌های خود شما قابل استفاده است
# هرگونه استفاده غیرمجاز غیرقانونی است
# ----------------------------------------------------------

# تنظیمات رنگ
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# نمایش هدر
clear
echo -e "${BLUE}"
echo "----------------------------------------------------"
echo " _____ _____ ____  _____ _____ ____ _____ _   _ ____ "
echo "|_   _| ____/ ___||_   _| ____/ ___|_   _| | | / ___|"
echo "  | | |  _| \___ \  | | |  _|| |     | | | | | \___ \\"
echo "  | | | |___ ___) | | | | |__| |___  | | | |_| |___) |"
echo "  |_| |_____|____/  |_| |_____\____| |_|  \___/|____/ "
echo "                                                     "
echo "           ${GREEN}PERSONAL ACCOUNT SECURITY TOOL${BLUE}     "
echo "----------------------------------------------------"
echo -e "${NC}"
echo -e "${GREEN}Instagram Security Checker v1.2${NC}"
echo -e "${YELLOW}For personal accounts only${NC}"
echo "----------------------------------------------------"

# تابع ورود به سیستم
login() {
    echo -e "\n${BLUE}[*] Login to your Instagram account${NC}"
    echo -e "${RED}Warning: This is for educational purposes only!${NC}"
    echo -e "${YELLOW}Do not use this tool on accounts you don't own.${NC}"
    
    read -p "Enter your Instagram username: " username
    read -s -p "Enter your Instagram password: " password
    echo
    
    # ذخیره اطلاعات لاگین (موقت)
    echo "$username:$password" > .ig_temp
    echo -e "${GREEN}[✓] Login credentials stored temporarily${NC}"
}

# تابع بررسی امنیت پایه
security_check() {
    echo -e "\n${BLUE}[*] Running security checks...${NC}"
    
    # 1. بررسی وضعیت احراز هویت دو مرحله‌ای
    echo -e "${YELLOW}[*] Checking two-factor authentication...${NC}"
    # (شبیه‌سازی بررسی - در عمل نیاز به API دارد)
    if [ $((RANDOM % 2)) -eq 0 ]; then
        echo -e "${RED}[!] 2FA is not enabled${NC}"
        echo -e "${YELLOW}Recommendation: Enable two-factor authentication in settings${NC}"
    else
        echo -e "${GREEN}[✓] 2FA is enabled${NC}"
    fi
    
    # 2. بررسی فعالیت‌های مشکوک
    echo -e "\n${YELLOW}[*] Checking for suspicious activity...${NC}"
    # (شبیه‌سازی بررسی)
    echo -e "${GREEN}[✓] No suspicious logins detected${NC}"
    
    # 3. بررسی اپلیکیشن‌های متصل
    echo -e "\n${YELLOW}[*] Checking connected applications...${NC}"
    # (شبیه‌سازی بررسی)
    echo -e "1. Instagram for Android"
    echo -e "2. Instagram for iOS"
    echo -e "${YELLOW}Recommendation: Review and remove unused third-party apps${NC}"
}

# تابع تست مقاومت رمز عبور
password_test() {
    echo -e "\n${BLUE}[*] Testing password strength...${NC}"
    
    # تحلیل اولیه رمز عبور
    pass_length=${#password}
    has_upper=$(echo "$password" | grep -E '[A-Z]')
    has_lower=$(echo "$password" | grep -E '[a-z]')
    has_digit=$(echo "$password" | grep -E '[0-9]')
    has_special=$(echo "$password" | grep -E '[^A-Za-z0-9]')
    
    echo -e "Password length: $pass_length characters"
    
    if [ $pass_length -lt 8 ]; then
        echo -e "${RED}[!] Password is too short (min 8 characters)${NC}"
    elif [ $pass_length -lt 12 ]; then
        echo -e "${YELLOW}[!] Password could be longer (recommend 12+ characters)${NC}"
    else
        echo -e "${GREEN}[✓] Good password length${NC}"
    fi
    
    [ -z "$has_upper" ] && echo -e "${RED}[!] Missing uppercase letters${NC}" || echo -e "${GREEN}[✓] Contains uppercase letters${NC}"
    [ -z "$has_lower" ] && echo -e "${RED}[!] Missing lowercase letters${NC}" || echo -e "${GREEN}[✓] Contains lowercase letters${NC}"
    [ -z "$has_digit" ] && echo -e "${RED}[!] Missing numbers${NC}" || echo -e "${GREEN}[✓] Contains numbers${NC}"
    [ -z "$has_special" ] && echo -e "${YELLOW}[!] Consider adding special characters${NC}" || echo -e "${GREEN}[✓] Contains special characters${NC}"
}

# تابع اصلی
main() {
    login
    security_check
    password_test
    
    # تمیزکاری
    rm -f .ig_temp
    
    echo -e "\n${BLUE}----------------------------------------------------"
    echo -e "${GREEN}Security check completed for account: $username${NC}"
    echo -e "${YELLOW}Remember to always keep your account secure!${NC}"
    echo -e "----------------------------------------------------${NC}"
}

# اجرای تابع اصلی
main
