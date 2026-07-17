require 'mkmf'

# To build against Tcl 8.5 on OS X Intel:
# RC_ARCHS=i386 ruby extconf.rb --with-tcl-dir=/path/to/tcl8.5

dir_config('tcl')

unless pkg_config('tcl')

  # 3. Fallback: OS-Specific manual search
  # Determine if we are compiling on Windows
  is_windows = RUBY_PLATFORM.match?(/mingw|mswin/)

  # Define the library names based on the OS convention
  lib_names = if is_windows
                %w[tcl86 tcl85 tcl] # MSYS2 usually drops the dot
              else
                %w[tcl8.6 tcl8.5 tcl] # Unix usually keeps the dot
              end

  # Check for the header file
  unless have_header('tcl.h') || find_header('tcl.h',
                                             '/usr/include/tcl8.6',
                                             '/usr/include/tcl8.5',
                                             '/usr/local/include/tcl8.6',
                                             '/usr/local/include/tcl8.5',
                                             '/opt/homebrew/include',
                                             '/opt/homebrew/opt/tcl-tk/include')
    abort "\n*** ERROR: Cannot find tcl.h. Please install Tcl development headers or use --with-tcl-include ***\n"
  end

  # Try to link against the libraries, one by one.
  # We test for 'Tcl_Init' because it's a core Tcl C function.
  found_lib = lib_names.any? do |lib|
    have_library(lib, 'Tcl_Init')
  end

  unless found_lib
    abort "\n*** ERROR: Cannot find the Tcl library. Please install Tcl or use --with-tcl-lib ***\n"
  end
end
create_makefile('tcl_ext')

