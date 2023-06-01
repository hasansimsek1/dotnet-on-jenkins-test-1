# syntax=docker/dockerfile:1

# create an environment named "build-env"
FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-env

# create a working directory
WORKDIR /source

# copy everything from this machine to docker image (excluding the ones in the .dockerignore file)
COPY . .

# restore the project
RUN dotnet restore "./sample-project-1/sample-project-1.csproj" --disable-parallel

# publish the project to /publish directory
RUN dotnet publish "./sample-project-1/sample-project-1.csproj" -c release -o /publish --no-restore

# create an environment named "runtime"
FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime

# create a working directory
WORKDIR /publish

# copy from everything from build-env/publish directory to our newly created /publish working directory
COPY --from=build-env /publish ./

# openn port
EXPOSE 80

# configure entry point
ENTRYPOINT ["dotnet", "sample-project-1.dll"]

