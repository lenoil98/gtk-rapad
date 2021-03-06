

'
'   radio_example.bas
'
'   functional radio buttons, however they are still kind of clumsy.
'

#include once "gtkrapad/gtkrapad.bi"

using GtkRapad

'Global object variables
dim shared GtkApp as TGtkApplication
dim shared frmMain as TGtkWindow
dim shared rb1 as TGtkRadioButton
dim shared rb2 as TGtkRadioButton
dim shared rb3 as TGtkRadioButton

dim shared hPanel as TGtkVBox 'TGtkHBox

'Prototyping each function of our application
declare sub Main()

declare sub RadioSwitchEvent cdecl ( byval __ as any pointer )

'------------+------------+------------+------------+------------+----------'
'   End the General Declarations ( if you speak Visual Basic )
'------------+------------+------------+------------+------------+----------'

sub Main()

    'Main function which will setup
    'the GUI and some system call backs. w00t.

    with frmMain
        .Title = "TGtkRadioButton Example"
        .KeepAbove = false
        .SetSize( 300, 50 )
    end with

    with hPanel
        .SetParent( frmMain )
    end with

    rb1.Label = "rbutton_1"
    rb2.Label = "rbutton_2"
    rb3.Label = "rbutton_3"

    rb1.SetEvent( TOGGLED, @RadioSwitchEvent() )
    rb2.SetEvent( TOGGLED, @RadioSwitchEvent() )
    rb3.SetEvent( TOGGLED, @RadioSwitchEvent() )

    'rb1.Group()
    rb2.Group = rb1.group
    rb3.Group = rb1.group

    rb1.SetParent( hPanel )
    rb2.SetParent( hPanel )
    rb3.SetParent( hPanel )

    frmMain.ShowAll()

    'the start line must be the last line when starting the application.
    'any gui framework be setup by now, cause after the gtk library has
    'focus, no other lines of code will get called unless by callback.

    gtkApp.Start( frmMain )
end sub


sub RadioSwitchEvent cdecl ( byval __ as any pointer )

    'one function to rule them all!

    'this function is called by each button in our group when the
    'status of any button is changed.  if we have 5 buttons in the
    'group this function is called for each regardless of their
    'status.

    dim btn as TGtkRadioButton

    btn.Associate( __ )

    if btn.active then
        print "You selected " & btn.label
    end if

end sub

'------------+------------+------------+------------+------------+----------'
'   Invoke the Main() function
'------------+------------+------------+------------+------------+----------'

Main()
