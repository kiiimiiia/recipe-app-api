FROM python:3.7-alpine
#maintener written below but its optional
MAINTAINER kimia demo project

#I didnt undrestand why we use it exactly
ENV PYTHONUNBUFFERED 1
# ADD  our required dependencies from a .txt file
#and it does copy file from left directory to the right that is on docker image
COPY ./requirements.txt /requirements.txt
#it runs things that are in that image directory
RUN pip install -r /requirements.txt

#create an empty folder on image
RUN mkdir /app
#swith /app to default directory
#any app that we run using docker container is int /app location
WORKDIR /app
#copy everything that is in our local /app direcory to image
COPY ./app /app
#create a user tht run our app
#-d means that this user can only run app
#this thing increase our security
RUN adduser -D user
#switch to that user that we created
USER user