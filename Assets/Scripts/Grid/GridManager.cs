using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class GridManager : MonoBehaviour
{
   [SerializeField] private int width, height;
   [SerializeField] private Tile tilePrefab;
   [SerializeField] private Transform cam;
   [SerializeField] private Vector3 offset = new Vector3(1.0f, 0.5f, 0.0f);

   private Dictionary<Vector2, Tile> _tiles = new Dictionary<Vector2, Tile>();

   private void Awake()
   {
      GenerateGrid();
   }

   void GenerateGrid()
   {
      for (int x = 0; x < width; x++)
      {
         for (int y = 0; y < height; y++)
         {
            var spawnedTile = Instantiate(tilePrefab, new Vector3(x, y), Quaternion.identity);
            spawnedTile.name = $"Tile {x}, {y}";
            spawnedTile.gameObject.transform.SetParent(gameObject.transform);

            var isOffset = ((x % 2 == 0 && y % 2 != 0) || (x % 2 != 0 && y % 2 == 0));
            spawnedTile.Init(isOffset);

            _tiles[new Vector2(x, y)] = spawnedTile;
         }
      }

      cam.transform.position = new Vector3((float)width / 2 - 0.5f, (float)height / 2 - 0.5f, -10) + offset;
   }

   public Tile GetTileAtPosition(Vector2 pos)
   {
      if (_tiles.TryGetValue(pos, out var tile))
      {
         return tile;
      }

      return null;
   }

   public Vector3 GetPosOfTileIndex(int index)
   {
      return _tiles.ToList().ElementAtOrDefault(index).Key;
   }
}
