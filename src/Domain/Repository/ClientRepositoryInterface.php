<?php

declare(strict_types=1);

namespace App\Domain\Repository;

use App\Domain\Entity\Client;

interface ClientRepositoryInterface
{
    public function save(Client $client): void;
}
