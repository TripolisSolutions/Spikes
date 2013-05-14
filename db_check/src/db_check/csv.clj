(ns db-check.csv
  (:require [clojure.java.io :as io]))

(defn- line-to-csv [^String l]
  (map #(case % "\"\"" "" %) (.split #"," l)))

(defn- read-csv [r]
  (let [l (.readLine r)]
    (if l
      (cons (line-to-csv l) (lazy-seq (read-csv r)))
      (.close r))))

(defn- to-blocks
  [size data idx]
  (if-not (empty? data)
    (let [[h t] (split-at size data)]
      (println (* size idx))
      (cons h (lazy-seq (to-blocks size t (inc idx)))))))

(defn read-csv-blocks
  "Represents CSV file as lazy sequence of blocks of size"
   [size]
  (let [r (io/reader "data/result.csv")]
    (let [c (read-csv r)
          h (first c)
          data  (map (partial zipmap h) (rest c))]
      (to-blocks size data 0))))
