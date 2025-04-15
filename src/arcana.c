#include <stdio.h>
#include "vulkan/vulkan.h"

int main()
{
    printf("Hello, Vulkan!\n");

    // Create the application info.
    VkApplicationInfo appInfo = {0};
    appInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    appInfo.pNext = NULL; // No next structure
    appInfo.pApplicationName = "Arcana"; // Application name
    appInfo.applicationVersion = VK_MAKE_VERSION(1, 0, 0); // Application version
    appInfo.pEngineName = "Arcana"; // Engine name
    appInfo.engineVersion = VK_MAKE_VERSION(1, 0, 0); // Engine version
    appInfo.apiVersion = VK_API_VERSION_1_3; // Vulkan API version

    // Initialize Vulkan
    VkInstanceCreateInfo createInfo = {0};
    createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    createInfo.pApplicationInfo = &appInfo;
    createInfo.enabledLayerCount = 0; // No layers for now
    createInfo.ppEnabledLayerNames = NULL; // No layers for now
    createInfo.enabledExtensionCount = 0; // No extensions for now
    createInfo.ppEnabledExtensionNames = NULL; // No extensions for now
    createInfo.flags = 0;
    createInfo.pNext = NULL; // No next structure

    // Create the Vulkan instance
    VkInstance instance;
    VkResult result = vkCreateInstance(&createInfo, NULL, &instance);

    if (result != VK_SUCCESS) {
        fprintf(stderr, "Failed to create Vulkan instance: %d\n", result);
        return -1;
    } else {
        printf("Vulkan instance created successfully!\n");
    }

    return 0;
}