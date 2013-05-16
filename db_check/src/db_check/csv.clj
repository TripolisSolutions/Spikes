(ns db-check.csv
  (:require [clojure.java.io :as io]))

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
