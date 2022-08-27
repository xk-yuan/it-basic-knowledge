# Process Monitor

## Introduction

Process Monitor

Copyright © 1996-2010 Mark Russinovich and Bryce Cogswell
Sysinternals - www.sysinternals.com
  
Process Monitor is an advanced monitoring tool for Windows that shows real-time file system, Registry and process/thread activity. It combines the features of two legacy Sysinternals utilities, Filemon and Regmon, and adds an extensive list of enhancements including rich and non-destructive filtering, comprehensive event properties such session IDs and user names, reliable process information, full thread stacks with integrated symbol support for each operation, simultaneous logging to a file, and much more. Its uniquely powerful features will make Process Monitor a core utility in your system troubleshooting and malware hunting toolkit. 

Process Monitor runs on Windows XP SP2, Windows Server 2003 SP1, and Windows Vista as well as x64 versions of Windows XP, Windows Server 2003 and Windows Vista.

## Using Process Monitor

Using Process Monitor

Executing Process Monitor requires local Administrative group membership. When you launch Process Monitor it immediately starts monitoring three classes of operation: file system, Registry and process.

- File System 

Process Monitor displays file system activity for all Windows file systems, including local storage and remote file systems. Process Monitor automatically detects the arrival of new file system devices and monitors them. All file system paths are displayed relative to the user session in which a file system operation executes. For example, if user A has mounted a share as drive letter Z:, any accesses they make to that share will display in Process Monitor as being relative to drive Z:. 

To remove file system operations from the display de-select the file system push-button in the Process Monitor toolbar and to add back file system operations depress the button.

- Registry 

Process Monitor logs all Registry operations and displays Registry paths using conventional abbreviations for Registry root keys (e.g. HKEY_LOCAL_MACHINE is represented as HKLM).

To remove Registry operations from the display de-select the Registry push-button in the Process Monitor toolbar and to add back Registry operations depress the button.

- Process

In its process/thread monitoring subsystem Process Monitor tracks all process and thread creation and exit operations as well as DLL and device driver load operations. 

To remove Process operations from the display de-select the process push-button in the Process Monitor toolbar and to add back process operations depress the button.

- Network

Process Monitor uses Event Tracing for Windows (ETW) to trace and record TCP and UDP activity. Each network operation includes the source and destination addresses, as well as the amount of data sent or received, but does not include the actual data. 

To remove Network operations from the display de-select the network push-button in the Process Monitor toolbar and to add back network operations depress the button.

- Profiling

This event class can be enabled from the Options menu. When active, Process Monitor scans all the active threads in the system and generates a profiling even for each one that records the kernel and user CPU time consumed, as well as the number of context switches executed, by the thread since its previous profiling event. Note: the System process is not included in profiling. 

There are a number of basic options that control basic Process Monitor operation:

Capture: Use the Capture Events menu item in the File menu, capture toolbar button or Ctrl+E hotkey to toggle Process Monitor's monitoring. 

Autoscroll: Select Autoscroll entry in the Edit menu, the autoscroll toolbar button or Ctrl+A hotkey to toggle Process Monitor's autoscroll behavior, which causes it to ensure that the most recent operation is visible in the display.

Clear: To clear the display of all items choose Clear Display from the Edit menu or use the Ctrl+X hotkey.


## Column Selection

Column Selection

You can drag columns to rearrange their order and customized the columns displayed by choosing Select Columns from the Options menu to open the column selection dialog. Columns that are available for selection include:

- Application Details

Process Name The name of the process in which an event occurred. 

Image Path The full path of the image running in a process.

Command Line The command line used to launch a process.

Company Name The text of the company name version string embedded in a process image file. This text is optionally defined by the application developer.

Description The text of the product description string embedded in a process image file. This text is optionally defined by the application developer.

Version The product version number embedded in a process image file. This information is optionally specified by the application developer.

- Event Details

Sequence Number The relative position of the operation with respect to all events included in the current filter.

Event Class The class (File, Registry, Process) of the event.

Operation The specific event operation (e.g. Read, RegQueryValue, etc.).

Date & Time Both the date and the time of an operation.

Time of Day Only the time of an operation.

Path The path of the resource that an event references.

Detail Additional information specific to an event.

Result The status code of a completed operation.

Relative Time The time of the operation relative to Process Monitor's start time or the last time that the Process Monitor display was cleared.

