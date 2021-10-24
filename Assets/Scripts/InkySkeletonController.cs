using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;
using UnityEngine.UI;



public class InkySkeletonController : MonoBehaviour
{

    public TextAsset inkFile;
    public GameObject textBox;
    //public GameObject prefabButton;
    public GameObject optionSelect;
    
    
    
    List<string> tags;
    static Story story;
    Text message;

    object option1;
    object option2;
    object option3;
    

  
    static Choice choiceSelected;

    public bool writingText = false;


    // Start is called before the first frame update
    void Start()
    {
        story = new Story(inkFile.text);
        message = textBox.transform.GetChild(0).GetComponent<Text>();
        option1 = optionSelect.transform.GetChild(1).GetChild(0).GetComponent<Text>();
        choiceSelected = null;
        optionSelect.SetActive(false);
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetButtonDown("Jump")){
            if(story.canContinue){
                AdvanceStory();

                if(story.currentChoices.Count > 0){
                    StartCoroutine(ShowChoices());
                }
            }
            else{
                EndStory();
            }
        }
    }

    void AdvanceStory(){
        string currentMessage = story.Continue();
        ParseTags();
        StopAllCoroutines();
        StartCoroutine(TypeMessage(currentMessage));
        
        
    }
//todo
    void EndStory(){

    }

    void ParseTags(){
        tags = story.currentTags;
        
        foreach (string s in tags){
            Debug.Log("tags: " + s);
           // string prefix = s.Split(' ')[0];
            //string suffix = s.Split(' ')[1];

            switch(s){

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

    IEnumerator ShowChoices(){
        Debug.Log("Choices being shown: ");
        List<Choice> choicesList = story.currentChoices;

        Text choiceText;
        for(int i = 0; i < choicesList.Count; i++){
            
            if(i == 0){
                option1 = choicesList[i];
                //choiceText = optionSelect.transform.GetChild(1).transform.GetChild(0)
                //option1.text = choicesList[i].text;
                //GameObject temp = optionSelect.transform.GetChild(1).GetComponent<GameObject>();
               // temp.AddComponent<Selectable>();
                //temp.GetComponent<OptionScript>().element = choicesList[i];
                //temp.GetComponent<Button>().onClick.AddListener(() => { temp.GetComponent<OptionScript>().Decide(); });
                //butt.onClick.AddListener(() => {Decide(choicesList[i]);});
                //optionSelect.GetChild(1).AddComponent<Selectable>();
            }
            else if(i == 1){
                option2 = choicesList[i];
            }
            //temp.AddComponent<Selectable>();
            //temp.GetComponent<Selectable>().element = choicesList[i];
            //temp.GetComponent<Button>().onClick.AddListener(() => { temp.GetComponent<Selectable>().Decide(); });
        }

        optionSelect.SetActive(true);
        textBox.SetActive(false);

        yield return null;
    }

    public void Decide(object element){


        choiceSelected = (Choice)element;
        story.ChooseChoiceIndex(choiceSelected.index);
        optionSelect.SetActive(false);
        textBox.SetActive(true);
    }

    public void SelectOption1(){
        Decide(option1);
    }
    public void SelectOption2(){
        Decide(option2);
    }
    public void SelectOption3(){
        Decide(option3);
    }
}
