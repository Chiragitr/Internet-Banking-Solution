/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USER
 */
import java.util.*;
public class cron_main {

public static void main(String[] chirag) 
{
    Timer timer = new Timer();
    cronjob crono = new cronjob();
    timer.scheduleAtFixedRate(crono, 0, 5000);
    
}
}
