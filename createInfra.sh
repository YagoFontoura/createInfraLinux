#!/bin/bash

DIRETORIOS=('/publico' '/adm' '/ven' '/sec')

for pasta in ${DIRETORIOS[*]}; do
        mkdir $pasta
done

for group in GRP_ADM GRP_VEN GRP_SEC; do
        groupadd $group
done

USER=('carlos' 'maria' 'joao' 'debora' 'sebastiana' 'roberto' 'josefina' 'amanda' 'rogerio')
USER_GROUP_ADM=('carlos' 'maria' 'joao')
USER_GROUP_VEN=('debora' 'sebastiana' 'roberto')
USER_GROUP_SEC=('josefina' 'amanda' 'rogerio')

for user in ${USER[*]}; do
        useradd -c $user $user -s /bin/bash -m -p $(openssl passwd -crypt 12345678)
done

chmod 777 /publico


chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec


for dir in /adm /ven /sec; do
        chmod 770 $dir
done

for user_group_adm in ${USER_GROUP_ADM[*]}; do
       usermod -G GRP_ADM $user_group_adm
done

for user_group_ven in ${USER_GROUP_VEN[*]}; do
        usermod -G GRP_VEN $user_group_ven
done

for user_group_sec in ${USER_GROUP_SEC[*]}; do
        usermod -G GRP_SEC $user_group_sec
done
