{
# delete the log file if exists
if [ -f "uhd_uninstall_output.txt" ]; then
    rm "uhd_uninstall_output.txt"
    echo "Deleted uhd_uninstall_output.txt"
else
    echo "uhd_uninstall_output.txt not found"
fi

sudo rm -rf /usr/share/doc/uhd
sudo rm -rf /usr/lib/pkgconfig/uhd.pc
sudo rm -rf /usr/lib/cmake/uhd
sudo rm -rf /usr/lib/libuhd*
sudo rm -rf /usr/include/uhd.h
sudo rm -rf /usr/include/uhd
sudo rm -rf /usr/share/uhd
sudo rm -rf /usr/lib/uhd
sudo rm -rf /usr/bin/uhd*
sudo rm -rf /usr/bin/usrp*
sudo rm -rf /usr/bin/rfnoc*
sudo rm -rf /usr/share/doc/uhd
sudo rm -rf /usr/share/man/man1/uhd*
sudo rm -rf /usr/share/man/man1/usrp*
sudo rm -rf /usr/lib/python3/dist-packages/uhd
sudo rm -rf usr/lib/python3/dist-packages/usrp*
sudo rm -rf /usr/bin/e320_bist
sudo rm -rf /usr/bin/aurora_bist_test.py
sudo rm -rf /usr/share/uhd

}  |& tee -a >(while read line; do echo "$(date "+%Y-%m-%d %H:%M:%S") $line"; done > uhd_uninstall_output.txt)
