<?php

function isUser(){


    session_start();

    $isUser = $_SESSION['usuario'];

    return $isUser;
}