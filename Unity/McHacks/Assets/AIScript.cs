using UnityEngine;

public class AIScript : MonoBehaviour
{
    public float speed; // the speed of the enemy movement
    public float range; // the range of the enemy detection
    public Transform player; // the reference to the player transform


    private Object thisObject;

    private void Awake()
    {
        thisObject = GetComponent<Object>();
        // Set default player health to 3
    }

    private void Start()
    {
        // Set the player health to 3 if it is not set
        if (!PlayerPrefs.HasKey(thisObject.ID))
        {
            PlayerPrefs.SetInt(thisObject.ID, 3);
        }
    }

    void Update()
    {
        // get the distance between the enemy and the player
        float distance = Vector3.Distance(transform.position, player.position);

        // if the distance is less than or equal to the range
        if (distance <= range)
        {
            // move the enemy towards the player
            transform.position = Vector3.MoveTowards(transform.position, player.position, speed * Time.deltaTime);

            // flip the enemy sprite to face the player
            if (player.position.x > transform.position.x)
            {
                // face right
                transform.localScale = new Vector3(1, 1, 1);
            }
            else
            {
                // face left
                transform.localScale = new Vector3(-1, 1, 1);
            }
        }
    }

    // this method is called when the enemy collides with another object
    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.CompareTag("PlayerController"))
        {
            //Decrement player health
            // collision.GetComponent<PlayerMovement>().HeartCount--;
            // Get the player's health
            int playerHealth = (int) collision.GetComponent<PlayerMovement>().HeartCount;
            // Decrement the player's health
            playerHealth--;
            Debug.Log(playerHealth);
            // Update the player's health
            collision.GetComponent<PlayerMovement>().HeartCount = playerHealth;
            // Set PlayerPrefs to the new health
            PlayerPrefs.SetInt(thisObject.ID, playerHealth);
            // PlayerPrefs.SetInt(thisObject.ID, PlayerPrefs.GetInt(thisObject.ID) - 1);
            //Destroy the enemy
            Destroy(gameObject);
        }
    }
}