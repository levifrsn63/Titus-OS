#ifndef WEBUI_SERVER_H
#define WEBUI_SERVER_H

#include <WiFi.h>
#include <WiFiServer.h>

// Use a separate server for the WebUI if you want.
WiFiServer webUIServer(80);

// Declare your functions so the WebUI can call them.
extern void attackLoop();
extern int scanNetworks();
extern void networkSelectionLoop();
extern void startSniffing();
extern void deauthAndSniff();

void startWebUI() {
  webUIServer.begin();
  Serial.println("WebUI server started on port 80");
}

void handleWebUI() {
  WiFiClient client = webUIServer.available();
  if (client) {
    Serial.println("Client connected to WebUI");
    String req = client.readStringUntil('\n');
    req.trim();
    Serial.println("Request: " + req);

    // Act on the request BEFORE responding
    if (req.indexOf("GET /attack") >= 0) {
      attackLoop();
    } else if (req.indexOf("GET /scan") >= 0) {
      scanNetworks();
    } else if (req.indexOf("GET /select") >= 0) {
      networkSelectionLoop();
    } else if (req.indexOf("GET /sniff") >= 0) {
      startSniffing();
    } else if (req.indexOf("GET /deauthsniff") >= 0) {
      deauthAndSniff();
    }

    // Minimal HTML response
    String html = "<!DOCTYPE html><html><head><title>BW16 Deauther</title></head><body>";
    html += "<h1>BW16 Deauther Control</h1>";
    html += "<a href=\"/attack\">Attack</a><br>";
    html += "<a href=\"/scan\">Scan</a><br>";
    html += "<a href=\"/select\">Select</a><br>";
    html += "<a href=\"/sniff\">Sniff</a><br>";
    html += "<a href=\"/deauthsniff\">Deauth+Sniff</a><br>";
    html += "</body></html>";

    client.println("HTTP/1.1 200 OK");
    client.println("Content-Type: text/html");
    client.println("Connection: close");
    client.println();
    client.println(html);

    delay(1);
    client.stop();
    Serial.println("WebUI client disconnected");
  }
}

#endif
