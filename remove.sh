#!/bin/bash

# Calls to kubectl needed for deleting all the microservices
# microservices are:
# - auth
# - order
# - product


main_yml_dir="./kubernetes_deployment/"
auth_yml_dir="auth-api/"
order_yml_dir="order-api/"
product_yml_dir="product-api/"
common_yml_dir="common/"

auth_ns="auth-ns"
order_ns="order-ns"
product_ns="product-ns"

# Deleting ingresses
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-ingress.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$order_yml_dir"order-ingress.yml" --namespace=$order_ns
kubectl delete -f $main_yml_dir$product_yml_dir"product-ingress.yml" --namespace=$product_ns

# Order microservice
# Deleting order service api
kubectl delete -f $main_yml_dir$order_yml_dir"order-api-svc.yml" --namespace=$order_ns
kubectl delete -f $main_yml_dir$order_yml_dir"order-api-dp.yml" --namespace=$order_ns

# Deleting mongodb
kubectl delete -f $main_yml_dir$order_yml_dir"order-mongodb-ss.yml" --namespace=$order_ns
kubectl delete -f $main_yml_dir$order_yml_dir"order-mongodb-svc.yml" --namespace=$order_ns
kubectl delete -f $main_yml_dir$order_yml_dir"order-mongodb-pvc.yml" --namespace=$order_ns
kubectl delete -f $main_yml_dir$order_yml_dir"order-mongodb-pv.yml"

# Deleting namespace
kubectl delete -f $main_yml_dir$order_yml_dir"order-ns.json"


# Product microservice
# Deleting product service api
kubectl delete -f $main_yml_dir$product_yml_dir"product-api-svc.yml" --namespace=$product_ns
kubectl delete -f $main_yml_dir$product_yml_dir"product-api-dp.yml" --namespace=$product_ns

# Deleting mongodb
kubectl delete -f $main_yml_dir$product_yml_dir"product-mongodb-ss.yml" --namespace=$product_ns
kubectl delete -f $main_yml_dir$product_yml_dir"product-mongodb-svc.yml" --namespace=$product_ns
kubectl delete -f $main_yml_dir$product_yml_dir"product-mongodb-pvc.yml" --namespace=$product_ns
kubectl delete -f $main_yml_dir$product_yml_dir"product-mongodb-pv.yml"

# Deleting namespace
kubectl delete -f $main_yml_dir$product_yml_dir"product-ns.json"


# Auth microservice
# Deleting auth services api and grpc
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-api-dp.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-api-svc.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-grpc-dp.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-grpc-svc.yml" --namespace=$auth_ns

# Deleting mongodb
kubectl delete secret mongo-admin --namespace=auth-ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-mongodb-ss.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-mongodb-svc.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-mongodb-pvc.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-mongodb-pv.yml"

# Deleting redis
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-ss.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-svc.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-pvc.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-pv.yml"

# Deleting namespace
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-ns.json"


# Delete Storage Class
kubectl delete -f $main_yml_dir$common_yml_dir"cloudy-sc.yml"