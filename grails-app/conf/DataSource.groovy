dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "tomcat"
    password = "tomcat00"
    dbCreate = "update" // create, create-drop, update
    url = 'jdbc:postgresql:fucho'
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    //dialect='org.hibernate.dialect.PostgreSQLDialect'
    show_sql=true
}
// environment specific settings
environments {
    development {
        dataSource {
        }
    }
    test {
        dataSource {
        }
    }
    production {
        dataSource {
        }
        hibernate {
            show_sql = false
        }
    }
}
