From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27905] DVI monitor is blank - DVI detected as
	Display Port ?
Date: Tue,  4 May 2010 04:29:26 -0700 (PDT)
Message-ID: <20100504112926.A3687130051@annarchy.freedesktop.org>
References: <bug-27905-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27905-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=27905

--- Comment #12 from Julien Wajsberg <felash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-05-04 04:29:25 PDT ---
LVDS-1 is closed; in nv, it means it is disconnected. Please see xrandr outputs
below.

Also, I tried the following command lines :
xrandr --output LVDS-1 --off
xrandr --output DP-1 --auto

-> nothing happens. Screen DVI-1 is still blank.
Then I open the laptop and issued :

xrandr --output LVDS-1 --auto

I got : 

xrandr: cannot find crtc for output LVDS-1

It means that it tries to display on both DP-1 and VGA-1, right ?

BTW, in gnome's display preferences, I correctly get both monitors displayed,
but still, the monitor on DVI stays blank.

Again : I have no monitor on DisplayPort (and I have no DisplayPort on the
docking station). I have one monitor on VGA and one monitor on DVI (and LVDS as
well, which is off most of the time).

Thanks

----
xrandr output when the laptop is closed :
LVDS-1 unknown connection (normal left inverted right x axis y axis)
   1440x900       60.0 +   40.0  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis) 338mm
x 270mm
   1280x1024      60.0*+   75.0  
   1280x960       60.0  
   1152x864       75.0     70.0  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        72.8     75.0     66.7     60.0  
   720x400        70.1  
DP-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis) 376mm x
301mm
   1280x1024      60.0*+   75.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)

----
xrandr output when the laptop is opened :

Screen 0: minimum 320 x 200, current 1280 x 1024, maximum 8192 x 8192
LVDS-1 connected (normal left inverted right x axis y axis)
   1440x900       60.0 +   40.0  
   1152x864       60.0  
   1024x768       59.9  
   800x600        59.9  
   640x480        59.4  
   720x400        59.6  
   640x400        60.0  
   640x350        59.8  
VGA-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis) 338mm
x 270mm
   1280x1024      60.0*+   75.0  
   1280x960       60.0  
   1152x864       75.0     70.0  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        72.8     75.0     66.7     60.0  
   720x400        70.1  
DP-1 connected 1280x1024+0+0 (normal left inverted right x axis y axis) 376mm x
301mm
   1280x1024      60.0*+   75.0  
   1152x864       75.0  
   1024x768       75.1     60.0  
   800x600        75.0     60.3  
   640x480        75.0     60.0  
   720x400        70.1  
DP-2 disconnected (normal left inverted right x axis y axis)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
