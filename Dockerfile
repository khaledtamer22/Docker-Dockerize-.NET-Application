# first stage base image : .Net base image
# image is installed on this image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

# set the working directory 
WORKDIR /source

# copy all files with .csproj extension and restore dependencis 
COPY *.csproj .
RUN dotnet restore


 # copy and publish application files
 COPY . .

 RUN dotnet publish -c release -o /app


# final stage
# The web application is installed on this image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# copy all the configurations from the first stage , look at line one 
COPY --from=build /app .

# ENTRYPOINT determine what will be running in the container when it starts
ENTRYPOINT [ "dotnet" , "hrapp.dll" ]

 # what we did is a multi-stage