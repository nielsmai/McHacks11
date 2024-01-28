using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public float moveSpeed = 5f; 
    public Rigidbody2D rb;
    public Animator animator;

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
    }

    void FixedUpdate() {
        //Movement
        rb.MovePosition(rb.position + movement * moveSpeed * Time.fixedDeltaTime);
        // Debug.Log(rb.position);
        
    }
}
