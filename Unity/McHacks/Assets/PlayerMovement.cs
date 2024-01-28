using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float moveSpeed = 5f; 
    public Rigidbody2D rb;
    public Animator animator;

    // Add camera follow
    public Camera cam;
    public Vector3 offset; // The distance between the camera and the player

    Vector2 movement;


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
        if (movement.x < 0) {
            transform.localScale = new Vector3(-1, 1, 1);
        } else if (movement.x > 0) {
            transform.localScale = new Vector3(1, 1, 1);
        }

        // Update the camera position
        cam.transform.position = transform.position + offset;
    }

    void FixedUpdate() {
        //Movement
        rb.MovePosition(rb.position + movement * moveSpeed * Time.fixedDeltaTime);
        // Debug.Log(rb.position);
        
    }
}
