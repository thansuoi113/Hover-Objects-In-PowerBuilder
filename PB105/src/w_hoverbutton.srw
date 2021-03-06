$PBExportHeader$w_hoverbutton.srw
forward
global type w_hoverbutton from window
end type
type p_2 from picture within w_hoverbutton
end type
type st_1 from statictext within w_hoverbutton
end type
type p_1 from picture within w_hoverbutton
end type
type trackmouseevent from structure within w_hoverbutton
end type
end forward

type trackmouseevent from structure
	unsignedlong		cbSize
		unsignedlong		dwFlags
		unsignedlong		hwndTrack
		unsignedlong		dwHoverTime
end type

global type w_hoverbutton from window
integer width = 1294
integer height = 1120
boolean titlebar = true
string title = "Hover Objects"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_2 p_2
st_1 st_1
p_1 p_1
end type
global w_hoverbutton w_hoverbutton

type prototypes
Function Boolean TrackMouseEvent(ref trackmouseevent lpEventTrack) Library "USER32.DLL"
Function Boolean _TrackMouseEvent(ref trackmouseevent lpEventTrack) Library "COMCTL32.DLL"
end prototypes

type variables
/*
	 * Window Messages
*/
Constant ULong WM_MOUSEHOVER                   = 673 //0x02A1
Constant ULong WM_MOUSELEAVE                   = 675 //0x02A3

/*
	 * Hover Flagss
*/
Constant ULong TME_HOVER       = 1 // 0x00000001
Constant ULong TME_LEAVE       = 2 // 0x00000002
Constant ULong TME_NONCLIENT   = 16 // 0x00000010
Constant ULong TME_QUERY       = 1073741824 // 0x40000000
Constant ULong TME_CANCEL      = 2147483648 // 0x80000000
Constant ULong HOVER_DEFAULT   = 4294967295 // 0xFFFFFFFF


Boolean	ib_mouseover = False

end variables

on w_hoverbutton.create
this.p_2=create p_2
this.st_1=create st_1
this.p_1=create p_1
this.Control[]={this.p_2,&
this.st_1,&
this.p_1}
end on

on w_hoverbutton.destroy
destroy(this.p_2)
destroy(this.st_1)
destroy(this.p_1)
end on

type p_2 from picture within w_hoverbutton
event mousemove pbm_mousemove
event mousehover ( )
event mouseleave ( )
integer x = 805
integer y = 224
integer width = 256
integer height = 192
string picturename = "EditDataGrid!"
boolean focusrectangle = false
end type

event mousemove;trackmouseevent lpEventTrack

If Not ib_mouseover Then
	ib_mouseover = True
	
	lpEventTrack.cbSize = 16 //structure is 4 ulongs which is 16 bytes
	lpEventTrack.dwFlags = TME_HOVER + TME_LEAVE
	lpEventTrack.hwndTrack = Handle (This)
	lpEventTrack.dwHoverTime = 100
	//hover time-out (if TME_HOVER was specified in dwFlags), in milliseconds
	
	//if this does not work, try swaping this call with the emulated one below
	//	TrackMouseEvent(lpEventTrack)
	_TrackMouseEvent(lpEventTrack)
End If

end event

event mousehover();This.Border = True
This.BorderStyle = StyleRaised!
This.PictureName = "SelectAll!"

end event

event mouseleave();This.Border = False
This.PictureName = "EditDataGrid!"


end event

event other;Choose Case Message.Number
	Case WM_MOUSEHOVER
		This.TriggerEvent("mousehover")
	Case WM_MOUSELEAVE
		ib_mouseover = False
		This.TriggerEvent("mouseleave")
End Choose

end event

type st_1 from statictext within w_hoverbutton
event mousemove pbm_mousemove
event mousehover ( )
event mouseleave ( )
integer x = 329
integer y = 672
integer width = 658
integer height = 128
integer textsize = -15
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "text example"
boolean focusrectangle = false
end type

event mousemove;trackmouseevent lpEventTrack

If Not ib_mouseover Then
	ib_mouseover = True
	
	lpEventTrack.cbSize = 16 //structure is 4 ulongs which is 16 bytes
	lpEventTrack.dwFlags = TME_HOVER + TME_LEAVE
	lpEventTrack.hwndTrack = Handle (This)
	lpEventTrack.dwHoverTime = 100
	//hover time-out (if TME_HOVER was specified in dwFlags), in milliseconds
	
	//if this does not work, try swaping this call with the emulated one below
	//	TrackMouseEvent(lpEventTrack)
	_TrackMouseEvent(lpEventTrack)
End If

end event

event mousehover();This.Border = True
This.BorderStyle = StyleRaised!

end event

event mouseleave();This.Border = False


end event

event other;Choose Case Message.Number
	Case WM_MOUSEHOVER
		This.TriggerEvent("mousehover")
	Case WM_MOUSELEAVE
		ib_mouseover = False
		This.TriggerEvent("mouseleave")
End Choose

end event

type p_1 from picture within w_hoverbutton
event mousemove pbm_mousemove
event mousehover ( )
event mouseleave ( )
integer x = 146
integer y = 224
integer width = 256
integer height = 192
string picturename = "FormatDollar!"
boolean focusrectangle = false
end type

event mousemove;trackmouseevent lpEventTrack

If Not ib_mouseover Then
	ib_mouseover = True
	
	lpEventTrack.cbSize = 16 //structure is 4 ulongs which is 16 bytes
	lpEventTrack.dwFlags = TME_HOVER + TME_LEAVE
	lpEventTrack.hwndTrack = Handle (This)
	lpEventTrack.dwHoverTime = 100
	//hover time-out (if TME_HOVER was specified in dwFlags), in milliseconds
	
	//if this does not work, try swaping this call with the emulated one below
	//	TrackMouseEvent(lpEventTrack)
	_TrackMouseEvent(lpEventTrack)
End If

end event

event mousehover();This.Border = True
This.BorderStyle = StyleRaised!

end event

event mouseleave();This.Border = False


end event

event other;Choose Case Message.Number
	Case WM_MOUSEHOVER
		This.TriggerEvent("mousehover")
	Case WM_MOUSELEAVE
		ib_mouseover = False
		This.TriggerEvent("mouseleave")
End Choose

end event

