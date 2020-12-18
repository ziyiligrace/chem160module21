#!/bin/bash
printf "Integer= %5d\n" $1
printf "Integer= %05d\n" $1
printf "Integer= %-5d\n" $1
printf "Integer= %+5d\n" $1
printf "Float=%7.2f\n" $2
printf "Float=%7.4\n" $2
printf "Float=+7.2f\n" $2
printf "String=%s\n" $3
printf "String=%10s\n" $3
