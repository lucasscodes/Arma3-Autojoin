# Arma3-Autojoin
Functionality:
This Script uses AutoHotkey to get you automatically on a filled Arma Server which only has VIPSlots left.

HowTo:
First you enter a number in the popup GUI, this defines which slot is only for the VIPs.
(e.g. the server has 100 Slots max. and the Slots 96-100 are reserved for VIPs
=> you enter 95, which is the first number not inside the VIPslots.)

Algorithm:
1.Use GUI to get boundary.
2.The script reloads the serverlist, if the playercount gets close to the freemium slots it refreshes faster.
  It uses 250-500ms reload cycles if only one player is blocking the last free slot,
  but 1000-1600ms if there are also VIPs on the VIP slots.
  Also it will use "+= 50ms"(max. 5000ms) if there is no number printed yet due serverlag.
3.If the free slot gets available, instantly click the join button and wait for 2000ms.
4.Wait max. 70*500ms for a joinerror from the server 
  If an error occures, go back to 2.
  Beep every 10sec 600Hz@25ms
5.If there was no error, the loading is completed and the joinbot will close itself.
  Beep once 300Hz@300ms

Constraints:
-Playercount in (range:1,(...),100)
-First you need to filter the serverlist => 
  The targetserver should be the first one and marked with the "white bar".
-Tested with Arma 1.84 or 1.94, newer versions could change the UI 
  => new colours or locations of errormessage, playercount, joinbutton, exit errormessage etc.
-This is hardcoded for a 1680*1050 Display, it just reads hardcoded Pixelvalues.
  If u use another screensize, change these values or write the obvous missing function to generate them.
-Also the loading will only fail inside func. fehlgeschlagen() 
  if the errormessage is formatted like "ErrorAtFehlgeschlagen.png",
  if u want to use the "Fehlgeschlagen.png" variant, u need to change the values inside line 566-586

This script is a really simple and unpolished, did it 2-4yrs ago and only needed it to join friends.
Sadly the GUI prompts and comments are in german.
