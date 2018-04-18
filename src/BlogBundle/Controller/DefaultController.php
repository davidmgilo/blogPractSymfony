<?php

namespace BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        $em = $this->getDoctrine()->getEntityManager();
        $entry_repo = $em->getRepository("BlogBundle:Entry");
        $entries = $entry_repo->findAll();
        
        foreach($entries as $entry){
            echo $entry->getTitle().'<br/>';
            echo $entry->getCategory()->getName().'<br/>';
            echo $entry->getUser()->getName().'<br/>';
            $tags = $entry->getEntryTag();
            foreach ($tags as $tag){
                echo $tag->getTag()->getName().'<br/>';
            }
            
            echo "<hr/>";
        }
        
        die();
//        return $this->render('BlogBundle:Default:index.html.twig');
    }
    
    public function categoriesAction()
    {
        $em = $this->getDoctrine()->getEntityManager();
        $category_repo = $em->getRepository("BlogBundle:Category");
        $categories = $category_repo->findAll();
        
        foreach($categories as $category){
            echo $category->getName().'<br/>';
//            echo $entry->getCategory()->getName().'<br/>';
//            echo $entry->getUser()->getName().'<br/>';
            $entries = $category->getEntries();
            foreach ($entries as $entry){
                echo $entry->getTitle().'<br/>';
            }
            
            echo "<hr/>";
        }
        
        die();
    }
}
