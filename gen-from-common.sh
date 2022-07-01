#!/bin/bash

#generate files for each microservice from common template
common_folder_path="./kubernetes_deployment/common/"
auth="./kubernetes_deployment/auth-api/"
order="./kubernetes_deployment/order-api/"
product="./kubernetes_deployment/product-api/"

#mongo for auth, order, product
cp $common_folder_path"mongodb-pv.yml" $auth"auth-mongodb-pv.yml"
cp $common_folder_path"mongodb-pv.yml" $order"order-mongodb-pv.yml"
cp $common_folder_path"mongodb-pv.yml" $product"product-mongodb-pv.yml"

cp $common_folder_path"mongodb-pvc.yml" $auth"auth-mongodb-pvc.yml"
cp $common_folder_path"mongodb-pvc.yml" $order"order-mongodb-pvc.yml"
cp $common_folder_path"mongodb-pvc.yml" $product"product-mongodb-pvc.yml"

cp $common_folder_path"mongodb-ss.yml" $auth"auth-mongodb-ss.yml"
cp $common_folder_path"mongodb-ss.yml" $order"order-mongodb-ss.yml"
cp $common_folder_path"mongodb-ss.yml" $product"product-mongodb-ss.yml"

cp $common_folder_path"mongodb-svc.yml" $auth"auth-mongodb-svc.yml"
cp $common_folder_path"mongodb-svc.yml" $order"order-mongodb-svc.yml"
cp $common_folder_path"mongodb-svc.yml" $product"product-mongodb-svc.yml"

#redis for auth
cp $common_folder_path"redis-pv.yml" $auth"auth-redis-pv.yml"
cp $common_folder_path"redis-pvc.yml" $auth"auth-redis-pvc.yml"
cp $common_folder_path"redis-ss.yml" $auth"auth-redis-ss.yml"
cp $common_folder_path"redis-svc.yml" $auth"auth-redis-svc.yml"


auth_appname="auth-api"
order_appname="order-api"
product_appname="product-api"
auth_namespace="auth-ns"
order_namespace="order-ns"
product_namespace="product-ns"
#replace every "appname" in yaml files with the microservice appname, and replace every "appns" with the namespace of the microservice
sed -i "s/appname/$auth_appname/g" $auth"auth-mongodb-pv.yml"
sed -i "s/appname/$order_appname/g" $order"order-mongodb-pv.yml"
sed -i "s/appname/$product_appname/g" $product"product-mongodb-pv.yml"
sed -i "s/appname/$auth_appname/g" $auth"auth-mongodb-pvc.yml"
sed -i "s/appname/$order_appname/g" $order"order-mongodb-pvc.yml"
sed -i "s/appname/$product_appname/g" $product"product-mongodb-pvc.yml"
sed -i "s/appname/$auth_appname/g" $auth"auth-mongodb-ss.yml"
sed -i "s/appname/$order_appname/g" $order"order-mongodb-ss.yml"
sed -i "s/appname/$product_appname/g" $product"product-mongodb-ss.yml"
sed -i "s/appname/$auth_appname/g" $auth"auth-mongodb-svc.yml"
sed -i "s/appname/$order_appname/g" $order"order-mongodb-svc.yml"
sed -i "s/appname/$product_appname/g" $product"product-mongodb-svc.yml"
sed -i "s/appname/$auth_appname/g" $auth"auth-redis-pv.yml"
sed -i "s/appname/$auth_appname/g" $auth"auth-redis-pvc.yml"
sed -i "s/appname/$auth_appname/g" $auth"auth-redis-ss.yml"
sed -i "s/appname/$auth_appname/g" $auth"auth-redis-svc.yml"

