# literate-auth
To use the included Bash script to implement a two-factor authentication layer (2FA) on a Linux server, follow these steps:

1. **Download and save the script:**
     Save the script with:
     ``` bash
     git clone https://github.com/carligithub400/literate-auth/
     ```
     Make sure it has execution rights:

     ``` bash
     chmod a+xrw literate-auth/
      ```

3. **Set up a Telegram bot:**
     - Create a new Telegram bot by talking to the BotFather on Telegram. Make a note of the token provided.

4. **Get your chat ID:**
     - Start a chat with your newly created bot on Telegram.
     - Visit the following URL and replace `<YOUR_BOT_TOKEN>` with your actual bot token: `https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates`
     - Look for the 'chat' part in the answer. The `id` field in the `chat` object is your chat ID. Make a note of it.

5. **Edit the script:**
     - Open the script in a text editor and replace "token" with your Telegram bot token and "id" with your chat ID.

6. **Run the script:**
     - Run the script in your terminal:

       ``` bash
       bash literate-auth/main.sh
       ```

7. **Follow the directions:**
     - The script will generate a random 6-digit challenge and send it to your Telegram bot.
     - You will be asked to enter the challenge answer without the entry being displayed.
     - Type the correct answer to continue.

8. **Access to the scale:**
     - If the answer is correct, the script grants access to the `/bin/bash` shell.
     - If the answer is incorrect, the connection will be disconnected.

9. **Cleanup:**
     - After successful authentication, the script deletes the challenge file.

10. **Create a user and connect to ssh**
      - Create a user with the command that has the code main.sh as the default shell.

      ``` bash
         sudo adduser $user --shell=$path_main.sh
       ```
      - Change $user with the name of the user and $path_main.sh with the path of the cloned code.

      - Ssh to the user and if all goes well it will say that you have to enter a code.

**Important Considerations:**
- **Test environment:** This script is for testing purposes only. Do not use it in production or for critical tasks.
- **Security:** Be careful where and how you deploy this script. Telegram is used for communication, so make sure your bot and chat ID are safe.
- **Permissions:** Ensure that the script has the necessary permissions to read and write to the file system.

By following these steps, you can experiment with implementing a simple 2FA layer using Telegram for code transfer in a controlled test environment.