Duration The duration of an operation that has completed. 

- Process Management

User Name The name of the user account in which the process that performed an operation is executing. 

Session ID The Windows session in which the process that executed an operation is executing.

Authentication ID The logon session in which the process that executed an operation is executing.

Process ID The Process ID (PID) of the process that executed an operation.

Thread ID The Thread ID (TID) of the thread that executed an operation. 

Integrity Level The integrity level at which the process that executed an operation is running (Windows Vista only).

Virtualized The virtualization status of the process that executed an operation (Windows Vista only).


## Event Properties

Event Properties

You can access the properties for an individual event by double-clicking on the event, or by selecting the Properties menu item from the Event menu or the context menu when you right-click on an event. The Event Properties dialog consists of the Event, Process and Stack pages. You can move to the next or preceding displayed or highlighted event with the arrow buttons at the bottom of the Event Properties dialog. 

- Event

The Event page displays information specific to an event, including its sequence number, issuing thread, event class and operation, result, timestamp, and if applicable, resource path. Only file system and Registry events define resource paths. The lower area of the Event page lists details collected for an event that are dependent on the event operation. The details are the same as shown for an event in the Detail column of the main display, but each detail is shown on a separate line. 

- Process

An event's Process page shows information about the process that executed an event. Along with the data associated with a process' image, such as the path and version strings, the Process page shows process execution attributes like the process ID, user account in which the process is executing, and if the event was generated on a 64-bit Windows system, whether the process is 32-bit or 64-bit. For processes executing on Windows Vista systems, Process Monitor shows the integrity level of the process and whether or not it's virtualized.

The bottom area of the process page displays the list of images loaded, and the addresses at which they are loaded, in the process at the time the event executed. Double-click on an image in the list to view more information about the image, including its version information. 

- Stack

The Stack page shows the thread stack of the thread when the event was recorded. The stack can be useful for determining the reason an event took place and the component responsible for the event. Kernel-mode frames of a stack are designated with the letter 'K' on the left of the frame and user-mode stacks (user-mode stacks are not available on 64-bit systems prior to Vista SP1/Windows Server 2008) with the letter 'U'. If Process Monitor is able to locate symbols for images referenced in the trace it will attempt to resolve addresses to the functions in which they reside. Symbols resolution can take time if symbols must be retrieved from the network, for example from the Microsoft symbol server. Use the Symbol Configuration dialog, which you access from the Options menu, to configure symbols. 

If you specify a path to source files in the Symbol Configuration dialog, the Stack dialog's Source button will enable for any frame for which line-number symbols information is available and the source file is present in the paths you include. Clicking on the Source button opens a text viewer that highlights the source code line referenced.

To view more information about an image listed in the stack trace either double-click on the frame or select the frame and press the Properties button below the stack trace area. 

Select the Stack menu entry from the Event menu to open the Event Properties dialog directly to the Stack page. 


## Filtering and Highlighting

Filtering and Highlighting

Process Monitor offers several ways to configure filters or highlighting. 

- Include and Exclude Filters

You can specify event attributes such that Process Monitor will only display or exclude events with matching attribute values. All filters are non-destructive, meaning that they affect only which events Process Monitor displays, not the underlying event data.

When an event is selected the Include and Exclude sub-menus in the Event menu allows you to easily add one of the event's attributes to the configured Include or Exclude filters. For example, to only show events executed by a particular process name choose the Process Name entry from the Include submenu. You can also select multiple events and simultaneously configure an attribute filter for all of the unique values contained in the selected events.  Process Monitor ORs together all the filters that are related to a particular attribute type and ANDs together filters of different attribute types. For example, if you specified process name include filters for Notepad.exe and Cmd.exe and a path include filter for C:\Windows, Process Monitor would only display events originating in either Notepad.exe or Cmd.exe that specify the C:\Windows directory.

More complex filtering options are available in the Filter dialog, which you open by selecting Filter from the Filter menu or by clicking on the Filter toolbar button. A filter entry consists of an attribute field (e.g. Authentication ID, Process Name, etc.), a comparison operation, an attribute value, and a filter type of either Include or Exclude. For convenience, Process Monitor will automatically populate the attribute value drop-down with values that are present in the loaded trace data, but you can enter arbitrary values. Checkboxes allow you to easily disable specific filter entries without having to delete them. 

