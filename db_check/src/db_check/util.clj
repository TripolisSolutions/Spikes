(ns db-check.util)

(defn to-blocks
  ([size data] (to-blocks size data 0))
  ([size data idx]
     (if-not (empty? data)
       (let [[h t] (split-at size data)]
         (println (* size idx))
         (cons h (lazy-seq (to-blocks size t (inc idx))))))))
