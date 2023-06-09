#include "BasicScene.h"
#include <Eigen/src/Core/Matrix.h>
#include <memory>
#include "SceneWithImGui.h"
#include "GLFW/glfw3.h"
#include <random>
#include "Mesh.h"
#include "PickVisitor.h"
#define IMGUI_DEFINE_MATH_OPERATORS
#include "imgui_internal.h"
#include "IglMeshLoader.h"
#include "ModelsFactory.h"
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
#include <glad/glad.h>

using namespace cg3d;



void BasicScene::Init(float fov, int width, int height, float near, float far) {

    initProperties(width, height);
    this->statistics->menu_flags[LoadingMenu_OP] = true;
    done = 0;
    init_helpers();
    init_objects();
    init_cameras(fov,width,height,near,far);
    setFonts();
    setStartPos();
    setImage();




}


void BasicScene::SetCamera(int index)
{
    camera = cameras[index];
    viewport->camera = camera;
}
void BasicScene::init_cameras(float fov, int width, int height,float near, float far) {

    //Set camera list
    cameras.resize(cameras.capacity());
    cameras[0] = Camera::Create("global view", fov, float(width) / height, near, far);
    cameras[1] = Camera::Create("snake front view", fov, float(width) / height, near, far);
    cameras[2] = Camera::Create("snake back view", fov, float(width) / height, near, far);
    cameras[3] = Camera::Create("snake back view", fov, float(width) / height, near, far);
    number_of_cameras = int(cameras.size());


    // x axis is for move step to left and right,
    // y axis moves down and up, z axis is for front and back.


    // Set front
    snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[0]);
    cameras[0]->Translate(Eigen::Vector3f(0.2f, 1.f, -6.f));
    cameras[0]->Rotate(M_PI, Movable::Axis::Y);
    cameras[0]->Rotate(-M_PI/30, Movable::Axis::X);


    // Set mid snake view
    snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[1]);
    cameras[1]->Translate(Eigen::Vector3f(-3.f, 2.f, -15.f));
    cameras[1]->Rotate(M_PI, Movable::Axis::Y);
   // cameras[1]->Rotate(M_PI/8, Movable::Axis::X);

    //Set over-view
    snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[2]);
    cameras[2]->Translate(Eigen::Vector3f(-5.f, 10.f, -20.f));
    cameras[2]->Rotate(M_PI, Movable::Axis::Y);
    cameras[2]->RotateByDegree(-15.f, Movable::Axis::X);


    //Set over-view
    cameras[3]->Translate(-50, Axis::Z);
    cameras[3]->Translate(50, Axis::Y);
    cameras[3]->Rotate(-M_PI/4, Axis::Y);
//    snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[3]);
//    cameras[3]->Translate(Eigen::Vector3f(0.f, 10.f, -50.f));
//    cameras[3]->Rotate(M_PI, Movable::Axis::Y);
//    cameras[3]->RotateByDegree(-15.f, Movable::Axis::Y);
    camera = cameras[3];

}
void BasicScene::resetCameras(){
    //set the cameras on the new snake after level up.
    snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[0]);

    snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[1]);

    snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[2]);

    //snake->GetSnakeBones()[snake->GetSnakeBones().size()-1]->AddChild(cameras[3]);
}
void BasicScene::initProperties( int width, int height){
    windowFlags = ImGuiWindowFlags_NoMove | ImGuiWindowFlags_NoTitleBar |
                  ImGuiWindowFlags_NoResize |ImGuiWindowFlags_NoBringToFrontOnFocus  |
                  ImGuiWindowFlags_NoScrollbar;

    screen_height= height;
    screen_width = width;
    statistics = GameStatistics::getInstance();
    data = Data::getInstance();
    windowSize = ImVec2(window_width, window_height);
}
void BasicScene::setImage(){

    //setting the snake texture.
    backgroundImage = stbi_load("../tutorial/Final/images/snake/7x7.jpg", &image_width , &image_height, &channels, STBI_rgb_alpha);
    if (backgroundImage == NULL) {
        // Error handling if the image couldn't be loaded
        std::cout << "snake image not loaded! " << std::endl;
    }
    else {
        glGenTextures(1, &backgroundSnakeTexture);
        glBindTexture(GL_TEXTURE_2D, backgroundSnakeTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image_width, image_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, backgroundImage);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        stbi_image_free(backgroundImage);
        std::cout << "snake image loaded successfully! " << std::endl;
    }


    //setting the leaders texture.
    backgroundImage = stbi_load("../tutorial/Final/images/leaders/7x7.png", &image_width , &image_height, &channels, STBI_rgb_alpha);
    if (backgroundImage == NULL) {
        // Error handling if the image couldn't be loaded
        std::cout << "leaders image not loaded! " << std::endl;
    }
    else {
        glGenTextures(1, &backgroundLeadersTexture);
        glBindTexture(GL_TEXTURE_2D, backgroundLeadersTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image_width, image_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, backgroundImage);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        stbi_image_free(backgroundImage);
        std::cout << "leaders image loaded successfully! " << std::endl;
    }


    //setting the store texture.
    backgroundImage = stbi_load("../tutorial/Final/images/store/7x7.png", &image_width , &image_height, &channels, STBI_rgb_alpha);
    if (backgroundImage == NULL) {
        // Error handling if the image couldn't be loaded
        std::cout << "store image not loaded! " << std::endl;
    }
    else {
        glGenTextures(1, &backgroundStoreTexture);
        glBindTexture(GL_TEXTURE_2D, backgroundStoreTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image_width, image_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, backgroundImage);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        stbi_image_free(backgroundImage);
        std::cout << "store image loaded successfully! " << std::endl;
    }


    //setting the win texture.
    backgroundImage = stbi_load("../tutorial/Final/images/win/7x7.png", &image_width , &image_height, &channels, STBI_rgb_alpha);
    if (backgroundImage == NULL) {
        // Error handling if the image couldn't be loaded
        std::cout << "win image not loaded! " << std::endl;
    }
    else {
        glGenTextures(1, &backgroundWinTexture);
        glBindTexture(GL_TEXTURE_2D, backgroundWinTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image_width, image_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, backgroundImage);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        stbi_image_free(backgroundImage);
        std::cout << "win image loaded successfully! " << std::endl;
    }


    //setting the lose texture.
    backgroundImage = stbi_load("../tutorial/Final/images/loose/7x7.jpg", &image_width , &image_height, &channels, STBI_rgb_alpha);
    if (backgroundImage == NULL) {
        // Error handling if the image couldn't be loaded
        std::cout << "win image not loaded! " << std::endl;
    }
    else {
        glGenTextures(1, &backgroundLoseTexture);
        glBindTexture(GL_TEXTURE_2D, backgroundLoseTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image_width, image_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, backgroundImage);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        stbi_image_free(backgroundImage);
        std::cout << "win image loaded successfully! " << std::endl;
    }


    //setting the level texture.
    backgroundImage = stbi_load("../tutorial/Final/images/level/7x7.jpg", &image_width , &image_height, &channels, STBI_rgb_alpha);
    if (backgroundImage == NULL) {
        // Error handling if the image couldn't be loaded
        std::cout << "win image not loaded! " << std::endl;
    }
    else {
        glGenTextures(1, &backgroundLevelTexture);
        glBindTexture(GL_TEXTURE_2D, backgroundLevelTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image_width, image_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, backgroundImage);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        stbi_image_free(backgroundImage);
        std::cout << "win image loaded successfully! " << std::endl;
    }

    //setting the settings texture.
    backgroundImage = stbi_load("../tutorial/Final/images/settings/7x7.jpg", &image_width , &image_height, &channels, STBI_rgb_alpha);
    if (backgroundImage == NULL) {
        // Error handling if the image couldn't be loaded
        std::cout << "win image not loaded! " << std::endl;
    }
    else {
        glGenTextures(1, &backgroundSettingsTexture);
        glBindTexture(GL_TEXTURE_2D, backgroundSettingsTexture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, image_width, image_height, 0, GL_RGBA, GL_UNSIGNED_BYTE, backgroundImage);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        stbi_image_free(backgroundImage);
        std::cout << "win image loaded successfully! " << std::endl;
    }
}
void BasicScene::setFonts() {
    ImGuiIO &io = ImGui::GetIO();
    ImFontConfig font_config;
    font_config.GlyphExtraSpacing = ImVec2(0.0f, 1.0f); // Set extra spacing for each glyph
    font_config.GlyphOffset = ImVec2(0.0f, -1.0f); // Set glyph offset to adjust for extra spacing
    font_config.SizePixels = 20.0f;
    headerFont = io.Fonts->AddFontFromFileTTF("../tutorial/Final/fonts/Broxford.otf", 24.0f, &font_config);
    messageFont = io.Fonts->AddFontFromFileTTF("../tutorial/Final/fonts/Amena.otf", 20.0f, &font_config);
    leadersFont = io.Fonts->AddFontFromFileTTF("../tutorial/Final/fonts/Castron.otf", 30.0f, &font_config);
    regularFont = io.Fonts->AddFontFromFileTTF("../tutorial/Final/fonts/Castron.otf", 20.0f, &font_config);
    playFont = io.Fonts->AddFontFromFileTTF("../tutorial/Final/fonts/Castron.otf", 14.0f, &font_config);
}
void BasicScene::setStartPos() {

    int height = (screen_height - window_height)/2.0f  ;
    int width = (screen_width - window_width)/2.0f ;
    startPos = ImVec2(width,height);

}
void BasicScene::BuildImGui(){
    loadingMenu();
    startMenu();
    PausedMenu();
    NextLevelMenu();
    WinMenu();
    LoseMenu();
    StoreMenu();
    LeadersMenu();
    SettingsMenu();
    PlayMenu();
}
void BasicScene::init_objects() {
    AddChild(root = Movable::Create("root")); // a common (invisible) parent object for all the shapes
    level1 = ModelsFactory::getInstance()->CreateModel(DAYLIGHT_MATERIAL,CUBE,"background");
    AddChild(level1);
    level1->Scale(200, Axis::XYZ);
    level1->SetPickable(false);
    level1->SetStatic();
    level2 = ModelsFactory::getInstance()->CreateModel(LEVEL2_MAP,CUBE,"background");
    AddChild(level2);
    level2->Scale(400, Axis::XYZ);
    level2->SetPickable(false);
    level2->SetStatic();
    level3 = ModelsFactory::getInstance()->CreateModel(LEVEL3_MAP,CUBE,"background");
    AddChild(level3);
    level3->Scale(300, Axis::XYZ);
    level3->SetPickable(false);
    level3->SetStatic();
    currLevelMap = level1;

    auto program = std::make_shared<Program>("shaders/phongShader");
    material =  std::make_shared<Material>("material", program); // empty material
    material->AddTexture(0, "textures/box0.bmp", 2);
    snake = new Snake(material,root,camera);
    init_flags[0]= true;
    done++;

}
void BasicScene::init_helpers(){

    this->highScores = new HighScores();
    this->soundManager = SoundManager::getInstance();
    soundManager->stop_game_music();
    this->animate = false;
    init_flags[2]= true;
    done++;

}
Eigen::Vector3f BasicScene::GetSpherePos()
{
    Eigen::Vector3f l = Eigen::Vector3f(1.6f,0,0);
    Eigen::Vector3f res;
    return res;
}




