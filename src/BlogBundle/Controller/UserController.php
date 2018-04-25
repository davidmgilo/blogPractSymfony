<?php

namespace BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use BlogBundle\Form\UserType;
use BlogBundle\Entity\User;

class UserController extends Controller
{
    public function loginAction(Request $request)
    {
        $authenticationsUtils = $this->get("security.authentication_utils");
        $error = $authenticationsUtils->getLastAuthenticationError();
        $lastUsername = $authenticationsUtils->getLastUsername();
        
        $user = new User();
        $form = $this->createForm(UserType::class,$user);
        $form->handleRequest($request);
        if($form->isValid()){
            $status= "Registre correcte";
        }else{
            $status= "Registre incorrecte";
        }        
        
        return $this->render('BlogBundle:User:login.html.twig', array(
            "error" => $error,
            "lastUsername" => $lastUsername,
            "form" => $form->createView()
        ));
    }
}
