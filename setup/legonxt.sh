#!/bin/bash
 
GROUP=plugdev
if [ "${ACTION}" = "add" ] &amp;&amp; [ -f "${DEVICE}" ]
then
 chmod o-rwx "${DEVICE}"
 chgrp "${GROUP}" "${DEVICE}"
 chmod g+rw "${DEVICE}"
fi