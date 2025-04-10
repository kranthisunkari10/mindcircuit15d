FROM maven as buildStage
RUN mkdir /opt/kranthi
WORKDIR /opt/kranthi
COPY . .
RUN mvn clean install

FROM tomcat
WORKDIR webapps
COPY --from=buildStage /opt/kranthi/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
