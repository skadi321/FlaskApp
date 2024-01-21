$listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Any, 12345)
$listener.Start()

Write-Host "Waiting for incoming connections..."

while ($true) {
    $client = $listener.AcceptTcpClient()
    $stream = $client.GetStream()
    $reader = [System.IO.StreamReader]($stream)
    $writer = [System.IO.StreamWriter]($stream)

    $message = $reader.ReadLine()
    Write-Host "Received message: $message"

    if ($message -eq "Build Succeeded!") {
        git clone "https://github.com/skadi321/FlaskApp.git"

        # Build Docker image
        cd "FlaskApp"
        
         
        docker build -t simple-python-api .
        docker run -p 5000:5000 --name simple-python-api -d simple-python-api
    }
}

# Close the listener outside the loop
$listener.Stop()
