call mvnw install -f pom.xml
call del E:\apitest\kjb\ddbxm.war
call move E:\GIT_code\ddbx\ddbx\target\ddbx-0.0.1-SNAPSHOT.war E:\apitest\kjb\ddbxm.war
e:
call cd \apitest\kjb\
call svn ci -m "ddbx" ddbxm.war
e:
call cd e:\GIT_code\ddbx\ddbx\