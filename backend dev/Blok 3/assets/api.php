<?php

function fetchWikipediaPhoto($driverName) {
    $url = 'https://en.wikipedia.org/w/api.php?' . http_build_query([
        'action' => 'query',
        'format' => 'json',
        'prop' => 'pageimages|info',
        'piprop' => 'original',
        'inprop' => 'url',
        'titles' => $driverName
    ]);
    
    $options = [
        'http' => [
            'method' => 'GET',
            'header' => 'User-Agent: F1DriverFetcher/1.0',
            'timeout' => 10
        ]
    ];
    
    $context = stream_context_create($options);
    $response = @file_get_contents($url, false, $context);
    
    if (!$response) {
        return [
            'name' => $driverName,
            'photo_url' => null,
            'page_url' => null,
            'success' => false
        ];
    }
    
    $data = json_decode($response, true);
    
    if (isset($data['query']['pages'])) {
        $page = reset($data['query']['pages']);
        
        return [
            'name' => $page['title'] ?? $driverName,
            'photo_url' => $page['original']['source'] ?? null,
            'page_url' => $page['fullurl'] ?? null,
            'success' => isset($page['original']['source'])
        ];
    }
    
    return [
        'name' => $driverName,
        'photo_url' => null,
        'page_url' => null,
        'success' => false
    ];
}