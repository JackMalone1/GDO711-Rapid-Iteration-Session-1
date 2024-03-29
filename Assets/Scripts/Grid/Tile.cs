using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tile : MonoBehaviour
{
    [SerializeField] private Color baseColor, offsetColor;
    [SerializeField] private SpriteRenderer render;
    [SerializeField] private GameObject highlight;
 
    public void Init(bool isOffset) {
        render.color = isOffset ? offsetColor : baseColor;
    }
 
    void OnMouseEnter() {
        highlight.SetActive(true);
    }
 
    void OnMouseExit()
    {
        highlight.SetActive(false);
    }
}
