(ns db-check.elasticsearch
  (:require [clojurewerkz.elastisch.rest :as es]
            [clojurewerkz.elastisch.rest.index :as esi]
            [clojurewerkz.elastisch.rest.document :as esd]
            [clojurewerkz.elastisch.rest.bulk :as esb]))


(def mapping-types
  {:person {:_source {:compress :true}
            :_all {:enabled true}
            :properties {:_id {:type "string"
                               :index "not_analyzed"}
                         :first_name {:type "string" :store "yes"}
                         :last_name  {:type "string"}
                         :middle_name {:type "string"}
                         :gender {:type "string"}
                         :date_of_birth {:type "date"}
                         :email_addresses {:properties {:_id {:type "string"}
                                                        :email {:type "string"}
                                                        :active {:type "boolean"}}}
                         :addresses {:properties {:_id {:type "string"}
                                                  :street_name {:type "string"}
                                                  :house_number {:type "string"}
                                                  :zip_code {:type "string"}
                                                  :city {:type "string"}
                                                  :province {:type "string"}
                                                  :country {:type "string"}}}
                         :websites {:properties {:_id  {:type "string"}
                                                 :url {:type "string"}}}
                         :channels {:properties {:_id  {:type "string"}
                                                 :channel_id {:type "integer"}
                                                 :channel_type  {:type "string"}}}}}})


(defn init
  "Initializes work with elasticsearch"
  []
  (es/connect! "http://127.0.0.1:9200")
  (esi/delete "tenanta_contacts")
  (esi/create "tenanta_contacts" :mappings mapping-types))

(defn put-to-elasticsearch
  "Puts list of records to ElasticSearch"
  [data]
  (esb/bulk-with-index-and-type "tenanta_contacts" "person" (esb/bulk-index data)))