void BasicScene::loadingMenu() {

    if(start_time == 0.0 ) {
        start_time = ImGui::GetTime();
    }
    if(statistics->menu_flags[LoadingMenu_OP]){
        animate = false;
        setWindow("Loading",backgroundSnakeTexture,ImVec4(1,1,1,1));
        ImGui::PushFont(regularFont);
        // Get the current time in seconds

        // Get the current time in seconds
        float current_time = ImGui::GetTime();

        // Calculate the progress as a value between 0 and 1
        float progress =  (done == 3) ? std::min((current_time - start_time) / 30.f, 1.0f) : start_time;


        // Call the callback function when progress reaches 100%
        if (progress < 1.0f) {
            ImGui::SameLine(20);
            ImGui::Text("%.2f%%", progress * 100.0f);
            // Display the progress bar
            ImGui::SameLine(ImGui::GetWindowWidth()/5);
            // Display the progress bar
            ImGui::ProgressBar(progress, ImVec2(-1, 0), "");
        }
        else{
            std::this_thread::sleep_for(std::chrono::seconds(1));
            statistics->menu_flags[LoadingMenu_OP] = false;
            statistics->menu_flags[MainMenu_OP] =true;
            soundManager->play_game_music();
//            soundManager->play_sound(std::string(THIRD_MUSIC));
        }
        for(int i= 0; i<100 ; i++){
            ImGui::Spacing();
        }
        ImGui::PopFont();
        endWindow();
    }
}
void BasicScene::startMenu() {

    if(statistics->menu_flags[MainMenu_OP]) {
        animate = false;
        setWindow("3D Snake",backgroundSnakeTexture,ImVec4(1,1,1,1));
        ImGui::PushFont(regularFont);
        buttonStyle();
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Start Game", ImVec2(200, 0))) {
            std::cout << "new game button pressed in start menu ." << endl;
            statistics->reset_game();
            statistics->menu_flags[MainMenu_OP] = false;
            soundManager->switch_game_music(std::string(FIRST_MUSIC));
            animate = true;
            statistics->objectCollisionStopper.start(20);
            statistics->selfCollisionStopper.start(20);

        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }

        static char* mass = "";
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Tutorial", ImVec2(200, 0))) {
            if( std::strlen(mass)== 0) {
                std::cout << "store button pressed in start menu  ." << endl;
                mass = getInstructions();
            }
            else{
                mass = "";
            }

        }
        ImGui::PopFont();
        ImGui::PushFont(messageFont);
        ImGui::Text( mass);
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::PopFont();
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::PushFont(regularFont);
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Store", ImVec2(200, 0))) {
            std::cout << "store button pressed in start menu  ." << endl;
            statistics->menu_flags[MainMenu_OP] = false;
            data->back_to_main.push_back(MainMenu_OP);
            statistics->menu_flags[StoreMenu_OP] = true;

        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 -100 );
        if (ImGui::Button("Leaders", ImVec2(200, 0))) {
            std::cout << "leaders button pressed in start menu  ." << endl;
            statistics->menu_flags[MainMenu_OP] = false;
            data->back_to_main.push_back(MainMenu_OP);
            statistics->menu_flags[LeadersMenu_OP] = true;
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Settings", ImVec2(200, 0))) {
                statistics->menu_flags[MainMenu_OP] = false;
                data->back_to_main.push_back(MainMenu_OP);
                statistics->menu_flags[SettingsMenu_OP] = true;

        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Exit", ImVec2(200, 0))) {
            delete soundManager;
            exit(0);
        }
        ImGui::PopStyleColor(3);
        for (int i = 0; i < 14; i++) {
            ImGui::Spacing();
        }
        if( std::strlen(mass)== 0 ) {
            for (int i = 0; i < 36; i++) {
                ImGui::Spacing();
            }
        }
        ImGui::PopFont();
        endWindow();

    }
}
void BasicScene::PausedMenu()
{
    if(statistics->menu_flags[PauseMenu_OP]) {
        animate = false;
        setWindow("Pause",backgroundSnakeTexture,ImVec4(1,1,1,1));
        ImGui::PushFont(regularFont);
        int frogs = data->frog_Scores[statistics->level];
        int mice = data->mouse_Scores[statistics->level];
        ImGui::Text("Level goal:\t%d frogs, and %d mice.",frogs,mice);
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("",mice);
        float progress = static_cast<float >(statistics->frogsNum + statistics->mousesNum);
        progress= progress/
                static_cast<float >(data->mouse_Scores[statistics->level] + data->frog_Scores[statistics->level]);
        ImGui::ProgressBar(progress, ImVec2(0.0f, 0.0f));
        ImGui::SameLine(0.0f, ImGui::GetStyle().ItemInnerSpacing.x);
        ImGui::Text("Progress Bar");
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }

        ImGui::Text("Total score: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", statistics->score);
        ImGui::Spacing();
        ImGui::Text("Life remain: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", data->life_bought);
        ImGui::Spacing();
        ImGui::Text("Level: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", statistics->level);
        ImGui::Text("Snake speed: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%f", std::round(statistics->speed));
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        buttonStyle();
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Continue", ImVec2(200, 0))) {
            std::cout << "continue button pressed in pause menu ." << endl;
            statistics->menu_flags[PauseMenu_OP] = false;
            animate = true;
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Store", ImVec2(200, 0))) {
            std::cout << "store menu button pressed in pause menu." << endl;
            statistics->menu_flags[PauseMenu_OP] = false;
            data->back_to_main.push_back(PauseMenu_OP);
            statistics->menu_flags[StoreMenu_OP] = true;
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Settings", ImVec2(200, 0))) {

            std::cout << "setting menu button pressed in pause menu." << endl;
            statistics->menu_flags[PauseMenu_OP] = false;
            data->back_to_main.push_back(PauseMenu_OP);
            statistics->menu_flags[SettingsMenu_OP] = true;


        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Surrender", ImVec2(200, 0))) {
            std::cout << "Surrender button pressed in pause menu." << endl;
            statistics->menu_flags[PauseMenu_OP] = false;
            soundManager->play_sound(std::to_string(BOO_SOUND));
            soundManager->play_sound(std::string(THIRD_MUSIC));
            data->back_to_main.clear();
            data->add_total_money(statistics->score/10);
            data->back_to_main.push_back(LoadingMenu_OP);
            statistics->restart =true;
        }
        ImGui::PopStyleColor(3);
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }

        ImGui::PopFont();
        endWindow();
    }
}
void BasicScene::SettingsMenu()
{
    if(statistics->menu_flags[SettingsMenu_OP]) {
        animate = false;
        ImVec4 black = ImVec4(0.0f, 0.0f, 0.0f, 1.0f); // set color to black
        ImGui::PushStyleColor(ImGuiCol_CheckMark, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_Button, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_Text, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_WindowBg, black); // set checkbox check color
        setWindow("Settings",backgroundSettingsTexture,black);
        ImGui::PushFont(regularFont);
        setBoxes();
        // Checkbox for sound on/off
        if ( data->gameMusic){
            if (ImGui::Checkbox("Music On", &data->gameMusic)) {
                data->gameMusic = false;
                soundManager->stop_game_music();
            }
        }
        else{
            if (ImGui::Checkbox("Music Off", &data->gameMusic)) {
                data->gameMusic = true;
                soundManager->play_game_music();
            }
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        if (data->gameSound){
            if (ImGui::Checkbox("Sound On", &data->gameSound)) {
                data->gameSound = false;
                soundManager->stop_all_game_sounds();
            }
        }
        else{
            if (ImGui::Checkbox("Sound Off", &data->gameSound)) {
                data->gameSound = true;
                soundManager->restart_game_sounds();
            }
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        // Slider for music volume control
        if(ImGui::SliderFloat("Music Volume", &data->musicVolume, 0.0f, 1.0f) ){
            std::cout<< "Music Volume value changed to : " << data->musicVolume <<endl;
            soundManager->set_game_play_music_volume(std::to_string(data->musicVolume));
        }
        // Slider for sound volume control
        if(ImGui::SliderFloat("Game Sounds Volume", &data->soundVolume, 0.0f, 1.0f) ){
            std::cout<< "Sounds Volume value changed to : " << data->musicVolume <<endl;
            soundManager->set_sounds_volume(std::to_string(data->soundVolume));
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }

        ImGui::PushStyleColor(ImGuiCol_PopupBg, ImVec4(0, 0.5, 0, 1));
        static const char* music_names[] = { "Song 1", "Song 2", "Song 3"};
        static int current_music_index = 0;
        if (ImGui::BeginCombo("Music", music_names[current_music_index])) {
            for (int i = 0; i < IM_ARRAYSIZE(music_names); i++) {
                bool is_selected = (current_music_index == i);
                if (ImGui::Selectable(music_names[i], is_selected)) {
                    current_music_index = i;
                    soundManager->change_game_music(current_music_index+1);
                }
                if (is_selected) {
                    ImGui::SetItemDefaultFocus();
                }
            }
            ImGui::EndCombo();
        }
        ImGui::PopStyleColor();
        buttonStyle();
        for(int i = 0; i< 10 ; i++){
            ImGui::Spacing();
        }

        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Fail sound", ImVec2(200, 0))) {
            std::cout << "Fail sound button pressed in win menu." << endl;
            soundManager->play_sound(std::to_string(FAIL_SOUND));
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Health sound", ImVec2(200, 0))) {
            std::cout << "Health sound button pressed in win menu." << endl;
            soundManager->play_sound(std::to_string(HEALTH_SOUND));
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Hit sound", ImVec2(200, 0))) {
            std::cout << "Hit sound button pressed in win menu." << endl;
            soundManager->play_sound(std::to_string(HIT_SOUND));
        }
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Progress sound", ImVec2(200, 0))) {
            std::cout << "Progress sound button pressed in win menu." << endl;
            soundManager->play_sound(std::to_string(PROGRESS_SOUND));
        }
        for(int i = 0; i< 5 ; i++){
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Back", ImVec2(200, 0))) {
            std::cout << "Back button pressed in win menu." << endl;
            if(data->back_to_main.size() == 0 ){
                statistics->menu_flags[SettingsMenu_OP] =false;
                animate = true;
            }
            else{
                statistics->menu_flags[SettingsMenu_OP] =false;
                int ret = data->back_to_main.back();
                data->back_to_main.pop_back();
                statistics->menu_flags[ret] =true;
            }
        }
        ImGui::PopStyleColor(7);
        ImGui::PopFont();
        endWindow();
    }
}
void BasicScene::NextLevelMenu() {

    if (statistics->menu_flags[LevelMenu_OP]) {
        animate = false;
        if(start_time == 0.0 ) {
            start_time = ImGui::GetTime();
        }
        ImVec4 black = ImVec4(0.0f, 0.0f, 0.0f, 1.0f); // set color to black
        ImGui::PushStyleColor(ImGuiCol_CheckMark, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_Button, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_Text, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_WindowBg, black); // set checkbox check color
        // Set the background color of the text to light gray
        ImGui::PushStyleColor(ImGuiCol_TextDisabled, ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
        ImVec4 backgroundColor = ImVec4(1.0f, 1.0f, 1.0f, 1.0f);


        setWindow("Level Up",backgroundLevelTexture,black);
        ImGui::PushFont(regularFont);
        ImGui::Text(" Next level: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d",(statistics->level) +1);
        ImGui::Spacing();
        ImGui::Text("Your total score until now is ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d",statistics->score);
        ImGui::Spacing();
        ImGui::Text("Number of frogs you ate until now ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d",statistics->frogsNum);
        ImGui::Spacing();
        ImGui::Text("Number of mice you ate until now: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d",statistics->mousesNum);
        ImGui::Spacing();
        int frogs = data->frog_Scores[statistics->level +1];
        int mice = data->mouse_Scores[statistics->level +1];
        ImGui::Text("Next goal:");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text(" Number of frogs: %d .",frogs);
        ImGui::Text("");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("Number of mice: %d",mice);
        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::PopStyleColor();
        buttonStyle();
        // Get the current time in seconds
        float current_time = ImGui::GetTime();
        // Calculate the progress as a value between 0 and 1
        float progress =  (done == 3) ? std::min((current_time - start_time) / 10.f, 1.0f) : start_time;

        if (progress < 1.0f) {
            // Display the progress as a percentage
            ImGui::SameLine(20);
            ImGui::Text("%.2f%%", progress * 100.0f);
            // Display the progress bar
            ImGui::SameLine(ImGui::GetWindowWidth()/5);
            ImGui::ProgressBar(progress, ImVec2(0, 0), "");
        }
        else{
            ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
            if (ImGui::Button("Next level", ImVec2(200, 0))) {
                std::cout << "Next level button pressed in next level menu." << endl;
                statistics->menu_flags[LevelMenu_OP] = false;
                statistics->level++;
                statistics->objectCollisionStopper.reset();
                statistics->selfCollisionStopper.reset();
                statistics->objectCollisionStopper.start(5);
                statistics->selfCollisionStopper.start(5);
                animate = true;
            }

            for(int i = 0; i< 3 ; i++){
                ImGui::Spacing();
            }
            ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
            if (ImGui::Button("Back to main", ImVec2(200, 0))) {
                std::cout << "Back button pressed in next level menu." << endl;
                soundManager->play_sound(std::to_string(BOO_SOUND));
                soundManager->play_sound(std::string(THIRD_MUSIC));
                data->back_to_main.clear();
                animate = false;
                data->add_total_money(statistics->score / 10);
                statistics->menu_flags[LevelMenu_OP] = false;
                data->back_to_main.push_back(LoadingMenu_OP);
                statistics->restart = true;
                statistics->reset_game();


            }
        }

        ImGui::PopStyleColor(7);
        ImGui::PopFont();
        for(int i = 0; i< 200 ; i++){
            ImGui::Spacing();
        }
        endWindow();
    }
}
void BasicScene::WinMenu() {

    if (statistics->menu_flags[WinMenu_OP]) {
        animate = false;
        if(start_time == 0.0 ) {
            start_time = ImGui::GetTime();
        }
        setWindow("You Won!",backgroundWinTexture,ImVec4(1,1,1,1));
        ImGui::PushFont(regularFont);
        ImGui::Text("Congratulations You finished the game!!");
        ImGui::Spacing();
        ImGui::Text("Your total score until now is ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", statistics->score);
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        buttonStyle();
        int pos = highScores->nextLeaderPos();
        if( pos == -1) {
            std::vector<int> scores = this->highScores->extractScores();
            for (int i = 0; i < scores.size(); i++) {
                if (statistics->score > scores[i]) {
                    pos = i;
                }
            }
        }
        static bool saved = false;
        static char* msg= "" ;
        if(pos != -1){
            ImGui::Text("Please type your name to save in\nleader board: ");
            static char name[256] = ""; // buffer to store the input string
            ImGui::InputText("Input", name,IM_ARRAYSIZE(name));
            ImGui::Spacing();
            ImGui::Spacing();
            ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
            if (!saved && ImGui::Button("Save", ImVec2(200, 0))) {
                Score *scor = new Score();
                scor->name = name;
                scor->score = statistics->score;
                highScores->saveToHighScores(scor, pos);
                data->set_message("your score was saved!");
                std::memset(name, 0, sizeof(name));
                saved = true;

            }
        }

        for (int i = 0; i < 20; i++) {
            ImGui::Spacing();
        }
        // Get the current time in seconds
        float current_time = ImGui::GetTime();

        // Calculate the progress as a value between 0 and 1
        float progress = std::min((current_time - start_time) / 30.f, 1.0f) ;


        if (progress < 1.0f) {
            // Display the progress as a percentage
            ImGui::SameLine(20);
            ImGui::Text("%.2f%%", progress * 100.0f);

            // Display the progress bar
            ImGui::SameLine(ImGui::GetWindowWidth()/5);
            ImGui::ProgressBar(progress, ImVec2(0, 0), "");
            // Call the callback function when progress reaches 100%
        }
        else{
            ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
            if (ImGui::Button("Back to main", ImVec2(200, 0))) {
                std::cout << "Back button pressed in win menu." << endl;
                data->back_to_main.clear();
                statistics->menu_flags[WinMenu_OP] =false;
                data->add_total_money(statistics->score/10);
                data->back_to_main.push_back(LoadingMenu_OP);
                soundManager->play_sound(std::string(THIRD_MUSIC));
                statistics->restart = true;

            }
        }

        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        ImGui::PopFont();
        ImGui::PushFont(messageFont);
        ImGui::Text("%s",msg);
        if(pos != -1) {
            for (int i = 0; i < 30; i++) {
                ImGui::Spacing();
            }
        }
        if(saved){
            for (int i = 0; i < 5; i++) {
                ImGui::Spacing();
            }
        }
        ImGui::PopFont();
        ImGui::PopStyleColor(3);
        endWindow();
    }
}
void BasicScene::LoseMenu() {

    if (statistics->menu_flags[GameOverMenu_OP]) {
        animate = false;

        if (start_time == 0.0) {
            start_time = ImGui::GetTime();
        }
        ImVec4 black = ImVec4(0.0f, 0.0f, 0.0f, 1.0f); // set color to black
        ImGui::PushStyleColor(ImGuiCol_CheckMark, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_Text, black); // set checkbox check color
        ImGui::PushStyleColor(ImGuiCol_WindowBg, black); // set checkbox check color
        buttonStyle();


        setWindow("Game Over!", backgroundLoseTexture,black);
        ImGui::PushFont(regularFont);
        ImGui::Text("You lost..\nMaybe you will succeed next time.");
        for (int i = 0; i < 8; i++) {
            ImGui::Spacing();
        }
        ImGui::Text("Your total score until now is ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", statistics->score);
        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }

        if (data->life_bought > 0) {
            ImGui::Text("You have extra %d life to use\nPress to continue the game: ", data->life_bought);
            for (int i = 0; i < 4; i++) {
                ImGui::Spacing();
            }
            ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
            if (ImGui::Button("Keep playing", ImVec2(200, 0))) {
                data->dec_life_bought();
                statistics->objectCollisionStopper.reset();
                statistics->selfCollisionStopper.reset();
                statistics->selfCollisionStopper.start(10);
                statistics->objectCollisionStopper.start(10);
                statistics->menu_flags[GameOverMenu_OP] = false;
                data->back_to_main.push_back(LoadingMenu_OP);
                animate = true;
            }

        }

        int pos = highScores->nextLeaderPos();
        if (pos == -1) {
            std::vector<int> scores = this->highScores->extractScores();
            for (int i = 0; i < scores.size(); i++) {
                if (statistics->score > scores[i]) {
                    pos = i;
                }
            }
        }
        static bool saved = false;
        static char* msg = "";
        if (pos != -1) {
            ImGui::Text("Please type your name to save in\nleader board: ");
            static char name[256] = ""; // buffer to store the input string
            ImGui::InputText("Input", name, IM_ARRAYSIZE(name));
            ImGui::Spacing();
            ImGui::Spacing();
            ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
            if (!saved && ImGui::Button("Save", ImVec2(200, 0))) {
                Score *scor = new Score();
                scor->name = name;
                scor->score = statistics->score;
                highScores->saveToHighScores(scor, pos);
                data->set_message("your score was saved!");
                std::memset(name, 0, sizeof(name));
                saved = true;
            }
        }
        for (int i = 0; i < 30; i++) {
            ImGui::Spacing();
        }
        // Get the current time in seconds
        float current_time = ImGui::GetTime();

        // Calculate the progress as a value between 0 and 1
        float progress = std::min((current_time - start_time) / 10.f, 1.0f) ;


        if (progress < 1.0f) {
            ImGui::Text("%.2f%%", progress * 100.0f);
            // Display the progress bar
            ImGui::SameLine(ImGui::GetWindowWidth() / 5);
            ImGui::ProgressBar(progress, ImVec2(0, 0), "");
        } else {
            ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
            if (ImGui::Button("Back to main", ImVec2(200, 0))) {
                std::cout << "Back button pressed in lose menu." << endl;
                data->back_to_main.clear();
                statistics->menu_flags[GameOverMenu_OP] = false;
                data->add_total_money(statistics->score / 10);
                statistics->reset_game();
                statistics->objectCollisionStopper.reset();
                statistics->selfCollisionStopper.reset();
                data->back_to_main.push_back(LoadingMenu_OP);
                soundManager->play_sound(std::string(THIRD_MUSIC));
                statistics->restart = true;

            }
        }

        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::PopFont();
        ImGui::PushFont(messageFont);
        ImVec2 cursor_pos = ImVec2(10,ImGui::GetWindowHeight() - 180.0);
        ImGui::SetCursorPos(cursor_pos);
        ImGui::Text("%s",msg);
        for (int i = 0; i < 15; i++) {
            ImGui::Spacing();
        }
        if(saved){
            for (int i = 0; i < 5; i++) {
                ImGui::Spacing();
            }
        }
        ImGui::PopFont();
        ImGui::PopStyleColor(6);
        endWindow();

    }
}
void BasicScene::StoreMenu() {

    static char * msg= "";
    if (statistics->menu_flags[StoreMenu_OP]) {
        animate = false;
        // Push a black color onto the style stack
        ImVec4 black = ImVec4(0.0f, 0.0f, 0.0f, 1.0f);
        ImGui::PushStyleColor(ImGuiCol_Text, black);
        setWindow("Store", backgroundStoreTexture,black);
        ImGui::PushFont(regularFont);
        ImGui::Text("You have total money of ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", data->total_money);
        ImGui::Spacing();
        ImGui::Text("Total score: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", statistics->score);
        ImGui::Spacing();
        ImGui::Text("Life remain: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", data->life_bought);
        ImGui::Spacing();
        ImGui::Text("Self invisibility: ");
        ImGui::SameLine(ImGui::GetWindowWidth()/2);
        ImGui::Text("%d",data->self_collision );
        ImGui::Text("Object invisibility: ");
        ImGui::SameLine( ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", data->object_collision);
        ImGui::Text("Double score: ");
        ImGui::SameLine( ImGui::GetWindowWidth()/2);
        ImGui::Text("%d", data->double_score);
        // Pop the style color to restore the previous style
        for (int i = 0; i < 15; i++) {
            ImGui::Spacing();
        }
        buttonStyle();
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 250);
        if (ImGui::Button("Buy extra life - 30 coins", ImVec2(500, 0))) {
            if (data->total_money >= LIFE_COST) {
                data->inc_life_bought();
                soundManager->play_sound(std::to_string(KACHING_SOUND));
                msg = "";
            } else {
                msg =("You have not enough money for that.\nPlay some games to gain more money.");
            }
        }

        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 250);
        if (ImGui::Button("Buy self collision invisibility - 10 coins", ImVec2(500, 0))) {
            if (data->total_money >= SELF_COLLIDE_COST) {
                data->inc_self_collision();
                soundManager->play_sound(std::to_string(KACHING_SOUND));
                msg = "";
            } else {
                msg =("You have not enough money for that.\nPlay some games to gain more money.");
            }
        }
        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 250);
        if (ImGui::Button("Buy obstacles collision invisibility - 20 coins", ImVec2(500, 0))) {
            if (data->total_money >= OBJECT_COLLIDE_COST) {
                data->inc_object_collision();
                soundManager->play_sound(std::to_string(KACHING_SOUND));
                msg = "";
            } else {
                msg =("You have not enough money for that.\nPlay some games to gain more money.");
            }
        }
        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 250);
        if (ImGui::Button("Buy double score in game- 60 coins", ImVec2(500, 0))) {
            if (data->total_money >= OBJECT_COLLIDE_COST) {
                data->inc_double_score();
                soundManager->play_sound(std::to_string(KACHING_SOUND));
                msg = "";
            } else {
                msg = ("You have not enough money for that.\nPlay some games to gain more money.");
            }
        }
        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Back", ImVec2(200, 0))) {
            std::cout << "Back button pressed in store menu." << endl;
            statistics->menu_flags[StoreMenu_OP] = false;
            if (data->back_to_main.size() == 0) {
                statistics->menu_flags[MainMenu_OP] = true;
            } else {
                statistics->menu_flags[data->back_to_main.back()] = true;
                data->back_to_main.pop_back();
            }
        }
        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::PopFont();
        ImGui::PushFont(messageFont);
        ImGui::Text("%s", msg);
        for (int i = 0; i < 3; i++) {
            ImGui::Spacing();
        }
        ImGui::PopFont();
        ImGui::PopStyleColor(4);
        endWindow();
    }
}
void BasicScene::LeadersMenu() {

    if (statistics->menu_flags[LeadersMenu_OP]) {
        animate = false;
        ImVec4 black = ImVec4(0.0f, 0.0f, 0.0f, 1.0f);
        ImGui::PushStyleColor(ImGuiCol_Text, black);
        setWindow("Leader Board",backgroundLeadersTexture,black);
        ImGui::PopStyleColor();
        ImGui::PushFont(regularFont);
        this->highScores->loadHighScores();
        std::vector<std::string> names = highScores->extractPlayerNames();
        std::vector<int> scores = highScores->extractScores();
        ImGui::PushFont(leadersFont);
        // Push a black color onto the style stack
        ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.5f, 0.0f, 1.0f));

        // Get the window width
        float windowWidth = ImGui::GetWindowContentRegionWidth();

        // Set the cursor position to the start of the window and display the first string

        if (names.size() == 0) {
            ImGui::BulletText("No Saved Scores!");
        } else {
            for (int i = 0; i <= names.size() - 1; i++) {
                ImGui::SetCursorPosX(0.0f);
                std::string name = names[i];
                int score = scores[i];

                // Calculate the width of the second string
                ImVec2 textSize2 = ImGui::CalcTextSize(std::to_string(score).c_str());
                float textWidth2 = textSize2.x;
                ImGui::Bullet();
                ImGui::SameLine();
                ImGui::Text("%s", name.c_str());

                // Calculate the position to display the second string
                float xPos = windowWidth / 2.0f - textWidth2 / 2.0f;

                ImGui::SameLine(xPos);
                ImGui::Text("%d", score);
            }
        }

        ImGui::PopStyleColor(1);
        ImGui::PopFont();
        for(int i = 0; i< 3 ; i++){
            ImGui::Spacing();
        }
        buttonStyle();
        ImGui::SameLine(ImGui::GetWindowWidth() / 2 - 100);
        if (ImGui::Button("Back", ImVec2(200, 0))) {
            std::cout << "Back button pressed in store menu." << endl;
            statistics->menu_flags[LeadersMenu_OP] = false;
            if(data->back_to_main.size() == 0){
                animate =true;
            }
            else{
                statistics->menu_flags[data->back_to_main.back()] = true;
                data->back_to_main.pop_back();
            }
        }
        ImGui::PopStyleColor(3);
        for(int i = 0; i< 60 ; i++){
            ImGui::Spacing();
        }
        ImGui::PopFont();
        endWindow();
    }
}
void BasicScene::PlayMenu()
{
    if(animate) {

        int flags = ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoMove | ImGuiWindowFlags_NoResize;
        bool* pOpen = nullptr;
        ImGui::Begin("Game Menu", pOpen, flags);
        ImGui::PushFont(playFont);
        ImGui::SetWindowPos(ImVec2(0, 0), ImGuiCond_Always);
        ImGui::SetWindowSize(ImVec2(screen_width, 150), ImGuiCond_Always);
        ImGui::Text("Camera: ");
        for (int i = 0; i < cameras.size(); i++) {
            ImGui::SameLine(0);
            bool selectedCamera = cameras[i] == camera;
            if (selectedCamera)
                ImGui::PushStyleColor(ImGuiCol_Button, ImGui::GetStyleColorVec4(ImGuiCol_ButtonActive));
            if (ImGui::Button( std::to_string(i + 1).c_str()))
                SetCamera(i);
            if (selectedCamera)
                ImGui::PopStyleColor();
        }

        ImGui::Spacing();
        ImGui::Text("Total score: ");
        ImGui::SameLine(0.0f, ImGui::GetStyle().ItemInnerSpacing.x);
        ImGui::Text("%d",statistics->score );
        ImGui::Spacing();
        ImGui::Text("Level: ");
        ImGui::SameLine(0.0f, ImGui::GetStyle().ItemInnerSpacing.x);
        ImGui::Text("%d", statistics->level);
        int frogs = data->frog_Scores[statistics->level];
        int mice = data->mouse_Scores[statistics->level];
        ImGui::Text("Level goal");
        ImGui::SameLine(100);
        ImGui::Text(" Frogs: %d / %d",statistics->frogsNum,frogs);
        ImGui::SameLine(200);
        ImGui::Text(" Mice: %d / %d",statistics->mousesNum,mice);
        ImGui::Spacing();
        if(ImGui::Button("Pause",ImVec2(100, 0))){
            animate = false;
            statistics->menu_flags[PauseMenu_OP] = true;
        }

        if(!statistics->double_score & (data->double_score >0)) {
            ImGui::SameLine(120);
            if (ImGui::Button("Double score", ImVec2(100, 0))) {
                data->dec_double_score();
                statistics->double_score = true;
            }
        }
        if((data->self_collision >0) && !statistics->selfCollisionStopper.is_countdown_running()) {
            ImGui::SameLine(230);
            if (ImGui::Button("Self invisible", ImVec2(100, 0))) {
                data->dec_self_collision();
                statistics->selfCollisionStopper.start(10);
            }
        }
        if((data->object_collision >0) && !statistics->objectCollisionStopper.is_countdown_running()) {
            ImGui::SameLine(340);
            if (ImGui::Button("Obj invisible", ImVec2(100, 0))) {
                data->dec_object_collision();
                statistics->objectCollisionStopper.start(10);
            }
        }
        ImGui::PopFont();
        ImGui::Spacing();
        ImGui::End();
    }
}


