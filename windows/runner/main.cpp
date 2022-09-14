#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include "flutter_window.h"
<<<<<<< HEAD
#include "run_loop.h"
#include "utils.h"
#include "window_configuration.h"
=======
#include "utils.h"
>>>>>>> 51fe6d4 (first commit)

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  // Attach to console when present (e.g., 'flutter run') or create a
  // new console when running with a debugger.
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  // Initialize COM, so that it is available for use in the library and/or
  // plugins.
  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

<<<<<<< HEAD
  RunLoop run_loop;

  flutter::DartProject project(L"data");
  FlutterWindow window(&run_loop, project);
  Win32Window::Point origin(kFlutterWindowOriginX, kFlutterWindowOriginY);
  Win32Window::Size size(kFlutterWindowWidth, kFlutterWindowHeight);
  if (!window.CreateAndShow(kFlutterWindowTitle, origin, size)) {
=======
  flutter::DartProject project(L"data");

  std::vector<std::string> command_line_arguments =
      GetCommandLineArguments();

  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.CreateAndShow(L"quotes_app", origin, size)) {
>>>>>>> 51fe6d4 (first commit)
    return EXIT_FAILURE;
  }
  window.SetQuitOnClose(true);

<<<<<<< HEAD
  run_loop.Run();
=======
  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }
>>>>>>> 51fe6d4 (first commit)

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
