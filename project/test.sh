#!/bin/bash
for j in {1..100}
do
  for i in {1..3}
  do
    curl -d "{\"email\":\"email$i@test.com\"}" -H "Content-Type: application/json" -X POST http://192.168.99.100:8081
    curl -d "{\"email\":\"email$i@test.com\"}" -H "Content-Type: application/json" -X POST http://192.168.99.100:8082
    curl -d "{\"email\":\"email$i@test.com\"}" -H "Content-Type: application/json" -X POST http://192.168.99.100:8083
  done
done