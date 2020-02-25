package com.dimple.test.multithread;

import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.Servlet;

public class HasStatic {

    private static int x = 100;

    public static void main(String args[]) {
        int [] arr1 ={1,2,3};
        int [] arr2 ={1,2,3};
        int game = game(arr1, arr2);
        System.out.println(game);
    }

    public static int game(int[] guess, int[] answer) {
        int len = guess.length;
        int flag = 0;
        for (int i = 0; i < len; i++) {
            int a = (int)Math.random()*guess.length;
            int temp = answer[a];
            if(guess[i]==temp){
                flag++;
            }
        }
        return flag;
    }
}


