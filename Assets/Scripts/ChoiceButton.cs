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
        Debug.LogFormat(this.gameObject, "Register {0}", index);
    }

    void RunChoice()
    {
        Debug.LogFormat(this.gameObject, "Choice! {0}", index);
        inky.Decide(index);
    }
}