- Filter Context Menu

If you right-click on an item in the display Process Monitor displays a context menu that let's you view the item's properties or configure a filter based on the item's attributes. Further, quick-filter entries are added to the menu for the value of the column on which you click.

- Destructive Filtering

By default, Process Monitor filters apply to the data it displays, not what it saves. This allows you to change filters to obtain different views of data without affecting the excluded data. However, you can configure Process Monitor to delete any data that's excluded by a filter at the time the data is captured by toggling destructive filtering mode, which you do by choosing Drop Filtered Events from the Filter menu. 

- Include Process from Window

The toolbar includes a button shaped like a target that you can drag off and drop onto a window to cause Process Monitor to add the process ID of the process that owns the window to the Include filter.

- Basic vs. Advanced Mode

The Filter menu's Enable Advanced Output menu item controls whether Process Monitor is operating in Basic or Advanced Mode. When in Basic mode Process Monitor configures built-in filters to exclude system-related activity from the display and uses intuitive names for internal file system operations. For example, Process Monitor shows the internal IRP_MJ_READ operation as Read when in Basic mode. Basic mode makes output easier to read and omits events usually not relevant for application troubleshooting. 

- Saving and Loading Filters

Once you have configured a filter you can save it using the Save Filters menu item in the Filter menu. Process Monitor adds filters you save to the Load Filter menu for easy access and you can change the order in which the filters display in the menu using the Organize Filters dialog that you open with Organize Filters in the Filter menu.  You can use the Organize Filter dialog to rename saved filters as well as to easily export filters to a format that you can then reimport using the Organize Filter dialog on other systems. 

- Highlighting

Process Monitors highlighting filters enable you to specify event attributes that cause an event to be shown with a highlight color. The Highlight submenu in the Event menu provides quick access for defining highlight filter entries and the Highlight menu entry in the Filter menu opens the Highlight Filter dialog, which operates similarly to the Include/Exclude Filter dialog. You can convert highlight filters to include filters by selecting the Add Filter button on the Highlight Filter dialog. 

When a highlight is in effect, you can use the F4 key to select the next highlighted item in the displayed events. Select Shift+F4 to reverse the direction of the selection. 


## The Process Tree

The Process Tree

The Process Tree menu entry in the Tools menu opens the Process Tree dialog, which displays all of the processes referenced in the loaded trace in a hierarchy that reflects their parent-child relationships. Processes with the same parent are sorted according to their start time. Processes that are aligned along the left side of the window have parent processes that did not execute any event in the trace. 

When you select a process in the tree a subset of the data Process Monitor has obtained about the process, such as its image path, user account, and start time, shows in the bottom of the dialog. To view more information about a process you can click on the Go To Event button, which results in Process Monitor locating and selecting the first visible item in the trace executed by the process. Note that filters can prevent this operation from succeeding by excluding from the display all of the specified process' events. 


## Trace Summary Tools

Process Monitor includes a number of dialogs that allow you to perform simple data mining on the events collected in a trace. 

- System Details

Process Monitor captures some information about the system on which it collects a trace, including the machine name, the system root path, and whether the OS is 32-bit or 64-bit. You can access this information, which Process Monitor stores in log files, from the System Details dialog in the Tools menu. 

- Count Occurrences

Open the Count Occurrences dialog from the Tools menu. It displays the unique values seen in a trace for the attribute type you specify along with the number of times in the trace an event contained the value.

- Process Summary

This dialog summarizes the processes seen in the trace, including their process ID, image name, and command line. 

- File Summary

The File Summary dialog lists each unique file system path present in the filtered trace, the amount of time spent performing I/O to the file, total number of events that referenced the path, and the count of individual operation types.

- Registry Summary

The Registry Summary dialog lists each unique Registry path present in the filtered trace, the amount of time spent performing I/O to the Registry path, total number of events that referenced the path, and the count of individual operation types.

- Network Summary

The Network Summary dialog lists each unique destination IP address present in the filtered trace and the number different types of events, including sends and receives, to each address.

- Stack Summary

 Use the Stack Summary dialog to see individual instances of stack traces for each process, including the number of times the stack trace occurs and the total time spent in events that share the same trace.

Cross Reference Summary
This dialog shows the paths that are written by one process and read by another one.
