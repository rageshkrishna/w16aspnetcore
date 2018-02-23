# escape=`
FROM ragesh/w16dotnetcore:latest

# set up environment
ENV ASPNETCORE_URLS http://+:80
ENV ASPNETCORE_PKG_VERSION 2.0.5

# Install gulp and bower
RUN npm install -g gulp bower;

# warmup up NuGet package cache
COPY packagescache.csproj C:/warmup/packagescache.csproj

RUN dotnet restore C:/warmup/packagescache.csproj `
        --source https://api.nuget.org/v3/index.json `
        --verbosity quiet; `
Remove-Item -Recurse -Force C:/warmup