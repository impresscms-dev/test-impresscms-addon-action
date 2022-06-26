<?php

$dir = $argv[1];

if (strpos($dir, 'impresscms-module-') === 0) {
    $dir = substr($dir, strlen('impresscms-module-'));
} elseif (strpos($dir, 'module-') === 0) {
    $dir = substr($dir, strlen('module-'));
} elseif (substr($dir, -strlen('-module')) === '-module') {
    $dir = substr($dir, 0, -strlen('-module'));
}

echo $dir;