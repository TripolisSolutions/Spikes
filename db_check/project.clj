(defproject db_check "0.1.0-SNAPSHOT"
  :description "DB performance comparision"
  :url "http://tripolis.com/db_check"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [com.novemberain/monger "1.5.0"]
                 [clojurewerkz/elastisch "1.1.0-rc2"]
                 [log4j "1.2.15" :exclusions [javax.mail/mail
                                              javax.jms/jms
                                              com.sun.jdmk/jmxtools
                                              com.sun.jmx/jmxri]]
                 [org.postgresql/postgresql "9.2-1002-jdbc4"]
                 [org.clojure/java.jdbc "0.3.0-alpha4"]]
  :plugins [[lein-kibit "0.0.8"]
            [jonase/eastwood "0.0.2"]]

  :main db-check.core)
