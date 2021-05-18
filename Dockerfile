FROM openjdk:8-jdk
EXPOSE 8080:8080
RUN mkdir /app
COPY ./build/install/ugntu-practice6-teacher-info/ /app/
WORKDIR /app/bin
CMD ["./ugntu-practice6-teacher-info"]