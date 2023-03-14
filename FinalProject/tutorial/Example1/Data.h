//
// Created by יובל היטר on 10/02/2023.
//
#pragma once
#include <iostream>
#define MainMenu                  0
#define StoreMenu                 1
#define PauseMenu                 2
#define SettingsMenu              3
#define LeadersMenu               4
#define LevelMenu                 5
#define LooseMenu                 6
#define GameOverMenu              7



using namespace std;

class Data {
public:


    Data();
    void inc_Level();
    void dec_Level();
    void set_character_name(std::string other);
    void set_message(std::string other);
    void add_Score(int s);
    int message_size();
    const char * msg_c_str();
    int get_level() const;
    char characterName[256] = "";
    bool menu_flags[10] = {false};


private :
    std::string msg;
    int level;
    int score ;
};


