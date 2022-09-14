<<<<<<< HEAD
#ifndef FLUTTER_WINDOW_H_
#define FLUTTER_WINDOW_H_
=======
#ifndef RUNNER_FLUTTER_WINDOW_H_
#define RUNNER_FLUTTER_WINDOW_H_
>>>>>>> 51fe6d4 (first commit)

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>

<<<<<<< HEAD
#include "run_loop.h"
#include "win32_window.h"

#include <memory>

// A window that does nothing but host a Flutter view.
class FlutterWindow : public Win32Window {
 public:
  // Creates a new FlutterWindow driven by the |run_loop|, hosting a
  // Flutter view running |project|.
  explicit FlutterWindow(RunLoop* run_loop,
                         const flutter::DartProject& project);
=======
#include <memory>

#include "win32_window.h"

// A window that does nothing but host a Flutter view.
class FlutterWindow : public Win32Window {
 public:
  // Creates a new FlutterWindow hosting a Flutter view running |project|.
  explicit FlutterWindow(const flutter::DartProject& project);
>>>>>>> 51fe6d4 (first commit)
  virtual ~FlutterWindow();

 protected:
  // Win32Window:
<<<<<<< HEAD
  void OnCreate() override;
  void OnDestroy() override;

 private:
  // The run loop driving events for this window.
  RunLoop* run_loop_;

=======
  bool OnCreate() override;
  void OnDestroy() override;
  LRESULT MessageHandler(HWND window, UINT const message, WPARAM const wparam,
                         LPARAM const lparam) noexcept override;

 private:
>>>>>>> 51fe6d4 (first commit)
  // The project to run.
  flutter::DartProject project_;

  // The Flutter instance hosted by this window.
  std::unique_ptr<flutter::FlutterViewController> flutter_controller_;
};

<<<<<<< HEAD
#endif  // FLUTTER_WINDOW_H_
=======
#endif  // RUNNER_FLUTTER_WINDOW_H_
>>>>>>> 51fe6d4 (first commit)
