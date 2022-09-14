#include "flutter_window.h"

<<<<<<< HEAD
#include "flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(RunLoop* run_loop,
                             const flutter::DartProject& project)
    : run_loop_(run_loop), project_(project) {}

FlutterWindow::~FlutterWindow() {}

void FlutterWindow::OnCreate() {
  Win32Window::OnCreate();

  // The size here is arbitrary since SetChildContent will resize it.
  flutter_controller_ =
      std::make_unique<flutter::FlutterViewController>(100, 100, project_);
  RegisterPlugins(flutter_controller_.get());
  run_loop_->RegisterFlutterInstance(flutter_controller_.get());
  SetChildContent(flutter_controller_->view()->GetNativeWindow());
=======
#include <optional>

#include "flutter/generated_plugin_registrant.h"

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();

  // The size here must match the window dimensions to avoid unnecessary surface
  // creation / destruction in the startup path.
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  // Ensure that basic setup of the controller was successful.
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }
  RegisterPlugins(flutter_controller_->engine());
  SetChildContent(flutter_controller_->view()->GetNativeWindow());
  return true;
>>>>>>> 51fe6d4 (first commit)
}

void FlutterWindow::OnDestroy() {
  if (flutter_controller_) {
<<<<<<< HEAD
    run_loop_->UnregisterFlutterInstance(flutter_controller_.get());
=======
>>>>>>> 51fe6d4 (first commit)
    flutter_controller_ = nullptr;
  }

  Win32Window::OnDestroy();
}
<<<<<<< HEAD
=======

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam) noexcept {
  // Give Flutter, including plugins, an opportunity to handle window messages.
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
>>>>>>> 51fe6d4 (first commit)
