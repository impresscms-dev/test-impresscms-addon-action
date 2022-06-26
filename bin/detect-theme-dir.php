<?php

$dir = $argv[1];

if (strpos($dir, 'impresscms-theme-') === 0) {
    $dir = substr($dir, strlen('impresscms-theme-'));
} elseif (strpos($dir, 'theme-') === 0) {
    $dir = substr($dir, strlen('theme-'));
} elseif (substr($dir, -strlen('-theme')) === '-theme') {
    $dir = substr($dir, 0, -strlen('-theme'));
}

echo $dir;