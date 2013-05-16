(ns db-check.mongo
  (:require [monger.core :as mg]
            [monger.collection :as mc]
            [db-check.csv :as csv]
            [db-check.util :as util])
  (:import [org.bson.types ObjectId]
           [com.mongodb WriteConcern]))

(defn- prepare-block [block]
  (map #(assoc % :id (ObjectId.)) block))

(defn check []
  (mg/connect!)
  (mg/set-db!(mg/get-db "speed-test"))
  (mc/drop "speed-test")
  (mg/set-default-write-concern! WriteConcern/FSYNC_SAFE)

  (->>
   (csv/read-csv "data/result.csv")
   (util/to-blocks 1000)
   (pmap #(do (mc/insert-batch "speed-test" (prepare-block %))))
   dorun
   time)
  (mg/disconnect!))
