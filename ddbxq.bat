call mvnw install -f pom.xml
call del D:\apitest\kjb\ddbxm.war
call move E:\ddbx\ddbx\target\ddbx-0.0.1-SNAPSHOT.war D:\apitest\kjb\ddbxm.war
d:
call cd \apitest\kjb\
call svn ci -m "ddbx" ddbxm.war
e:
call cd e:\ddbx\ddbx\