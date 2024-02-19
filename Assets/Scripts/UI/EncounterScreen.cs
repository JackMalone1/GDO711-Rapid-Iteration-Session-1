using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using UnityEngine.UIElements;

public class EncounterScreen : MonoBehaviour
{
    [SerializeField] private UIDocument document;
    [SerializeField] private StyleSheet styleSheet;
    [SerializeField] private Player player;

    public static event Action MoveClicked;

    private void Start()
    {
        StartCoroutine(Generate());
    }

    private void OnValidate()
    {
        if (Application.isPlaying) return;
        StartCoroutine(Generate());
    }

    IEnumerator Generate()
    {
        yield return null;
        
        var root = document.rootVisualElement;
        root.Clear();
        
        root.styleSheets.Add(styleSheet);
        
        var container = Create("container");
        var actionsBox = Create("actions-box", "bordered-box");
        var characterBox = Create("character-box", "bordered-box");
        var gameBox = Create("game-box", "bordered-box");
        var mainBox = Create("main-box");
        
        var moveButton = Create<Button>();
        moveButton.text = "Move";
        moveButton.clicked += MoveClicked;
        actionsBox.Add(moveButton);
        
        var otherButton = Create<Button>();
        otherButton.text = "Other";
        actionsBox.Add(otherButton);

        FieldInfo[] fields = player.Stats.GetType().GetFields();

        foreach (var field in fields)
        {
            Label label = Create<Label>("Label");
            var data = field.GetValue(player.Stats);
            label.text = $"{field.Name}: {data}";
            characterBox.Add(label);
        }

        mainBox.Add(gameBox);
        mainBox.Add(characterBox);
        container.Add(mainBox);
        container.Add(actionsBox);
        root.Add(container);
    }
    
    private VisualElement Create(params string[] classNames)
    {
        return Create<VisualElement>(classNames);
    }

    private T Create<T>(params string[] classNames) where T : VisualElement, new()
    {
        var ele = new T();
        foreach (var className in classNames)
        {
            ele.AddToClassList(className);
        }

        return ele;
    }
}
