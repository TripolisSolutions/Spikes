(ns db-check.csv
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(defn- line-to-csv [^String l]
  (map #(case % "\"\"" "" %) (.split #"," l)))

(defn- read-csv-lines [r]
  (let [l (.readLine r)]
    (if l
      (cons (line-to-csv l) (lazy-seq (read-csv-lines r)))
      (.close r))))

(defn read-csv
  "Represents CSV file as lazy sequence of blocks of size"
   [file]
   (let [r (io/reader file)
         c (read-csv-lines r)
         h (first c)]
      (map (partial zipmap h) (rest c))))

(defn- escape-field [^String f]
  (if (nil? f)
    ""
    (if (.contains f ",")
      (str "\""
           f
           "\"")
      (if (= (.length f) 0) "\"\"" f))))

(defn- csv-row [row]
  (str/join "," (map escape-field row)))

(defn table-to-csv [table]
  (loop [b (StringBuffer.)
         t (map csv-row table)]
    (if (empty? t)
      (.toString b)
      (recur (.append b (str (first t) "\n")) (rest t)))))
