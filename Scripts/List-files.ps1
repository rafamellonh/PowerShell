#lista arquivos em uma pasta a partir da extensão.

$Location = "d:\" 
$result = (Get-ChildItem $Location\* -Recurse -Include *.png, *.gif, *.jpg)
$result > d:\arquivo.txt

