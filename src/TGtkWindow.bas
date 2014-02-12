
#include once "gtkrapad/gtkrapad.bi"

namespace GtkRapad

    COMMON_FUNCS(TGtkWindow)

    constructor TGtkWindow
        id_ = gtk_window_new( GTK_WINDOW_TOPLEVEL )

        gtk_window_set_title( GTK_WINDOW( id_ ), "window" )
        gtk_window_set_destroy_with_parent( GTK_WINDOW( id_ ), true)

        gtk_window_resize( GTK_WINDOW( id_ ), 320, 240 )

        connect( "destroy", cast(GtkGenericCallback,@gtk_widget_destroy), id_ )

        init()
    end constructor

    operator TGtkWindow.cast() as GtkWidget Pointer
        return id_
    end operator

    sub TGtkWindow.Move( byval x_ as integer, byval y_ as integer )
        posx_ = x_
        posy_ = y_

        gtk_window_move( GTK_WINDOW( id_ ), posx_, posy_ )
    end sub

    sub TGtkWindow.SetFocus( byval wid as GtkWidget Pointer )
        gtk_window_set_focus( GTK_WINDOW( id_ ), wid )
    end sub

    function TGtkWindow.ActivateFocus() as gboolean
        return gtk_window_activate_focus( GTK_WINDOW( id_ ) )
    end function

    sub TGtkWindow.SetPosition( byref position as GtkWindowPosition )
        gtk_window_set_position( GTK_WINDOW( id_ ), position )
    end sub

    sub TGtkWindow.SetResizable( byval b as gboolean )
        resizable_ = b
        gtk_window_set_resizable( GTK_WINDOW( id_ ), resizable_ )
    end sub

    sub TGtkWindow.SetMinimized( byval b as gboolean )
        minimized_ = b
        if (minimized_ = false) then
            gtk_window_deiconify( GTK_WINDOW( id_ ) )
        else
            gtk_window_iconify( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetSticky( byval b as gboolean )
        sticky_ = b
        if (sticky_ = false) then
            gtk_window_unstick( GTK_WINDOW( id_ ) )
        else
            gtk_window_stick( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetMaximized( byval b as gboolean )
        maximize_ = b
        if (maximize_ = false) then
            gtk_window_unmaximize( GTK_WINDOW( id_ ) )
        else
            gtk_window_maximize( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetFullScreen( byval b as gboolean )
        fullscreen_ = b
        if (fullscreen_ = false) then
            gtk_window_unfullscreen( GTK_WINDOW( id_ ) )
        else
            gtk_window_fullscreen( GTK_WINDOW( id_ ) )
        end if
    end sub

    sub TGtkWindow.SetKeepAbove( byval b as gboolean )
        keepabove_ = b
        gtk_window_set_keep_above( GTK_WINDOW( id_ ), keepabove_ )
    end sub

    function TGtkWindow.GetResizable() as gboolean
        return resizable_
    end function

    function TGtkWindow.GetMinimized() as gboolean
        return minimized_
    end function

    function TGtkWindow.GetSticky() as gboolean
        return sticky_
    end function

    function TGtkWindow.GetMaximized() as gboolean
        return maximize_
    end function

    function TGtkWindow.GetFullScreen() as gboolean
        return fullscreen_
    end function

    function TGtkWindow.GetKeepAbove() as gboolean
        return keepabove_
    end function

    sub TGtkWindow.SetDestroyCallback( byval aMethod as gtkGenericCallback )
        connect( "destroy", aMethod, id_ )
    end sub

    sub TGtkWindow.SetTitle( byref newTitle as string )
        title_ = newTitle
        gtk_window_set_title( GTK_WINDOW( id_ ), title_ )
    end sub

    function TGtkWindow.GetTitle() as string
        return title_
    end function

    sub TGtkWindow.SetSize( byval width_ as integer, byval height_ as integer )
        'gtk_window_set_default_size( GTK_WINDOW( id_ ), width_, height_ )
        gtk_window_resize( GTK_WINDOW( id_ ), width_, height_ )
    end sub

end namespace
