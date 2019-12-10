# FROM balenalib/raspberry3-pi-dotnet:3.0-sdk AS build
# FROM mcr.microsoft.com/dotnet/core/sdk:3.0.100-preview6-alpine3.9 AS build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster-arm32v7 AS build
# FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build

WORKDIR /app

# COPY ./qemu/qemu-arm /usr/bin/qemu-arm

COPY ./beacon .

# RUN dotnet publish -r linux-arm -c Release -o ./deploy --self-contained true /p:PublishTrimmed=true

# FROM balenalib/raspberry-pi-alpine:3.8
# RUN install_packages \
#       bluez \
#       # Two dotnet dependencies (even for binary dontnet app)
#       libstdc++ libintl

# ENV UDEV=1
# ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# COPY --from=build /app/deploy ./app

ENTRYPOINT [ "dotnet --info" ]
# ENTRYPOINT [ "/bin/bash" ]