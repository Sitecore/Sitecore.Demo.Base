ARG BASE_IMAGE
ARG BASE_RUNTIME_IMAGE

FROM $BASE_IMAGE AS build
WORKDIR /src
COPY ["windows-hosts-writer.csproj", "./"]
RUN dotnet restore "./windows-hosts-writer.csproj"
COPY . .
WORKDIR /src
RUN dotnet build "windows-hosts-writer.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "windows-hosts-writer.csproj" -c Release -o /app

FROM $BASE_RUNTIME_IMAGE AS final
WORKDIR /app
COPY --from=publish /app .
USER ContainerAdministrator
ENTRYPOINT ["dotnet", "windows-hosts-writer.dll"]
