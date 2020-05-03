<?php
$program = fgets(STDIN);
$memorysize = 65536;
$pointer = 0;
$bra = 0;
$i = 0;
$arr = array_fill(0, 65536, 0);
while ($i < strlen($program)) {
	if ($program[$i] == '+') {
		if (0 <= $program[$i] && $pointer < $memorysize) {
			$arr[$pointer]++;
		} else {
			echo "Out of Array Bounds At: " . (string)$i, "\n";
			return;
		}
		$i++;
	} else if ($program[$i] == '-') {
		if (0 <= $program[$i] && $pointer < $memorysize) {
			$arr[$pointer]--;
		} else {
			echo "Out of Array Bounds At: " . (string)$i, "\n";
			return;
		}
		$i++;
	} else if ($program[$i] == '<') {
		$pointer--;
		$i++;
	} else if ($program[$i] == '>') {
		$pointer++;
		$i++;
	} else if ($program[$i] == ',') {
		$inp = (int)(fgets(STDIN));
		$arr[$pointer] = $inp;
		$i++;
	} else if ($program[$i] == '.') {
		echo chr($arr[$pointer]);
		$i++;
	} else if ($program[$i] == '[') {
		if ($arr[$pointer] == 0) {
			$bra = 1;
			while ($bra > 0) {
				$i++;
				if ($i < strlen($program) && $program[$i] == '[') {
					$bra++;
				} else if ($i < strlen($program) && $program[$i] == ']') {
					$bra--;
				} else if ($i >= strlen($program)) {
					echo "EOF Reached.";
					return;
				}
			}
		} else {
			$i++;
		}
	} else if ($program[$i] == ']') {
		if ($arr[$pointer] != 0) {
			$bra = 1;
			while ($bra > 0) {
				$i--;
				if ($i >= 0 && $program[$i] == '[') {
					$bra--;
				} else if ($i >= 0 && $program[$i] == ']') {
					$bra++;
				} else if ($i < 0) {
					echo "Out of Program.";
					return;
				}
			}
		} else {
			$i++;
		}
	} else {
		$i++;
	}
}
?>