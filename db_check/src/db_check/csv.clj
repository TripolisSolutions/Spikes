(ns db-check.csv
  (:require [clojure.java.io :as io]))

(defn- line-to-csv [^String l]
  (map #(case % "\"\"" "" %) (.split #"," l)))

(defn- read-csv [r]
  (let [l (.readLine r)]
    (if l
      (cons (line-to-csv l) (lazy-seq (read-csv r)))
      nil)))

(defn each-file-block [size f]
  (with-open [r (io/reader "data/result.csv")]
    (let [c (read-csv r)
          h (first c)
          data  (map (partial zipmap h) (rest c))]
      (loop [data data idx 0]
        (if-not (empty? data)
          (let [ [h t] (split-at size data)]
            (println (* size idx))
            (f h)
            (recur t (+ idx 1))))))))
