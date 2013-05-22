(ns db-check.mongo
  (:require [monger.core :as mg]
            [monger.collection :as mc]
            [db-check.csv :as csv]
            [db-check.util :as util]
            [db-check.elasticsearch :as es])
  (:import [org.bson.types ObjectId]
           [com.mongodb WriteConcern]))

(defn- process-record [r]
  {
   :_id (str (ObjectId.))
   :first_name (r "first_name")
   :middle_name (r "middle_name")
   :last_name (r "last_name")
   :suffix ""
   :gender (r "gender")
   :email_addresses [{:_id (str (ObjectId.)) :email (r "email1")}
                     {:_id (str (ObjectId.)) :email  (r "email2")}]
   :phones []
   :websites [{:_id (str (ObjectId.)) :url (r "website")}]
   :addresses [{:_id (str (ObjectId.))
                :street_name (r "street1")
                :house_number (r "house_number1")
                :house_name (r "house_name1")
                :zip_code (r "zip_code1")
                :city (r "city1")
                :province (r "state1")
                :country (r "country1")}
               {:_id (str (ObjectId.))
                :street_name (r "street2")
                :house_number (r "house_number2")
                :house_name (r "house_name2")
                :zip_code (r "zip_code2")
                :city (r "city2")
                :province (r "state2")
                :country (r "country2")
                 }]
   })

(defn- prepare-block [block]
  (map process-record block))

(defn- process-block [block]
  (let [b (prepare-block block)]
    (mc/insert-batch "tenanta_contacts" b)
    (es/put-to-elasticsearch b)))

(defn- init []
  (mg/connect!)
  (mg/set-db!(mg/get-db "tokyo_api_development_contacts"))
  (mc/drop "tenanta_contacts")
  (mg/set-default-write-concern! WriteConcern/FSYNC_SAFE)  )

(defn check []
  (init)
  (es/init)

  (->>
   (csv/read-csv "data/result.csv")
   (util/to-blocks 1000)
   (pmap process-block)
   dorun
   time)
  (mg/disconnect!))
