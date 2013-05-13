(ns db-check.mongo
  (:require [monger.core :as mg]
            [monger.collection :as mc]
            [db-check.csv :as csv]))

(defn check []
  (mg/connect!)
  (mg/set-db!(mg/get-db "speed-test"))
  (mc/remove "speed-test")
  (csv/each-file-block 1000
                       #(mc/insert-batch "speed-test" %)))
