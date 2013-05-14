(ns db-check.mongo
  (:require [monger.core :as mg]
            [monger.collection :as mc]
            [db-check.csv :as csv])
  (:import [org.bson.types ObjectId]
           [com.mongodb WriteConcern]))

(defn- prepare-block [block]
  (map #(assoc % :id (ObjectId.)) block))

(defn check []
  (mg/connect!)
  (mg/set-db!(mg/get-db "speed-test"))
  (mc/drop "speed-test")
  (mg/set-default-write-concern! WriteConcern/FSYNC_SAFE)

  (->
   (pmap #(do (mc/insert-batch "speed-test" (prepare-block %)) 1)
            (csv/read-csv-blocks 1000))
   dorun
   time)
  (mg/disconnect!))
