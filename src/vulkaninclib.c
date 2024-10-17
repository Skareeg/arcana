#include <vulkan/vulkan.h>

struct VulkanApp
{
    VkInstance instance;
};

int main(int argc, char* argv[])
{
    VkApplicationInfo info;
    info.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    info.pApplicationName = "Hello Triangle";
    info.applicationVersion = VK_MAKE_API_VERSION(0, 1, 3, 280);
    info.pEngineName = "No Engine";
    info.engineVersion = VK_MAKE_API_VERSION(0, 1, 3, 280);
    info.apiVersion = VK_MAKE_API_VERSION(0, 1, 3, 280);
}