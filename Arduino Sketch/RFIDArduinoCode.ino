#include <SPI.h>
#include <MFRC522.h>
#include <LiquidCrystal.h>
LiquidCrystal lcd(7,6,5,4,3,2);
int count=0;

/* Set your new UID here! */
#define NEW_UID {0xDE, 0xAD, 0xBE, 0xEF}
#define SS_PIN 10
#define RST_PIN 9

MFRC522 mfrc522(SS_PIN, RST_PIN);        // Create MFRC522 instance.
MFRC522::MIFARE_Key key;

void setup() {
       Serial.begin(9600);        // Initialize serial communications with the PC
        while (!Serial);           // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
        SPI.begin();               // Init SPI bus
        mfrc522.PCD_Init();        // Init MFRC522 card
       lcd.begin(16,2);
     
        
        // Prepare key - all keys are set to FFFFFFFFFFFFh at chip delivery from the factory.
        for (byte i = 0; i < 6; i++) {
                key.keyByte[i] = 0xFF;
        }
}
void loop() {
        lcd.clear();
         lcd.print("Scan Card");
         
        // Look for new cards, and select one if present
        if ( ! mfrc522.PICC_IsNewCardPresent() || ! mfrc522.PICC_ReadCardSerial() ) {
            delay(50);
            return;
            count=0;
        }
        
        // Now a card is selected. The UID and SAK is in mfrc522.uid.
        
        // Dump UID
        if(count==0)
        {
          String val="";
        for (byte i = 0; i < mfrc522.uid.size; i++) {
              lcd.setCursor(0,1);
              val+=mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ";
              val+=String(mfrc522.uid.uidByte[i],HEX);
        } 
        lcd.clear();
        lcd.setCursor(0,1);
        Serial.println(val);
        }
        delay(750);
       while (!Serial.available()) {} 
       String output="";
       while(Serial.available())
       {
       char incomingByte;
        if (Serial.available() > 0) {
                incomingByte = Serial.read();
                output+=incomingByte;  
        }
       }
       if(output.length()>0)
       {
         lcd.clear();
         lcd.print(output);
       }
      Serial.flush();

        delay(2500);
        
        
}
