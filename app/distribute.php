<?php
header('Content-Type: text/plain; charset=UTF-8');

function formatCard($value, $suit) {
    $faces = ['1' => 'A', '10' => 'X', '11' => 'J', '12' => 'Q', '13' => 'K'];
    $val = isset($faces[$value]) ? $faces[$value] : $value;
    return "$suit-$val";
}

try {
    if (!isset($_POST['people']) || !is_numeric($_POST['people'])) {
        throw new Exception("Input value does not exist or value is invalid");
    }

    $n = intval($_POST['people']);
    if ($n <= 0) {
        throw new Exception("Input value does not exist or value is invalid");
    }

    $suits = ['S', 'H', 'D', 'C'];
    $deck = [];

    foreach ($suits as $suit) {
        for ($i = 1; $i <= 13; $i++) {
            $deck[] = formatCard($i, $suit);
        }
    }

    shuffle($deck);
    $result = array_fill(0, $n, []);

    for ($i = 0; $i < 52; $i++) {
        $result[$i % $n][] = $deck[$i];
    }

    foreach ($result as $cards) {
        echo implode(',', $cards) . "\n";
    }

} catch (Exception $e) {
    echo $e->getMessage();
    exit;
} catch (Error $err) {
    echo "Irregularity occurred";
    exit;
}
