<?php

namespace BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Session\Session;
use BlogBundle\Entity\Entry;
use BlogBundle\Form\EntryType;


class EntryController extends Controller
{
	private $session;
	
	public function __construct() {
		$this->session=new Session();
	}
	
	public function addAction(Request $request){
		$entry = new Entry();
		$form = $this->createForm(EntryType::class,$entry);
		
		$form->handleRequest($request);
		
		if($form->isSubmitted()){
			if($form->isValid()){
				
				$em = $this->getDoctrine()->getEntityManager();
				$entry_repo=$em->getRepository("BlogBundle:Entry");
				$category_repo=$em->getRepository("BlogBundle:Category");
				
				$entry = new Entry();
				$entry->setTitle($form->get("title")->getData());
				$entry->setContent($form->get("content")->getData());
				$entry->setStatus($form->get("status")->getData());
				
				// upload file
				$file=$form["image"]->getData();
				
				if(!empty($file) && $file!=null){
					$ext=$file->guessExtension();
					$file_name=time().".".$ext;
					$file->move("uploads",$file_name);

					$entry->setImage($file_name);
				}else{
					$entry->setImage(null);
				}
				
				$category = $category_repo->find($form->get("category")->getData());
				$entry->setCategory($category);
				
				$user=$this->getUser();
				$entry->setUser($user);
				
				$em->persist($entry);
				$flush=$em->flush();
				
				$entry_repo->saveEntryTags(
						$form->get("tags")->getData(),
						$form->get("title")->getData(),
						$category,
						$user
						);
				
				if($flush==null){
					$status = "Entrada creada correctament.";
				}else{
					$status ="Alguna cosa ha fallat";
				}
				
			}else{
				$status = "Formulari no vàlid. Entrada no creada.";
			}
			
			$this->session->getFlashBag()->add("status", $status);
			return $this->redirectToRoute("blog_homepage");
		}
		
		
                return $this->render("BlogBundle:Entry:add.html.twig",array(
                        "form" => $form->createView()
                ));
	}
	
	
}
