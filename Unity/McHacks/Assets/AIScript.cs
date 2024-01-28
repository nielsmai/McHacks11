using UnityEngine;

public class AIScript : MonoBehaviour
{
    public float speed; // the speed of the enemy movement
    public float range; // the range of the enemy detection
    public Transform player; // the reference to the player transform

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
}