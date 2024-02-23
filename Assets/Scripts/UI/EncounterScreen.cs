using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UI.Widgets;
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
        var extraInfoBox = Create("actions-box", "bordered-box");
        var characterBox = Create("character-box", "bordered-box");
        var gameBox = Create("game-box", "bordered-box");
        var mainBox = Create("main-box", "elements-box");
        var infoBox = Create("info-box", "elements-box");
        
        var moveButton = Create<HoverableButton>();
        moveButton.text = "Move";
        moveButton.clicked += MoveClicked;
        actionsBox.Add(moveButton);
        
        var otherButton = Create<HoverableButton>();
        otherButton.text = "Other";
        actionsBox.Add(otherButton);
        
        Label infoLabel = Create<Label>("Label");
        infoLabel.text = $"Select a tile before attempting to move";
        extraInfoBox.Add(infoLabel);

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
        infoBox.Add(actionsBox);
        infoBox.Add(extraInfoBox);
        container.Add(mainBox);
        container.Add(infoBox);
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
