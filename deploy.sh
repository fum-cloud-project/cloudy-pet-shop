#!/bin/bash

# Calls to kubectl needed for deploying all the microservices
# microservices are:
# - auth
# - order
# - product


main_yml_dir="./kubernetes_deployment/"
auth_yml_dir="auth-api/"
order_yml_dir="order-api/"
product_yml_dir="product-api/"

auth_ns="auth-ns"
order_ns="order-ns"
product_ns="product-ns"

# Auth microservice
# Creating namespace
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-ns.json"

# Create Stroage Class
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-sc.yml" --namespace=$auth_ns

# Deploying mongodb
kubectl create secret generic mongo-admin --from-file=$main_yml_dir$auth_yml_dir"mongo_user" --from-file=$main_yml_dir$auth_yml_dir"mongo_pass" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-mongodb-pv.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-mongodb-pvc.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-mongodb-svc.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-mongodb-ss.yml" --namespace=$auth_ns

# Deploying redis
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-redis-pv.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-redis-pvc.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-redis-svc.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-redis-ss.yml" --namespace=$auth_ns

# Deploying auth services api and grpc
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-grpc-svc.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-api-svc.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-api-dp.yml" --namespace=$auth_ns
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-grpc-dp.yml" --namespace=$auth_ns

# Creating ingress
kubectl apply -f $main_yml_dir$auth_yml_dir"auth-ingress.yml" --namespace=$auth_ns