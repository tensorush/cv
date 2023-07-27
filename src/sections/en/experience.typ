#import "../../template.typ": *

#cvSection("Experience")

#cvEntry(
  title: [Cloud Software Engineer (Python/Rust/SQL)],
  host: [#link("https://github.com/Stabl-Energy")[#gh #hSpc() STABL Energy] #hDot() Part-time],
  date: [January — March 2023 (3 months)],
  mode: [Munich, Germany #hDot() Hybrid],
  logo: "./assets/logos/stb.png",
  desc: list(
    marker: [➤],
    [Set up automatic generation of custom Grafana dashboards.],
    [Created a Rust client for sending log streams to Grafana Loki.],
    [Migrated +20 GiB of IoT sensor data from AWS Timestream to InfluxDB.],
    [Configured custom CI pipelines for testing and linting Python and Rust codebases.],
    [Flashed +10 ESP32-S2 edge devices using the in-house bootstrap software and CP210x driver.],
    [Constructed efficient FluxQL queries for automatic cleanup, backup and recovery of InfluxDB data.],
  ),
)

#cvEntry(
  title: [Deep Learning Engineer (Python/C++/CUDA)],
  host: [#link("https://github.com/phygitalism")[#gh #hSpc() Phygitalism] #hDot() Full-time],
  date: [October 2021 — April 2022 (7 months)],
  mode: [Moscow, Russia #hDot() Hybrid],
  logo: "./assets/logos/phy.png",
  desc: list(
    marker: [➤],
    [Adapted and deployed RIFE and AdaAttN models as web services using Docker and RabbitMQ.],
    [Compared neural and differentiable renderers and wrote blog posts reviewing the recent papers.],
    [Implemented a point cloud boundary detection algorithm from a scientific publication in Python.],
    [Performed pre-processing, analysis and visualization of point cloud data from road LIDAR scans.],
    [Tested the NeRF model from the InstantNGP project and contributed with a Dev Container setup.],
    [Contributed to a data processing pipeline for training the Point Transformer model on road signs.],
    [Developed a mesh reconstruction pipeline for in-door point cloud scans with the CGAL C++ library.],
  ),
)
