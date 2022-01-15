FROM adoptopenjdk/openjdk11:ubi
VOLUME /tmp
COPY target/kubernetes-first-app-0.0.1-SNAPSHOT.jar kubernetes-first-app.jar
ENTRYPOINT ["java","-jar","kubernetes-first-app.jar"]