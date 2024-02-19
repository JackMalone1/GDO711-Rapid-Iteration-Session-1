using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "PlayerData", menuName = "RoomData/PlayerStats", order = 1)]
public class PlayerStats : ScriptableObject
{
    public int bloodpointsAvailable;
    public int playerDefaultStrength;
    public int numberOfEnemies;
}
