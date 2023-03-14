//
// Created by יובל היטר on 10/02/2023.
//

#include "Data.h"
#include "iostream"
Data::Data() {
    msg = "";
    level = 1;
    level = 0;
    menu_flags[0] = true;
}

void Data::dec_Level() {

    this->level--;
}

void Data::set_message(std::string other) {
    this->msg = std::move(other);
}

void Data::add_Score(int s) {
    this->score+=s;
}

void Data::inc_Level() {
    this->level++;
}

int Data::message_size() {
    return msg.size();
}

const char * Data::msg_c_str(){
    return this->msg.c_str();
}

int Data::get_level() const {
    return this->level;
}

