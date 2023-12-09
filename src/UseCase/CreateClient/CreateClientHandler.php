<?php

declare(strict_types=1);

namespace App\UseCase\CreateClient;

use App\Domain\Entity\Client;
use App\Eventstorming\ClientCreatedEvent;
use App\UseCase\CreateClient\CreateClientCommand;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Messenger\MessageBusInterface;

#[AsMessageHandler]
final class CreateClientHandler
{
    public function __construct(private MessageBusInterface $bus)
    {
    }

    public function __invoke(CreateClientCommand $command)
    {
        $client = new Client($command->getEmail());
        
        $event = new ClientCreatedEvent($client->getId()->toRfc4122(), $client->getEmail());

        $this->bus->dispatch($event);
    }
}
