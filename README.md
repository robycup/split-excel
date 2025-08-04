# Excel File Splitter

A web application that allows users to upload Excel files, split them into multiple chunks, and download the resulting files as a zip archive.

## Features

- Upload Excel files (.xlsx, .xls)
- Split files into a specified number of chunks
- Download the resulting chunks as a zip file
- Simple, user-friendly interface
- File size limit of 100MB

## Requirements

- Python 3.8+
- Flask
- Pandas
- Openpyxl
- Werkzeug
- Gunicorn (for production)

## Local Development

1. Clone the repository:

```bash
git clone <repository-url>
cd split_excel
```

2. Install dependencies using uv:

```bash
uv pip install -r requirements.txt
```

3. Run the application using uv:

```bash
uv run flask --app app.py run --host=0.0.0.0
```

4. Open your browser and navigate to `http://localhost:5000`

## Docker Deployment

1. Build the Docker image:

```bash
docker build -t excel-splitter:latest .
```

2. Run the container:

```bash
docker run -p 5000:5000 excel-splitter:latest
```

3. Access the application at `http://localhost:5000`

## Kubernetes Deployment

1. Apply the Kubernetes configuration:

```bash
kubectl apply -f k8s/deployment.yaml
```

2. Get the external IP address:

```bash
kubectl get service excel-splitter-service
```

3. Access the application using the external IP address

## Render Deployment

1. Push your code to a Git repository (GitHub, GitLab, or Bitbucket)

2. Log in to [Render](https://render.com/) and create a new Web Service

3. Connect your Git repository

4. Select "Docker" as the environment

5. Configure the service:
   - Name: excel-splitter (or your preferred name)
   - Environment: Docker
   - Branch: main (or your default branch)
   - Plan: Free (or select a paid plan for production use)

6. Add a disk for persistent storage:
   - Under the "Disks" tab, add a new disk
   - Mount path: `/app/uploads`
   - Size: 1 GB (adjust as needed)

7. Click "Create Web Service"

8. Your application will be available at the URL provided by Render (e.g., `https://excel-splitter.onrender.com`)

## Usage

1. Open the application in your web browser
2. Upload an Excel file (.xlsx or .xls)
3. Enter the number of chunks you want to split the file into (minimum 2)
4. Click "Split and Download"
5. The application will process the file and automatically download a zip file containing the chunks

## Technical Details

- The application splits the Excel file by rows, distributing them evenly across the specified number of chunks
- Temporary files are automatically cleaned up after processing
- Client-side and server-side validation ensures proper file types and chunk counts

## Future Enhancements

- Allow splitting by maximum rows per file instead of number of chunks
- Support for CSV files
- Asynchronous processing for very large files
- User authentication for private use
