(defproject db_check "0.1.0-SNAPSHOT"
  :description "DB performance comparision"
  :url "http://tripolis.com/db_check"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [com.novemberain/monger "1.5.0"]
                 [clojurewerkz/elastisch "1.1.0-rc2"]]
  :plugins [[lein-kibit "0.0.8"]
            [jonase/eastwood "0.0.2"]]

  :main db-check.core)
