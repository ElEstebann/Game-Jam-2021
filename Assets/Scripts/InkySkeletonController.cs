using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;

public class InkySkeletonController : MonoBehaviour
{

    public TextAsset inkFile;
    public GameObject textBox;
    public GameObject prefabButton;
    public GameObject optionPanel;
    List<string> tags;
    static Story story;
    Text message;
    static Choice choiceSelected;

    public bool writingText = false;


    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkFile.text);
        message = textBox.transform.GetChild(0).GetComponent<Text>();
        choiceSelected = null;
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetButtonDown("Jump")){
            if(story.canContinue){
                advanceStory();
            }
            else{
                endStory();
            }
        }
    }

    void advanceStory(){
        string currentMessage = story.Continue();
        ParseTags();
        StopAllCoroutines();
        StartCoroutine(TypeMessage(currentMessage));
        
        
    }

    void endStory(){

    }

    void ParseTags(){
        tags = story.currentTags;
        foreach (string s in tags){
            string prefix = s.Split(' ')[0];
            string suffix = s.Split(' ')[1];

            switch(prefix.ToLower()){

            }


        }
    }

    IEnumerator TypeMessage(string messageIn){
        message.text = "";
        foreach(char letter in messageIn.ToCharArray()){
            message.text += letter;
            yield return null;
        }
        yield return null;
        
        

    }
}
