using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UIElements;

namespace UI.Widgets
{
    public class HoverableButton : Button, IPointerEnterHandler, IPointerExitHandler
    {
        public void OnPointerEnter(PointerEventData eventData)
        {
            Debug.Log("Enter");
        }

        public void OnPointerExit(PointerEventData eventData)
        {
            Debug.Log("Exit");
        }
    }
}