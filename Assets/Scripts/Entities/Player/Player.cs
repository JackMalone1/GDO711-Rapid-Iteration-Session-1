using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : Entity
{
   [SerializeField] private PlayerStats stats;

   public PlayerStats Stats => stats;


   private void Awake()
   {
      EncounterScreen.MoveClicked += OnMovedClicked;
   }

   private void OnMovedClicked()
   {
      Debug.Log("Move clicked");
   }
}