void BasicScene::buttonStyle() {
    // Set button color to dark green
    ImGui::PushStyleColor(ImGuiCol_Button, ImVec4(0.0f, 0.5f, 0.0f, 1.0f));
    ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.0f, 0.7f, 0.0f, 1.0f));
    ImGui::PushStyleColor(ImGuiCol_ButtonActive, ImVec4(0.0f, 0.3f, 0.0f, 1.0f));

}
void BasicScene::setBoxes() {
    ImGuiStyle& style = ImGui::GetStyle();
    style.Colors[ImGuiCol_CheckMark] = ImVec4(0.0f, 0.f, 0.0f, 1.0f);
    style.Colors[ImGuiCol_FrameBg] = ImVec4(0.0f, 0.5f, 0.0f, 1.0f);
}
void BasicScene::endWindow() {

    ImGui::PushFont(headerFont);
    // Render black text with a white outline
    ImGui::PushStyleColor(ImGuiCol_TextDisabled, ImVec4(1.0f, 1.0f, 1.0f, 1.0f)); // White outline color
    ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.0f, 0.0f, 1.0f)); // Black text color

    // Render text with a small offset to simulate an outline effect
    float outline_size = 1.0f; // Size of the outline in pixels
    ImGui::Dummy(ImVec2(outline_size, outline_size)); // Add a dummy element to offset the text
    ImGui::SameLine(); // Render the text on the same line as the dummy element
    ImVec2 cursor_pos = ImVec2(10,ImGui::GetWindowHeight() - 50.0);
    ImGui::SetCursorPos(cursor_pos);
    ImGui::BulletText("Snake Game By Yuval Hitter & Bar Damri. \n3D Animation Course\n");

    // Pop the style colors to restore the previous style
    ImGui::PopStyleColor(2);
    //ImGui::BulletText("Snake Game By Yuval Hitter & Bar Damri. \n3D Animation Course\n");
    ImGui::PopFont();
    ImGui::End();
    data->set_message("");
}
void BasicScene::setWindow(const char* header,GLuint texture, ImVec4 color) {
    ImGui::SetNextWindowPos(startPos);
    ImGui::SetNextWindowSize(windowSize);

    ImGui::SetNextWindowSizeConstraints(ImVec2(window_width, -1.0f), ImVec2(window_height, -1.0f));

    ImGui::Begin("Snake Game - 3D Animation Course", nullptr, windowFlags);
    // Draw the texture as a rectangle in the window
    ImVec2 image_size = ImVec2(image_width, image_height);
    ImVec2 window_pos = ImGui::GetWindowPos();
    ImVec2 image_pos = window_pos + ImGui::GetCursorPos();
    ImGui::GetWindowDrawList()->AddImage(
            (void*)(intptr_t)texture,
            image_pos,
            image_pos + image_size,
            ImVec2(0, 0),
            ImVec2(1, 1),
            ImColor(255, 255, 255, 255)
    );

    for(int i = 0; i< 3 ; i++){
        ImGui::Spacing();
    }
    ImGui::SetCursorPosX((ImGui::GetWindowSize().x - ImGui::CalcTextSize("Centered Text").x) / 2.0f);
    ImGui::PushStyleColor(ImGuiCol_WindowBg, color);
    ImGui::PushFont(headerFont);
    ImGui::Text("%s", header);
    ImGui::PopFont();
    ImGui::PopStyleColor();
    for (int i = 0; i < 3; ++i) {
        ImGui::Spacing();
    }
    ImGui::Separator();
    for (int i = 0; i < 3; ++i) {
        ImGui::Spacing();
    }

}


