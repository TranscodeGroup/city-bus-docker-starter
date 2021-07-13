#!/bin/bash
function generate_passwd(){
	local arr=(a b c d e f g h i g k l m n o p q r s t u v w x y z
	        A B C D E F G H I G K L M N O P Q R S T U V W X Y Z
	        ! @ ^ 0 1 2 3 4 5 6 7 8 9)
	for ((i=0;i<16;i++))
	do 
		echo -n ${arr[$RANDOM % ${#arr[@]}]}
	done
}

ENV_FILE=my.env

echo > $ENV_FILE

MYSQL_PASS=$(generate_passwd)
REDIS_PASS=$(generate_passwd)

MYSQL_ROOT_PASSWORD=MYSQL_ROOT_PASSWORD=$MYSQL_PASS
SPRING_DATASOURCE_PASSWORD=SPRING_DATASOURCE_PASSWORD=$MYSQL_PASS

REDIS_REQUIRE_PASS=REDIS_REQUIRE_PASS=$REDIS_PASS
SPRING_REDIS_PASSWORD=SPRING_REDIS_PASSWORD=$REDIS_PASS

echo "ROOT_PATH=/e/data" >> $ENV_FILE

echo "TZ=Asia/Shanghai" >> $ENV_FILE

echo "RABBITMQ_DEFAULT_PASS=bus@123" >> $ENV_FILE

echo $MYSQL_ROOT_PASSWORD >> $ENV_FILE
echo $SPRING_DATASOURCE_PASSWORD >> $ENV_FILE
echo $REDIS_REQUIRE_PASS >> $ENV_FILE
echo $SPRING_REDIS_PASSWORD >> $ENV_FILE

cat $ENV_FILE

# 初始化并启动项目
docker-compose --env-file=$ENV_FILE up -d  