# Day 06 of 90DaysOfDevOps : Linux Fundamentals - Read & Write Text Files
Today, I am continuing my Day 6 practice with basic file read/write io Linux commands, with continuation after Day 5. 
* *touch notes.txt*: This command has created an empty file with name notes.txt. In this notes.txt file, I am saving
  Shortcuts for creating `.md` file. 
* *touch day6.txt*: Also, I have created another file with name day5.txt for my tracking run commands and their output.

  <img width="467" height="242" alt="image" src="https://github.com/user-attachments/assets/1e43228e-1ea5-4881-b87c-ef66cd09da74" />

* *echho "line 1" > notes.txt"*: This command added first line in the notes.text file. The greater than '>' symbol uses to redirect
   the output of echo command to file and can be used to add content in new file. If the file has content in it,
   then this command override the output with the previous content from file.
* *cat notex.txt*: Using cat command for displaying the content of notes.txt file.
* *echo "line 2" >> notes.txt"*: Using double '>>' operator, it appends the content of echo command to the end of the file, without erasing
   existing content.
  <img width="928" height="239" alt="image" src="https://github.com/user-attachments/assets/9b2ebb88-c945-487e-955e-d3c466cc4543" />

* *echo "line3" | tee -a notes.txt* : Using this single command, I have inserted line 3 in text file and also, shown the content of the file.
<img width="956" height="35" alt="image" src="https://github.com/user-attachments/assets/bad2d40f-2215-41a9-ba4c-5d9958afdbc7" />

* *vim notes.txt*: Opend linux text editor and added multiple lines in the notes.txt file.
  Shortcuts use for vim text editor: 
  - press 'i' to enable INSERT mode.
  - after adding content press 'esc' and then ':' and 'wq' for saving the content in the file.
  <img width="959" height="136" alt="image" src="https://github.com/user-attachments/assets/6c836063-4f31-408e-af06-6d897fd99cc0" />

*  *head -n 4 notes.txt*: By this command, output displayed first 4 lines from the notes.txt file.
*  *tail -n 4 notes.txt*: By this command, output displayed last 4 lines from the notes.txt file.
  <img width="908" height="232" alt="image" src="https://github.com/user-attachments/assets/eaea6d71-4cbb-4e12-805e-0905ba1c1990" />

