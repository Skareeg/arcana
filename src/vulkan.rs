use ash::prelude::*;
use bevy::{prelude::*, ecs::system::Resource};
use winit::{
    event::{Event, WindowEvent},
    event_loop::{ControlFlow, EventLoop},
    window::WindowBuilder,
};

pub struct VulkanPlugin {
    pub width: u32,
    pub height: u32,
    pub title: String,
}

impl Default for VulkanPlugin {
    fn default() -> Self {
        VulkanPlugin { width: 640, height: 480, title: "Vulkan".to_owned() }
    }
}

impl Plugin for VulkanPlugin {
    fn build(&self, app: &mut App) {
        let event_loop = EventLoop::new();
        let window = WindowBuilder::new()
            .with_title(self.title.clone().as_str())
            .with_inner_size(winit::dpi::LogicalSize::new(
                f64::from(self.width),
                f64::from(self.height),
            ))
            .build(&event_loop).unwrap();
        app.insert_non_send_resource(event_loop);
        app.insert_non_send_resource(window);
        app.add_startup_system(init_vulkan_plugin);
    }
}

pub fn init_vulkan_plugin(mut commands: Commands) {
    println!("Hi there.");
}