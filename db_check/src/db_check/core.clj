(ns db-check.core
  (:require [db-check [mongo :as m] [postgresql :as pg]])
  (:gen-class :main true))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  ;; work around dangerous default behaviour in Clojure
  (alter-var-root #'*read-eval* (constantly false))

  (m/check)
  (pg/check)
  (println "test"))
