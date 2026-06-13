# Monica

A lightweight, self-hosted monitoring platform designed for monitoring system health and performance metrics.

## Get Started

Work in Progress: Monica is currently under active development.

## Project Architecture

```
monica/
├── dashboard/ # data visualization
├── node/ # system metrics collection
├── proto/ # shared protobuf definitions
└── server/ # gRPC ingest and processing
```

1. Node: A tiny background worker that you drop into any server you want to monitor. It quietly reads system stats and streams them out.

2. Server: A central server which handles concurrent gRPC metrics ingestion for incoming data from all of the nodes.

3. Dashboard: The frontend web interface. It request to the server to catch metrics and update your charts without any page refreshes.

### Why gRPC and Push?

Monitoring tools use a "pull-based" where a central server constantly scrapes targets for data. Monica changes it with a "push-based" architecture.

1. Metrics Streaming: Agents open a single, persistent gRPC connection to the Server and stream performance metrics. No more handshake overhead every few seconds.

2. Minimal Network Footprint: gRPC serializes payloads into Protobuf bytes over the network instead of heavy JSON strings.

3. Firewall & Security Friendly: Because the Agent initiates outbound connections to the Server, production environments don't need to open inbound ports anymore.

4. Strict Type Safety: Metrics schemas are strictly defined in unified .proto files, acting as a language-agnostic compile-time contract.

## License

[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)
This repository is licensed under the `GNU General Public License v3`.

