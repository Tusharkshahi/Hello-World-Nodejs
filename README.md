# Hello World Node.js Application

This is a simple Node.js application that displays "Hello World". It can be run manually on your local machine or inside a Docker container.

## Prerequisites

- [Node.js](https://nodejs.org/) installed on your machine (if running manually).
- [Docker](https://www.docker.com/get-started) installed on your machine (if running through Docker).

## Running the Application Manually

### Step 1: Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/your-username/hello_world_nodejs.git
cd hello_world_nodejs
```

### Step 2: Install Dependencies

Install the necessary dependencies using npm:

```bash
npm install
```
### Step 3: Start the Application

Start the application:

```bash
node app.js
```

### The application should now be running on port 3000. Open your web browser and navigate to http://localhost:3000 to see "Hello World".

### Running the Application with Docker

Step 1: Pull the Docker Image
Pull the Docker image from Docker Hub:

```bash
docker pull tusharkshahi/hello_world_nodejs:latest
```
### Step 2: Run the Docker Container

Run the Docker container:

```bash
docker run -d -p 3000:3000 tusharkshahi/hello_world_nodejs:latest
```

The application should now be running inside a Docker container and accessible on port 3000. Open your web browser and navigate to http://localhost:3000 to see "Hello World".


