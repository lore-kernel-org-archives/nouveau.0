From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14403] New: NV17: LVDS0 is black with Randr 1.2,
 works when randr 1.  2 is disabled
Date: Wed,  6 Feb 2008 07:24:39 -0800 (PST)
Message-ID: <bug-14403-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=14403

           Summary: NV17: LVDS0 is black with Randr 1.2, works when randr
                    1.2 is disabled
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=14176)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14176)
Xorg.0.log of randr 1.2 initialization

I have a compaq (R3000) laptop with a 
"01:00.0 VGA compatible controller: nVidia Corporation NV17 [GeForce4 440 Go
64M] (rev a3)"

I have an external monitor connected via the VGA port.  The external LCD
monitor is detected by the xserver, and I am able to flip modes with xrandr -s
0. 

The built-in panel on the laptop is simply blank.  The strange thing is that
if I disable 'randr1.2', it works just fine. 


(BTW. randr shows me all of the modes available for BOTH the external and
internal display, so it is doing the detection properly.)

BTW2. It is correct... The panel can handle 1680x1050..

[clmesarita@localhost media]$ env DISPLAY=:0 xrandr
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 1680 x 1680
VGA-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 304mm x
228mm
   1024x768       60.0*+
   800x600        75.0     60.3  
   640x480        75.0     60.0  
LVDS-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 331mm
x 207mm
   1680x1050      59.9 +   60.0  
   1360x768       59.8     60.0  
   1280x800       60.0  
   1152x864       60.0  
   1280x768       60.0  
   1280x720       60.0  
   1024x768       60.0* 
   800x600        60.3  
   640x480        59.9  
....

I don't mind hacking around with this... Where is a good place to start?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
