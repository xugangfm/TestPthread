//
//  main.cpp
//  TestJsoncpp
//
//  Created by xugang on 8/12/14.
//  Copyright (c) 2014 RongCloud. All rights reserved.
//

#include <iostream>
#include "jsoncpp/json/json.h"

void writeJson() {
    using namespace std;
    
    Json::Value root;
    Json::Value arrayObj;
    Json::Value item;
    
    item["cpp"] = "jsoncpp";
    item["java"] = "jsoninjava";
    item["php"] = "support";
    arrayObj.append(item);
    
    root["name"] = "json";
    root["array"] = arrayObj;
    
    root.toStyledString();
    std::string out = root.toStyledString();
    std::cout << out << std::endl;
}

int main(int argc, const char * argv[])
{

    // insert code here...
    std::cout << "Hello, World!\n";
    
    
    
    
    return 0;
}

