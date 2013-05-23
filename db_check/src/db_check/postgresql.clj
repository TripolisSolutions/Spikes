(ns db-check.postgresql
  (:require [db-check.csv :as csv]
            [db-check.util :as util]
            [clojure.java.jdbc :as j]
            [clojure.java.jdbc.sql :as s]
            [clojure.string :as str])
  (:import java.io.StringReader))

(def db {:subprotocol "postgresql"
         :subname "//127.0.0.1:5432/test"
         :user "auth-server"
         :password "Password"})

(defn- init []
  (j/with-connection db
    (try
      (j/do-commands
       "DROP TABLE IF EXISTS \"contacts\" CASCADE"
       "DROP TABLE IF EXISTS \"addresses\" CASCADE"
       "DROP TABLE IF EXISTS \"phones\" CASCADE"
       "DROP TABLE IF EXISTS \"email_addresses\" CASCADE"
       "DROP TABLE IF EXISTS \"websites\" CASCADE")
      (j/create-table :contacts
                      [:id :bigserial "PRIMARY KEY"]
                      [:first_name "varchar(255)"]
                      [:last_name "varchar(255)"]
                      [:middle_name "varchar(255)"]
                      [:suffix "varchar(255)"]
                      [:gender "varchar(255)"]
                      [:day_of_birth "date"])

      (j/create-table :addresses
                      [:id :bigserial]
                      [:contact_id :bigint "REFERENCES contacts(id)"]
                      [:street "varchar(255)"]
                      [:house_number "varchar(255)"]
                      [:house_name "varchar(255)"]
                      [:zip_code "varchar(255)"]
                      [:city "varchar(255)"]
                      [:province "varchar(255)"]
                      [:country "varchar(255)"])
      (j/create-table :phones
                      [:id :bigserial]
                      [:contact_id :bigint "REFERENCES contacts(id)"]
                      [:phone "varchar(255)"])
      (j/create-table :websites
                      [:id :bigserial]
                      [:contact_id :bigint "REFERENCES contacts(id)"]
                      [:website "varchar(255)"])
      (j/create-table :email_addresses
                      [:id :bigserial]
                      [:contact_id :bigint "REFERENCES contacts(id)"]
                      [:email "varchar(255)"])
      (catch Exception e (j/print-sql-exception-chain e)))
    ))

(defn- extract-line
  [header line]
  (vec (map line header)))

(defn- save-table
  [name t header data]
  (let [cp-manager (.getCopyAPI (t :connection))
        table (csv/table-to-csv data)]
    (.copyIn cp-manager (format "COPY %s(%s) FROM STDIN WITH CSV"
                                (str name)
                                (str/join ", " header)) (StringReader. table)))
  )

(defn extract-subtable
  [header block]
  (map (partial extract-line header) block)
  )

(defn- store-to-db
  [t block]

  (let [contacts (extract-subtable ["id" "first_name" "last_name" "middle_name" "gender" "day_of_birth"] block)
        a1 (extract-subtable ["id" "street1" "house_number1" "house_name1"
                              "zip_code1" "city1" "state1" "country1"] block)
        a2 (extract-subtable ["id" "street2" "house_number2" "house_name2"
                              "zip_code2" "city2" "state2" "country2"] block)
        e1 (extract-subtable ["id" "email1"] block)
        e2 (extract-subtable ["id" "email2"] block)
        w1 (extract-subtable ["id" "website1"] block)
        w2 (extract-subtable ["id" "website2"] block)]
    (save-table 'contacts t ["id" "first_name" "last_name"
                             "middle_name" "gender" "day_of_birth"] contacts)
    (save-table 'addresses t ["contact_id" "street" "house_number" "house_name"
                              "zip_code" "city"  "province" "country"] a1)
    (save-table 'addresses t ["contact_id" "street" "house_number" "house_name"
                              "zip_code" "city""province" "country"] a2)
    (save-table 'email_addresses t ["contact_id" "email"] e1)
    (save-table 'email_addresses t ["contact_id" "email"] e2)
    (save-table 'websites t ["contact_id" "website"] w1)
    (save-table 'websites t ["contact_id" "website"] w1)))


(defn- process-block [block]
  (let [block-size (count block)]
    (j/with-connection db
      (try
        (j/db-transaction
         [t db]
         (let [ids (j/query t ["SELECT nextval('contacts_id_seq') as id from generate_series(1, ?)" block-size] :row-fn :id)]
           (store-to-db t (map #(assoc %1 "id" (str %2)) block ids)))
         )
        (catch java.sql.SQLException e (j/print-sql-exception-chain e))))))

(defn- create-indexes
  []
  (j/with-connection db
    (try
      (j/do-commands
       "create index contacts_day_of_birth_idx on contacts(day_of_birth)"
       "create index contacts_first_name_idx on contacts using gist(first_name gist_trgm_ops)"
       "create index contacts_last_name_idx on contacts using gist(last_name gist_trgm_ops)"
       "create index contacts_middle_name_idx on contacts using gist(middle_name gist_trgm_ops)"

       "create index addresses_contacts_idx on addresses(contact_id)"

       "create index phones_contacts_idx on phones(contact_id)"
       "create index websites_contacts_idx on websites(contact_id)"
       "create index email_addresses_contacts_idx on email_addresses(contact_id)")
      (catch Exception e (j/print-sql-exception-chain e)))
    ))

(defn check
  "Checks PostgreSQL import performance"
  []

  (init)
                                        ;(. System (exit 0))
  (time
   (do
     (->>
      (csv/read-csv "data/result.csv")
      (util/to-blocks 10000)
      (pmap process-block)
      dorun)
     (create-indexes))))
