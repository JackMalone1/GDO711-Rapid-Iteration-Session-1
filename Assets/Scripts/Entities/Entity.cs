using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Entity : MonoBehaviour
{
    [SerializeField] private int tilePosition;
    [SerializeField] private Vector2 tileOffset;
    [SerializeField] private GridManager gridManager;

    private void Start()
    {
        Vector3 desiredPosition = gridManager.GetPosOfTileIndex(tilePosition);
        transform.position = desiredPosition + new Vector3(tileOffset.x, tileOffset.y, 0.0f);
    }
}
