{
# delete the log file if exists
if [ -f "uhd_uninstall_output.txt" ]; then
    rm "uhd_uninstall_output.txt"
    echo "Deleted uhd_uninstall_output.txt"
else
    echo "uhd_uninstall_output.txt not found"
fi

if [ -d "/usr/lib/pkgconfig/uhd.pc" ]; then
  if sudo rm -rf /usr/lib/pkgconfig/uhd.pc; then
    echo "Successfully removed /usr/lib/pkgconfig/uhd.pc"
  fi
else
  echo "/usr/lib/pkgconfig/uhd.pc does not exist"
fi

if [ -d "/usr/lib/cmake/uhd" ]; then
  if sudo rm -rf /usr/lib/cmake/uhd; then
    echo "Successfully removed /usr/lib/cmake/uhd"
  fi
else
  echo "/usr/lib/cmake/uhd does not exist"
fi

if [ -d "/usr/lib/libuhd*" ]; then
  if sudo rm -rf /usr/lib/libuhd*; then
    echo "Successfully removed /usr/lib/libuhd*"
  fi
else
  echo "/usr/lib/libuhd* does not exist"
fi

if [ -f "/usr/include/uhd.h" ]; then
  if sudo rm -rf /usr/include/uhd.h; then
    echo "Successfully removed /usr/include/uhd.h"
  fi
else
  echo "/usr/include/uhd.h does not exist"
fi

if [ -d "/usr/include/uhd" ]; then
  if sudo rm -rf /usr/include/uhd; then
    echo "Successfully removed /usr/include/uhd"
  fi
else
  echo "/usr/include/uhd does not exist"
fi

if [ -d "/usr/share/uhd" ]; then
  if sudo rm -rf /usr/share/uhd; then
    echo "Successfully removed /usr/share/uhd"
  fi
else
  echo "/usr/share/uhd does not exist"
fi

if [ -d "/usr/lib/uhd" ]; then
  if sudo rm -rf /usr/lib/uhd; then
    echo "Successfully removed /usr/lib/uhd"
  fi
else
  echo "/usr/lib/uhd does not exist"
fi

if [ -f "/usr/bin/uhd*" ]; then
  if sudo rm -rf /usr/bin/uhd*; then
    echo "Successfully removed /usr/bin/uhd*"
  fi
else
  echo "/usr/bin/uhd* does not exist"
fi

if [ -f "/usr/bin/usrp*" ]; then
  if sudo rm -rf /usr/bin/usrp*; then
    echo "Successfully removed /usr/bin/usrp*"
  fi
else
  echo "/usr/bin/usrp* does not exist"
fi

if [ -f "/usr/bin/rfnoc*" ]; then
  if sudo rm -rf /usr/bin/rfnoc*; then
    echo "Successfully removed /usr/bin/rfnoc*"
  fi
else
  echo "/usr/bin/rfnoc* does not exist"
fi

if [ -d "/usr/share/doc/uhd" ]; then
  if sudo rm -rf /usr/share/doc/uhd; then
    echo "Successfully removed /usr/share/doc/uhd"
  fi
else
  echo "/usr/share/doc/uhd does not exist"
fi

if [ -d "/usr/share/man/man1/uhd*" ]; then
  if sudo rm -rf /usr/share/man/man1/uhd*; then
    echo "Successfully removed /usr/share/man/man1/uhd*"
  fi
else
  echo "/usr/share/man/man1/uhd* does not exist"
fi

if [ -d "/usr/share/man/man1/usrp*" ]; then
  if sudo rm -rf /usr/share/man/man1/usrp*; then
    echo "Successfully removed /usr/share/man/man1/usrp*"
  fi
else
  echo "/usr/share/man/man1/usrp* does not exist"
fi

if [ -d "/usr/lib/python3/dist-packages/uhd" ]; then
  if sudo rm -rf /usr/lib/python3/dist-packages/uhd; then
    echo "Successfully removed /usr/lib/python3/dist-packages/uhd"
  fi
else
  echo "/usr/lib/python3/dist-packages/uhd does not exist"
fi

if [ -d "/usr/lib/python3/dist-packages/usrp*" ]; then
  if sudo rm -rf /usr/lib/python3/dist-packages/usrp*; then
    echo "Successfully removed /usr/lib/python3/dist-packages/usrp*"
  fi
else
  echo "/usr/lib/python3/dist-packages/usrp* does not exist"
fi

if [ -f "/usr/bin/e320_bist" ]; then
  if sudo rm -rf /usr/bin/e320_bist; then
    echo "Successfully removed /usr/bin/e320_bist"
  fi
else
  echo "/usr/bin/e320_bist does not exist"
fi

if [ -f "/usr/bin/aurora_bist_test.py" ]; then
  if sudo rm -rf /usr/bin/aurora_bist_test.py; then
    echo "Successfully removed /usr/bin/aurora_bist_test.py"
  fi
else
  echo "/usr/bin/aurora_bist_test.py does not exist"
fi

if [ -d "/usr/share/uhd" ]; then
  if sudo rm -rf /usr/share/uhd; then
    echo "Successfully removed /usr/share/uhd"
  fi
else
  echo "/usr/share/uhd does not exist"
fi


}  |& tee -a >(while read line; do echo "$(date "+%Y-%m-%d %H:%M:%S") $line"; done > uhd_uninstall_output.txt)
