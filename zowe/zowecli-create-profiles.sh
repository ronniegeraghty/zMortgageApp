#!/bin/bash
################################################################
# LICENSED MATERIALS - PROPERTY OF IBM
# "RESTRICTED MATERIALS OF IBM"
# (C) COPYRIGHT IBM CORPORATION 2021. ALL RIGHTS RESERVED
# US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION,
# OR DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE
# CONTRACT WITH IBM CORPORATION
################################################################

TSOUSER=
PASSWORD=
HOSTNAME=                              # z/OS host name
RSEPORT=                               # rse api port
RSEPROFILE=rseapi-profile              # rse profile name
ZOSMFPORT=                             # z/OSMF api port
ZOSMFPROFILE=zosmf-profile             # z/OSMF profile name
SSHPORT=                               # ssh port
SSHPROFILE=ssh-profile                 # ssh profile name

echo "Creating RSE profile and setting as default..."
set -x
zowe profiles create rse-profile ${RSEPROFILE} --host ${HOSTNAME} --port ${RSEPORT} --user ${TSOUSER} --pass ${PASSWORD} --bp rseapi --protocol https --reject-unauthorized false --ow
zowe profiles set rse ${RSEPROFILE}
set +x

echo "Creating z/OSMF profile and setting as default..."
set -x
zowe profiles create zosmf-profile ${ZOSMFPROFILE} --host ${HOSTNAME} --port ${ZOSMFPORT} --user ${TSOUSER} --pass ${PASSWORD} --reject-unauthorized false --ow
zowe profiles set zosmf ${ZOSMFPROFILE}
set +x

echo "Creating SSH profile and setting as default..."
set -x
zowe profiles create ssh-profile ${SSHPROFILE} --host ${HOSTNAME} --user ${TSOUSER} --pass ${PASSWORD} --port ${SSHPORT} --ow
zowe profiles set ssh ${SSHPROFILE}
set +x