using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;


public class InkySkeletonController : MonoBehaviour
{

    public TextAsset inkFile;
    public GameObject textBox;
    public GameObject optionSelect;
    public Animator skeletonAnimator;
    public Animator dogAnimator;
    public Animator treeAnimator;


    List<string> tags;
    Story story;
    TextMeshProUGUI message;

    public List<ChoiceButton> buttons;

    public AudioSource musicPlayer;
    public AudioSource gameOverPlayer;


    void Start()
    {
        for (int i = 0; i < buttons.Count; i++)
        {
            buttons[i].Register(this, i);
        }

        LoadStory(inkFile);
        message = textBox.transform.GetChild(0).GetComponent<TextMeshProUGUI>();
        optionSelect.SetActive(false);
        AdvanceStory();

    }

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

    void LoadStory(TextAsset storyFile)
    {
        story = new Story(storyFile.text);
        story.onError += (msg, type) =>
        {
            if (type == Ink.ErrorType.Warning)
                Debug.LogWarning(msg);
            else
                Debug.LogError(msg);
        };

        story.BindExternalFunction("skeletonAnimationTrigger", (string name) =>
        {
            Debug.LogFormat("Trigger {0}", name);
            skeletonAnimator.SetTrigger(name);
        });
        story.BindExternalFunction("skeletonAnimationFloat", (string name, float value) =>
        {
            Debug.LogFormat("Float {0} {1}", name, value);
            skeletonAnimator.SetFloat(name, value);
        });
        story.BindExternalFunction("skeletonAnimationBool", (string name, bool value) =>
        {
            Debug.LogFormat("Bool {0} {1}", name, value);
            skeletonAnimator.SetBool(name, value);
        });
        story.BindExternalFunction("treeAnimationBool", (string name, bool value) =>
        {
            Debug.LogFormat("TreeBool {0} {1}", name, value);
            treeAnimator.SetBool(name, value);
        });
        story.BindExternalFunction("gameOver", () => {
            musicPlayer.Pause();
            gameOverPlayer.Play();
        });
        story.BindExternalFunction("restart", () => {
           SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        });
    }

    void AdvanceStory()
    {
        string currentMessage = story.Continue();
        StopAllCoroutines();
        StartCoroutine(TypeMessage(currentMessage));
    }
    //todo
    void EndStory()
    {
        Debug.Log("Reached End of Story");
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
        if (!musicPlayer.isPlaying) {
            musicPlayer.Play();
        }
        AdvanceStory();
    }
}
