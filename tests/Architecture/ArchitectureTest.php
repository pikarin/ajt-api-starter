<?php

arch()
    ->expect('App')
    ->not->toUse(['die', 'dump', 'dd']);

arch()->preset()->php();
arch()->preset()->security();
arch()->preset()->laravel();
