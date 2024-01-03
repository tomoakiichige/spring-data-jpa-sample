env "local" {
    src = "file://db/schema.sql"
    url = "mariadb://mariadb:password@:3306/mariadb"
    dev = "docker://mariadb/latest/dev"
    excludes = "atlas_schema_revisions"
    migration  {
        dir = "file://db/migrations"
    }
    format  {
        migrate  {
            diff = "{{ sql . \"  \" }}"
        }
    }
}
