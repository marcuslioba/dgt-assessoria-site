# Servidor estático mínimo para visualizar o site localmente: powershell -File serve.ps1
$root = $PSScriptRoot
$port = 8123
$mime = @{ '.html'='text/html; charset=utf-8'; '.css'='text/css'; '.js'='text/javascript'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.png'='image/png'; '.webp'='image/webp'; '.svg'='image/svg+xml'; '.ico'='image/x-icon' }
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:$port/")
$l.Start()
Write-Host "Servindo $root em http://localhost:$port/"
while ($l.IsListening) {
  $c = $l.GetContext()
  try {
    $p = [Uri]::UnescapeDataString($c.Request.Url.AbsolutePath.TrimStart('/'))
    if ($p -eq '') { $p = 'index.html' }
    $f = [IO.Path]::GetFullPath((Join-Path $root $p))
    if ($f.StartsWith($root) -and (Test-Path $f -PathType Leaf)) {
      $ext = [IO.Path]::GetExtension($f).ToLower()
      $c.Response.ContentType = $(if ($mime.ContainsKey($ext)) { $mime[$ext] } else { 'application/octet-stream' })
      $b = [IO.File]::ReadAllBytes($f)
      $c.Response.ContentLength64 = $b.Length
      $c.Response.OutputStream.Write($b, 0, $b.Length)
    } else { $c.Response.StatusCode = 404 }
  } catch { $c.Response.StatusCode = 500 }
  $c.Response.Close()
}
