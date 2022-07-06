use bevy::{app::ScheduleRunnerSettings, prelude::*, utils::Duration};

pub mod vulkan;

fn main() {
    // this app loops forever at 60 fps
    App::new()
        // .insert_resource(ScheduleRunnerSettings::run_loop(Duration::from_secs_f64(
        //     1.0 / 60.0,
        // )))
        // .add_plugins(MinimalPlugins)
        // .add_plugin(bevy::window::WindowPlugin::default())
        .add_plugin(vulkan::VulkanPlugin {
            title: "Arcana".to_owned(),
            ..Default::default()
        })
        .add_system(counter)
        .set_runner(event_runner)
        .run();
}

fn counter(mut state: Local<CounterState>) {
    if state.count % 60 == 0 {
        println!("{}", state.count);
    }
    state.count += 1;
}

#[derive(Default)]
struct CounterState {
    count: u32,
}

use winit::{event_loop::ControlFlow, event::{Event, DeviceEvent, WindowEvent, VirtualKeyCode, KeyboardInput, ModifiersState, ElementState}};

fn event_runner(mut app: App) {
    let mut events = app.world.remove_non_send_resource::<winit::event_loop::EventLoop<()>>().expect("This runner requires a winit EventLoop resource.");
    let window = app.world.remove_non_send_resource::<winit::window::Window>().expect("This runner requires a winit Window resource.");

    let mut modifiers = ModifiersState::default();

    events.run(move |event, _, control_flow| {
        *control_flow = ControlFlow::Wait;

        match event {
            Event::WindowEvent { window_id, event } if window_id == window.id() => match event {
                WindowEvent::CloseRequested => *control_flow = ControlFlow::Exit,
                WindowEvent::KeyboardInput {
                    device_id,
                    input: KeyboardInput {
                        scancode,
                        state: ElementState::Released,
                        virtual_keycode: Some(key),
                        ..
                    },
                    is_synthetic,
                } => {
                    let result = match key {
                        VirtualKeyCode::Escape => {
                            *control_flow = ControlFlow::Exit;
                            Ok(())
                        },
                        VirtualKeyCode::F => window.set_cursor_grab(true),
                        VirtualKeyCode::A => window.set_cursor_grab(false),
                        VirtualKeyCode::H => {
                            window.set_cursor_visible(modifiers.shift());
                            Ok(())
                        }
                        _ => Ok(()),
                    };

                    if let Err(err) = result {
                        print!("error: {}", err);
                    }
                },
                WindowEvent::ModifiersChanged(m) => modifiers = m,
                _ => (),
            },
            Event::DeviceEvent { event, .. } => match event {
                DeviceEvent::MouseMotion { delta } => println!("mouse moved: {:?}", delta),
                DeviceEvent::Button { button, state } => match state {
                    ElementState::Pressed => println!("mouse button {} pressed", button),
                    ElementState::Released => println!("mouse button {} released", button),
                },
                _ => (),
            },
            Event::MainEventsCleared => {
                window.request_redraw();
            },
            _ => (),
        }
    });
}