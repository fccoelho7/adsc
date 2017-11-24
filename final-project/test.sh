#!/bin/bash
for j in {1..1000}
do
  for i in {1..3}
  do
    curl -d "{\"email\":\"email$i@test.com\"}" -H "Content-Type: application/json" -X POST http://0.0.0.0:8081
    curl -d "{\"email\":\"email$i@test.com\"}" -H "Content-Type: application/json" -X POST http://0.0.0.0:8082
    curl -d "{\"email\":\"email$i@test.com\"}" -H "Content-Type: application/json" -X POST http://0.0.0.0:8083
  done
done
