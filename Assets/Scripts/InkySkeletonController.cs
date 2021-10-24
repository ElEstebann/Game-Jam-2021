using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;
using TMPro;



public class InkySkeletonController : MonoBehaviour
{

    public TextAsset inkFile;
    public GameObject textBox;
    //public GameObject prefabButton;
    public GameObject optionSelect;



    List<string> tags;
    Story story;
    TextMeshProUGUI message;

    public List<ChoiceButton> buttons;

    public bool writingText = false;


    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < buttons.Count; i++)
        {
            buttons[i].Register(this, i);
        }

        story = new Story(inkFile.text);
        message = textBox.transform.GetChild(0).GetComponent<TextMeshProUGUI>();
        optionSelect.SetActive(false);
        AdvanceStory();

    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetButtonDown("Jump"))
        {
            if (story.canContinue)
            {
                AdvanceStory();
            }
            else
            {
                if (story.currentChoices.Count > 0)
                {

                    StartCoroutine(ShowChoices());
                }
                else
                {
                    EndStory();
                }
            }
        }
    }

    void AdvanceStory()
    {
        string currentMessage = story.Continue();
        ParseTags();
        StopAllCoroutines();
        StartCoroutine(TypeMessage(currentMessage));


    }
    //todo
    void EndStory()
    {
        Debug.Log("Reached End of Story");

    }

    void ParseTags()
    {
        tags = story.currentTags;

        foreach (string s in tags)
        {
            Debug.Log("tags: " + s);
            // string prefix = s.Split(' ')[0];
            //string suffix = s.Split(' ')[1];
        }
    }

    IEnumerator TypeMessage(string messageIn)
    {
        message.text = "";
        foreach (char letter in messageIn.ToCharArray())
        {
            message.text += letter;
            yield return null;
        }
        yield return null;



    }

    IEnumerator ShowChoices()
    {
        Debug.Log("Choices being shown: ");
        List<Choice> choicesList = story.currentChoices;
        Debug.Log(choicesList);


        optionSelect.SetActive(true);
        foreach (ChoiceButton button in buttons)
        {
            button.gameObject.SetActive(false);
        }

        if (choicesList.Count > buttons.Count)
        {
            Debug.LogErrorFormat("too many choices, expected no more than {0}, got {1}", buttons.Count, choicesList.Count);
        }

        for (int i = 0; i < Math.Min(choicesList.Count, buttons.Count); i++)
        {
            buttons[i].transform.GetChild(0).GetComponent<TextMeshProUGUI>().text = choicesList[i].text;
            buttons[i].gameObject.SetActive(true);
        }


        textBox.SetActive(false);

        yield return null;
    }

    public void Decide(int index)
    {
        story.ChooseChoiceIndex(index);
        optionSelect.SetActive(false);
        textBox.SetActive(true);
        AdvanceStory();
    }
}
