From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15753] New: [Dualhead, randr12]
Date: Tue, 29 Apr 2008 03:45:44 -0700 (PDT)
Message-ID: <bug-15753-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15753

           Summary: [Dualhead, randr12]
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


My system have two monitors connected to my system.
My xorg.conf starts VGA-0 to the left of DVI-A-0.
Both starts at resolution 1280x1024 by default (not changed by me).

VGA-0 is capable of running the resolution 1600x1200, but here comes the
problem:
xake@lillen ~ $ xrandr --output VGA-0 --mode 1600x1200
xake@lillen ~ $ xrandr
Screen 0: minimum 320 x 200, current 2560 x 1200, maximum 3000 x 3000
VGA-0 connected 1600x1200+0+0 (normal left inverted right x axis y axis) 352mm
x 264mm
   1280x1024      85.0 +   84.8     75.0  
   1600x1200      75.0* 
   1152x864       75.0  
   1024x768      100.0     84.9     75.1     70.1     60.0     43.5  
   832x624        74.6  
   800x600        84.9     72.2     75.0     60.3     56.2  
   640x480        84.6     75.0     72.8     66.7     60.0  
   720x400        87.8     70.1  
DVI-A-0 connected 1280x1024+1280+0 (normal left inverted right x axis y axis)
306mm x 230mm
   1280x1024      60.1* 
   1024x768       75.1     70.1     60.0     43.5  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        75.0     72.8     66.7     60.0     59.9  
   720x400        87.8     70.1  
   512x384       120.0  
   400x300       120.6  
   320x240       120.1  
DVI-D-0 disconnected (normal left inverted right x axis y axis)

As you can see in this output the "current" for "Screen 0" is less then the
width of VGA-0 and DVI-A-0 making a part of the left screen also appere on the
right.

However if I do:

xake@lillen ~ $ xrandr
Screen 0: minimum 320 x 200, current 2560 x 1200, maximum 3000 x 3000
VGA-0 connected 1600x1200+0+0 (normal left inverted right x axis y axis) 352mm
x 264mm
   1280x1024      85.0 +   84.8     75.0  
   1600x1200      75.0* 
   1152x864       75.0  
   1024x768      100.0     84.9     75.1     70.1     60.0     43.5  
   832x624        74.6  
   800x600        84.9     72.2     75.0     60.3     56.2  
   640x480        84.6     75.0     72.8     66.7     60.0  
   720x400        87.8     70.1  
DVI-A-0 connected 1280x1024+1280+0 (normal left inverted right x axis y axis)
306mm x 230mm
   1280x1024      60.1* 
   1024x768       75.1     70.1     60.0     43.5  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        75.0     72.8     66.7     60.0     59.9  
   720x400        87.8     70.1  
   512x384       120.0  
   400x300       120.6  
   320x240       120.1  
DVI-D-0 disconnected (normal left inverted right x axis y axis)
xake@lillen ~ $ xrandr --output DVI-A-0 --off
xake@lillen ~ $ xrandr --output DVI-A-0 --auto
xake@lillen ~ $ xrandr --output DVI-A-0 --right-of VGA-0
xake@lillen ~ $ xrandr --output DVI-A-0 --mode 1280x1024
xake@lillen ~ $ xrandr
Screen 0: minimum 320 x 200, current 2880 x 1200, maximum 3000 x 3000
VGA-0 connected 1600x1200+0+0 (normal left inverted right x axis y axis) 352mm
x 264mm
   1280x1024      85.0 +   84.8     75.0  
   1600x1200      75.0* 
   1152x864       75.0  
   1024x768      100.0     84.9     75.1     70.1     60.0     43.5  
   832x624        74.6  
   800x600        84.9     72.2     75.0     60.3     56.2  
   640x480        84.6     75.0     72.8     66.7     60.0  
   720x400        87.8     70.1  
DVI-A-0 connected 1280x1024+1600+0 (normal left inverted right x axis y axis)
306mm x 230mm
   1280x1024      60.1* 
   1024x768       75.1     70.1     60.0     43.5  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        75.0     72.8     66.7     60.0     59.9  
   720x400        87.8     70.1  
   512x384       120.0  
   400x300       120.6  
   320x240       120.1  
DVI-D-0 disconnected (normal left inverted right x axis y axis)

Then as you can see everything works nice.

So it seems changing the resolution the output of VGA-0 (theleft screen) does
not setup a correct screen size, but with xrandr turn off DVI-A-0 and restore
its setup again both monitors seems to work nice.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
