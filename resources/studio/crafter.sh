#!/usr/bin/env bash

 DEPLOYER_JAVA_OPTS="$DEPLOYER_JAVA_OPTS "
 CD_HOME=${CRAFTER_DEPLOYER_HOME:=`pwd`}
 CATALINA_PID=${CATALINA_HOME}/tomcat.pid
CATALINA_HOME="./apache-tomcat"
 function help() {
         echo $(basename $BASH_SOURCE)
         echo "-s --start, Start crafter deployer"
         echo "-k --stop, Stop crafter deployer"
         echo "-d --debug, Implieds start, Start crafter deployer in debug mode"
         exit 0;
 }

function debug() {
    cd crafter-deployer
     ./deployer.sh --debug;
     cd ..
     ./apache-tomcat/bin/catalina.sh jpda start;
}
function start() {
    cd crafter-deployer
     ./deployer.sh --start;
     cd ..
     ./apache-tomcat/bin/startup.sh
}

function stop() {
    cd crafter-deployer
     ./deployer.sh --stop;
     cd ..
     ./apache-tomcat/bin/shutdown.sh
}
function logo() {
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMWX0KNWWXkkKXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMXkc;:dddl;;:xKNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMNOc;;;;:;;;:xKXNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMNKOo;;lk00Oxc;:loxKWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMNx;;;;:OXXNWNx;;;;cOXXNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMWOllc;;oOKXXOl;;okOKXNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMWWN0l;;:ccc;;;lOKK0OkkKWWWMWKkO0XNWMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMXo;;;cclc;;ckOd:;;;o0KKX0l;;;:xKNNWMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMN0xod0K0Oxx0K0o;;;;;cccc:;;;;;d0XXWMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMWN0xlldOOol:;;;;;;;;;;;;;;;:cokKNWMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMNOo;;;;;;;;;;;;;;;;;;;;;;;;;;;;cxKNWMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMMXkc;;;;;;;;;;;;;:cccc:;;;;;;;:oOKXXWMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMMW0l;;;;;;;;;cdkO0KKKKK0xoc;;lkKXNNWMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMWKOOOkl;;;;;;;:okKXNNWWMMMMMMWXO0KXNNWMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMKd;;;;;;;;;;;ckKXXNWMMMMMMMMMMMMMMWMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMWOl;;;;;;;;;;:kKXXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMNXOd:;;;;;;;o0XXNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMW0c;;;;;;;o0XXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMWXkc;;;;;;;o0XXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMW0oc;;;;;;;;;:kKXNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMKo;;;;;;;;;;;:kKXNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMNkoooo:;;;;;;;:oOKNWMMMMMMMMMWNKKNWMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMWWWNXkc;;;;;;;;:ldkOKXXXXK0kdc::oOKNWMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMMW0l;;;;;;;;;;;;;;::::;;;;;;;;:oOXNWMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMW0l;;;;;;;;;;;;;;;;;;;;;;;;;;;;cxKXNWMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMMNOl::lddl:;;;;;;;;;;;;;;;;;cox0XXNWMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMWNWWX0OOKKX0o;;;;;;:::;;;;;;d0KXNNWMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMN0dld000dccd00o;;;;ck000kc;;;;xKXXWMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMKo;;;:;;;;;lOKOxdooOKXNWNOoodx0XXNWMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMWXd;;:lddl:;:oO0KNNNNNNWMMWNWNNWWWWMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMNOdo:;ckKXXX0l;;::oKNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMXd;;;;lOXXWMKo;;:cd0XXNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMWKOkl;;cdkkxl;;lOKXXNWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMKl;;;;;;;;;o0XXWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMW0oc:lkOOdclx0XXNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMNXKKNNNNXNNNNWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
}
 case $1 in
     -d|--debug)
        logo()
        debug()
     ;;
     -s|--start)
        logo()
        start()
     ;;
     -k|--stop)
        logo()
        stop()
     ;;
     *)
         help
 ;;
 esac
