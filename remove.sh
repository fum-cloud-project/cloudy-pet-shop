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

auth_ns="auth-ns"
order_ns="order-ns"
product_ns="product-ns"

# Auth microservice
# Deleting ingress
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-ingress.yml" --namespace=$auth_ns

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
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-mongodb-pv.yml" --namespace=$auth_ns

# Deleting redis
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-ss.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-svc.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-pvc.yml" --namespace=$auth_ns
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-redis-pv.yml" --namespace=$auth_ns

# Delete Storage Class
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-sc.yml" --namespace=$auth_ns

# Deleting namespace
kubectl delete -f $main_yml_dir$auth_yml_dir"auth-ns.json"