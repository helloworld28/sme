dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/db_sme?autoreconnect=true&useUnicode=true&characterEncoding=utf-8"
            username = "root"
            password = "admin"
//            password = "michael006"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/db_sme?autoreconnect=true&useUnicode=true&characterEncoding=utf-8"
            username = "root"
            //password = "admin"
            password = "913978964"
            properties {
                timeBetweenEvictionRunsMillis = 1000 * 60 * 60 * 3
                minEvictableIdleTimeMillis = 1000 * 60 * 60 * 3
                maxActive = 100
                testOnBorrow=true
                testWhileIdle=false
                testOnReturn=false
                validationQuery="SELECT 1"
            }
        }
    }
}