BasicScene::~BasicScene(){
    delete soundManager;
}


Score* BasicScene::generateRandomScore() {
    // Generate random score between 0 and 100
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> scoreDist(0, 10000);
    int score = scoreDist(gen);

    // Generate random player name
    std::uniform_int_distribution<> nameDist(0, 25);
    std::string playerName;
    for (int i = 0; i < 8; ++i) {
        playerName += static_cast<char>('a' + nameDist(gen));
    }
    Score * ret = new Score ();
    ret->name = playerName;
    ret->score = score;
    return ret;
}
SoundManager* BasicScene::getSoundManager() {
    return soundManager;
}
GameStatistics* BasicScene::getStatistics(){
    return this->statistics;
}
char* BasicScene::getInstructions(){

    return ("\tWelcome to the 3D snake game! \n"
            "\tPress the up,down,right,left keys to move with the snake\n"
            "\taround the map. Be aware of obstacles,\n"
            "\tmoving and standing.Eat as much animals and coins as you can.\n"
            "\tEach eat will gain you score points,\n"
            "\tand buying money for the store.\n"
            "\tFor each level, there is number of animals to eat to pass it.\n"
            "\t You can switch between cameras with the buttons or by the numbers 1-4\n"
            "\tIn the store you can buy game helpers\n"
            "\tsuch as extra life,double score, more speed etc.\n"
            "\tGood Luck!");
}
Data *BasicScene::getData() {
    return data;
}



