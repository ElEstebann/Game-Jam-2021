using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ChoiceButton : MonoBehaviour
{
    private int index;
    private InkySkeletonController inky;

    public void Register(InkySkeletonController inky, int index)
    {
        this.inky = inky;
        this.index = index;
        transform.GetComponent<Button>().onClick.AddListener(this.RunChoice);
        Debug.LogFormat(this.gameObject, "Register %d", index);
    }

    void RunChoice()
    {
        Debug.LogFormat(this.gameObject, "Choice! %d", index);
        inky.Decide(index);
    }
}
