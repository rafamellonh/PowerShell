$cor = "branco"

switch ($cor) {
    "azul" {"você escolheu : "}
    "vermelho" {"você escolheu : "}
    "preto" {"você escolheu : "}
    "amarelho" {"você escolheu : "}
    Default {"branco"}
}


$dia = (Get-Date).DayOfWeek.value__

switch ($dia) {
    0 {"Domingo"; break}
    1 {"Segunda"; break}
    2 {"Terça"; break}
    3 {"Quarta"; break}
    4 {"Quinta"; break}
    5 {"Sexta"; break}
    6 {"Sabado"; break}
    Default {}
}
