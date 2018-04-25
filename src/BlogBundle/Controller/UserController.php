<?php

namespace BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class UserController extends Controller
{
    public function loginAction(Request $request)
    {
        $authenticationsUtils = $this->get("security.authentication_utils");
        $error = $authenticationsUtils->getLastAuthenticationError();
        $lastUsername = $authenticationsUtils->getLastUsername();
        
        
        return $this->render('BlogBundle:User:login.html.twig', array(
            "error" => $error,
            "lastUsername" => $lastUsername
        ));
    }
}
