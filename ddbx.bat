call mvnw install -f pom.xml
call del H:\快车道\SVN服务器2\kjb\ddbxm.war
call move G:\gitHub\ddbx\target\ddbx-0.0.1-SNAPSHOT.war H:\快车道\SVN服务器2\kjb\ddbxm.war
h:
call cd \快车道\SVN服务器2\kjb\
call svn ci -m "ddbx" ddbxm.war
g:
call cd g:\gitHub\ddbx\