void BasicScene::ViewportSizeCallback(Viewport* _viewport)
{
    for (auto& cam: cameras)
        cam->SetProjection(float(_viewport->width) / float(_viewport->height));

    // note: we don't need to call Scene::ViewportSizeCallback since we are setting the projection of all the cameras
}
void BasicScene::AddViewportCallback(Viewport* _viewport)
{
    viewport = _viewport;

    Scene::AddViewportCallback(viewport);
}
BasicScene::BasicScene(std::string name, Display* display) : SceneWithImGui(std::move(name), display)
{
    ImGui::GetIO().IniFilename = nullptr;
    ImGui::StyleColorsDark();
    ImGuiStyle& style = ImGui::GetStyle();
    style.FrameRounding = 5.0f;
}
void BasicScene::Update(const Program& program, const Eigen::Matrix4f& proj, const Eigen::Matrix4f& view, const Eigen::Matrix4f& model)
{
    Scene::Update(program, proj, view, model);
    char * green = "green";
    char* grey = "grey";
    char* gold = "gold";
    int resgreen = (program.name).compare(green);
    int resgrey = (program.name).compare(grey);
    int resgold = (program.name).compare(gold);
    if( resgreen == 0 ){
        program.SetUniform4f("lightColor", 0.8f, 0.9f, 0.6f, 1.0f);
        program.SetUniform4f("Kai", 0.2f, 0.4f, 0.1f, 1.0f);
        program.SetUniform4f("Kdi", 0.2f, 0.4f, 0.1f, 1.0f);
        program.SetUniform1f("specular_exponent", 10.0f);
        program.SetUniform4f("light_position", 0.0, 15.0f, 0.0, 1.0f);
    }
    else if(resgrey == 0){
        program.SetUniform4f("lightColor", 0.7f, 0.7f, 0.7f, 1.0f);
        program.SetUniform4f("Kai", 0.3f, 0.3f, 0.3f, 1.0f);
        program.SetUniform4f("Kdi", 0.3f, 0.3f, 0.3f, 1.0f);
        program.SetUniform1f("specular_exponent", 20.0f);
        program.SetUniform4f("light_position", 0.0, 15.0f, 0.0, 1.0f);
    }
    else if(resgold == 0){
        program.SetUniform4f("lightColor", 1.0f, 0.8f, 0.1f, 1.0f);
        program.SetUniform4f("Kai", 0.8f, 0.6f, 0.1f, 1.0f);
        program.SetUniform4f("Kdi", 0.8f, 0.6f, 0.1f, 1.0f );
        program.SetUniform1f("specular_exponent", 50.0f);
        program.SetUniform4f("light_position", 0.0, 15.0f, 0.0, 1.0f);
    }
    else{
        program.SetUniform4f("lightColor", 0.8f, 0.3f, 0.0f, 0.5f);
        program.SetUniform4f("Kai", 1.0f, 0.3f, 0.6f, 1.0f);
        program.SetUniform4f("Kdi", 0.5f, 0.5f, 0.0f, 1.0f);
        program.SetUniform1f("specular_exponent", 5.0f);
        program.SetUniform4f("light_position", 0.0, 15.0f, 0.0, 1.0f);
    }


}
void BasicScene::MouseCallback(Viewport* viewport, int x, int y, int button, int action, int mods, int buttonState[])
{
//    // note: there's a (small) chance the button state here precedes the mouse press/release event
//
//    if (action == GLFW_PRESS && animate) { // default mouse button press behavior
//        PickVisitor visitor;
//        visitor.Init();
//        renderer->RenderViewportAtPos(x, y, &visitor); // pick using fixed colors hack
//        auto modelAndDepth = visitor.PickAtPos(x, renderer->GetWindowHeight() - y);
//        renderer->RenderViewportAtPos(x, y); // draw again to avoid flickering
//        pickedModel = modelAndDepth.first ? std::dynamic_pointer_cast<Model>(modelAndDepth.first->shared_from_this()) : nullptr;
//        pickedModelDepth = modelAndDepth.second;
//        camera->GetRotation().transpose();
//        xAtPress = x;
//        yAtPress = y;
    // if (pickedModel)
    //     debug("found ", pickedModel->isPickable ? "pickable" : "non-pickable", " model at pos ", x, ", ", y, ": ",
    //           pickedModel->name, ", depth: ", pickedModelDepth);
    // else
    //     debug("found nothing at pos ", x, ", ", y);

//        if (pickedModel && !pickedModel->isPickable)
//            pickedModel = nullptr; // for non-pickable models we need only pickedModelDepth for mouse movement calculations later
//
//        if (pickedModel)
//            pickedToutAtPress = pickedModel->GetTout();
//        else
//            cameraToutAtPress = camera->GetTout();
//    }
}
void BasicScene::ScrollCallback(Viewport* viewport, int x, int y, int xoffset, int yoffset, bool dragging, int buttonState[])
{
    // note: there's a (small) chance the button state here precedes the mouse press/release event
    auto system = camera->GetRotation().transpose();
    if (pickedModel) {
        pickedModel->TranslateInSystem(system, {0, 0, -float(yoffset)});
        pickedToutAtPress = pickedModel->GetTout();
    } else {
        camera->TranslateInSystem(system, {0, 0, -float(yoffset)});
        cameraToutAtPress = camera->GetTout();
    }
}
void BasicScene::CursorPosCallback(Viewport* viewport, int x, int y, bool dragging, int* buttonState)
{
    if (dragging && animate) {
        auto system = camera->GetRotation().transpose() * GetRotation();
        auto moveCoeff = camera->CalcMoveCoeff(pickedModelDepth, viewport->width);
        auto angleCoeff = camera->CalcAngleCoeff(viewport->width);
        if (pickedModel) {
            //pickedModel->SetTout(pickedToutAtPress);
            if (buttonState[GLFW_MOUSE_BUTTON_RIGHT] != GLFW_RELEASE)
                pickedModel->TranslateInSystem(system, {-float(xAtPress - x) / moveCoeff, float(yAtPress - y) / moveCoeff, 0});
            if (buttonState[GLFW_MOUSE_BUTTON_MIDDLE] != GLFW_RELEASE)
                pickedModel->RotateInSystem(system, float(xAtPress - x) / angleCoeff, Axis::Z);
            if (buttonState[GLFW_MOUSE_BUTTON_LEFT] != GLFW_RELEASE) {
                pickedModel->RotateInSystem(system, float(xAtPress - x) / angleCoeff, Axis::Y);
                pickedModel->RotateInSystem(system, float(yAtPress - y) / angleCoeff, Axis::X);
            }
        } else {
            // camera->SetTout(cameraToutAtPress);
            if (buttonState[GLFW_MOUSE_BUTTON_RIGHT] != GLFW_RELEASE)
                root->TranslateInSystem(system, {-float(xAtPress - x) / moveCoeff/10.0f, float( yAtPress - y) / moveCoeff/10.0f, 0});
            if (buttonState[GLFW_MOUSE_BUTTON_MIDDLE] != GLFW_RELEASE)
                root->RotateInSystem(system, float(x - xAtPress) / 180.0f, Axis::Z);
            if (buttonState[GLFW_MOUSE_BUTTON_LEFT] != GLFW_RELEASE) {
                root->RotateInSystem(system, float(x - xAtPress) / angleCoeff, Axis::Y);
                root->RotateInSystem(system, float(y - yAtPress) / angleCoeff, Axis::X);
            }
        }
        xAtPress =  x;
        yAtPress =  y;
    }
}
void BasicScene::KeyCallback(Viewport* viewport, int x, int y, int key, int scancode, int action, int mods)
{
    auto system = camera->GetRotation().transpose();

    if (action == GLFW_PRESS || action == GLFW_REPEAT) {
        switch (key) // NOLINT(hicpp-multiway-paths-covered)
        {
            case GLFW_KEY_ESCAPE:
                glfwSetWindowShouldClose(window, GLFW_TRUE);
                break;
            case GLFW_KEY_UP:
                snake->MoveUp();
                break;
            case GLFW_KEY_DOWN:
                snake->MoveDone();
                break;
            case GLFW_KEY_LEFT:
                snake->MoveLeft();

                break;
            case GLFW_KEY_RIGHT:
                snake->MoveRight();
                break;
//            case GLFW_KEY_W:
//                camera->TranslateInSystem(system, {0, 0.1f, 0});
//                break;
            case GLFW_KEY_P:
                if(animate) {
                    animate = false;
                    statistics->menu_flags[PauseMenu_OP] = true;
                }
                else{
                    statistics->menu_flags[PauseMenu_OP] = false;
                    animate = true;
                }
                break;
//            case GLFW_KEY_S:
//                camera->TranslateInSystem(system, {0, -0.1f, 0});
//                break;
            case GLFW_KEY_R:
                animate = !animate;
                //snake->reset_sake();
                animate = true;
                break;
//            case GLFW_KEY_A:
//                camera->TranslateInSystem(system, {-0.1f, 0, 0});
//                break;
//            case GLFW_KEY_D:
//                camera->TranslateInSystem(system, {0.1f, 0, 0});
//                break;
            case GLFW_KEY_B:
                camera->TranslateInSystem(system, {0, 0, 0.1f});
                break;
            case GLFW_KEY_C:
                if(animate) {
                    statistics->inc_Score(1,1,1);
                }
                break;
            case GLFW_KEY_F:
                camera->TranslateInSystem(system, {0, 0, -0.1f});
                break;
            case GLFW_KEY_1:
                SetCamera(0);
                break;
            case GLFW_KEY_2:
                SetCamera(1);
                break;
            case GLFW_KEY_3:
                SetCamera(2);
                break;
            case GLFW_KEY_4:
                SetCamera(3);
                break;
        }
    }
    else if (action == GLFW_RELEASE)
    {
        switch (key)
        {
            case GLFW_KEY_W:
                wasd[0] = false;
                break;
            case GLFW_KEY_A:
                wasd[1] = false;
                break;
            case GLFW_KEY_S:
                wasd[2] = false;
                break;
            case GLFW_KEY_D:
                wasd[3] = false;
                break;
        }
    }

    if (animate)
    {
        if (wasd[0])
        {
            float angle_radians = 15 * M_PI / 180.0f;
            snake->bones[snake->bones.size() - 1]->Rotate(Eigen::Quaternionf(cos(angle_radians / 2.0), sin(angle_radians / 2.0), 0.0, 0.0).toRotationMatrix());
        }
        if (wasd[1])
        {
            float angle_radians = -15 * M_PI / 180.0f;
            snake->bones[snake->bones.size() - 1]->Rotate(Eigen::Quaternionf(cos(angle_radians / 2.0), 0.0, sin(angle_radians / 2.0), 0.0).toRotationMatrix());
        }
        if (wasd[2])
        {

            float angle_radians = -15 * M_PI / 180.0f;
            snake->bones[snake->bones.size() - 1]->Rotate(Eigen::Quaternionf(cos(angle_radians / 2.0), sin(angle_radians / 2.0), 0.0, 0.0).toRotationMatrix());
        }
        if (wasd[3])
        {
            float angle_radians = 15 * M_PI / 180.0f;
            snake->bones[snake->bones.size() - 1]->Rotate(Eigen::Quaternionf(cos(angle_radians / 2.0), 0.0, sin(angle_radians / 2.0), 0.0).toRotationMatrix());
        }
    }
}

