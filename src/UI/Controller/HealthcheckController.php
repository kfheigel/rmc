<?php

declare(strict_types=1);

namespace App\UI\Controller;

use Exception;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Infrastructure\Repository\ClientRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HealthcheckController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $entityManager,
        private ClientRepository $clientRepository
        )
    {
    }

    #[Route('/healthcheck', name: 'app_healthcheck')]
    public function index(): JsonResponse
    {
        $database = 'ok';

        try {
            $this->clientRepository->findAll();
        } catch (Exception) {
            $database = 'not ok';
        }

        return $this->json([
            'database' => $database,
        ]);
    }
}
