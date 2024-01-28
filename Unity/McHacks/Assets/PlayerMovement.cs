using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float moveSpeed = 5f;
    public Rigidbody2D rb;
    public Animator animator;

    public GameObject topRightLimitGameObject;
    public GameObject bottomLeftLimitGameObject;

    private Vector3 topRightLimit;
    private Vector3 bottomLeftLimit;

    public float HeartCount = 3;

    // Add camera follow
    // public Camera cam;
    public Vector3 offset; // The distance between the camera and the player

    Vector2 movement;

    private void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
        PlayerPrefs.DeleteAll();
    }

    void Start()
    {
        topRightLimit = topRightLimitGameObject.transform.position;
        bottomLeftLimit = bottomLeftLimitGameObject.transform.position;
    }


    // Update is called once per frame
    void Update()
    {
        //Input
        movement.x = Input.GetAxisRaw("Horizontal");
        // Debug.Log(movement.x);
        movement.y = Input.GetAxisRaw("Vertical");
        // Debug.Log(movement.y);
        // animator.SetFloat("Horizontal", movement.x);
        // animator.SetFloat("Vertical", movement.y);
        animator.SetFloat("Speed", movement.sqrMagnitude);

        // Flip the sprite when moving left
        if (movement.x < 0)
        {
            transform.localScale = new Vector3(-1, 1, 1);
        }
        else if (movement.x > 0)
        {
            transform.localScale = new Vector3(1, 1, 1);
        }

        // Update the camera position
        // cam.transform.position = transform.position + offset;
    }

    void FixedUpdate()
    {

        // Stop the sprite from going out of borders
        if ((rb.position.x <= bottomLeftLimit.x && movement.x == -1) || (rb.position.x >= topRightLimit.x && movement.x == 1))
        {
            movement.x = 0;
        }

        if ((rb.position.y <= bottomLeftLimit.y && movement.y == -1) || (rb.position.y >= topRightLimit.y && movement.y == 1))
        {
            movement.y = 0;
        }

        //Movement
        rb.MovePosition(rb.position + movement * moveSpeed * Time.fixedDeltaTime);
        // Debug.Log(rb.position);

    }
}
