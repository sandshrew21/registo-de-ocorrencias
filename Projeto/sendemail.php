<?php

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
//criação de objeto
$mail = new PHPMailer(true);
//configuração do objeto
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'tls';
$mail->Username = 'marco.tereso@gmail.com';
$mail->Password = 'geqgiuetbbjxubmd';
$mail->Port = 587;
//construção da mensagem
$destino = $_POST['email'];
$destinatario = $_POST['nome'];

$mail->setFrom('clientesfelizes@gmail.com', 'INFERNO');
$mail->addAddress($destino);
$mail->isHTML(true);
$mail->Subject = "FELIZ NATAL!";
$sms = "Bem Vindo ".$destinatario."<br>Já pode usufruir das nossas super promoções!Siga para o INFERNO!";
$mail->Body = nl2br($sms);
if(!$mail->send()){
	echo "<script>alert('Não foi possível chegar ao INFERNO');</script>";
}else{
	echo "<script>alert('Parabéns chegou ao INFERNO');</script>";
	echo "<script>window.location='registo.html?enviado=true';</script>";
	
}

?>