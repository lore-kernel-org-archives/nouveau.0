From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24996] Wrong display resolution in X,
 "windowed" console. FX 5600 XT
Date: Sat, 14 Nov 2009 12:50:26 -0800 (PST)
Message-ID: <20091114205026.7AFDA13009C@annarchy.freedesktop.org>
References: <bug-24996-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24996-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24996





--- Comment #10 from Simon Siemonsma <simon-ox55uKOtYtiZyCGURLKNQw@public.gmane.org>  2009-11-14 12:50:25 PST ---
(In reply to comment #9)
> (In reply to comment #6)
> > Created an attachment (id=31117)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31117) [details] [details]
> > nv43_tvdac_load.patch
> > 
> > > 
> > 
> > Does the attached patch fix it for you?
> > 
> 
> The patch doesn't help.
> Please let me now if you would like to receive more information or if can do
> some more tests.
> 

I did some more test.
The console uses the right resolution: 1280x1024. Only the upper left is used
to display the characters.
When running X the monitor is in the right resolution: 1280x1024. Only
xrandr(In reply to comment #9)
> (In reply to comment #6)
> > Created an attachment (id=31117)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31117) [details] [details]
> > nv43_tvdac_load.patch
> > 
> > > 
> > 
> > Does the attached patch fix it for you?
> > 
> 
> The patch doesn't help.
> Please let me now if you would like to receive more information or if can do
> some more tests.
> 

(In reply to comment #9)
> (In reply to comment #6)
> > Created an attachment (id=31117)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31117) [details] [details]
> > nv43_tvdac_load.patch
> > 
> > > 
> > 
> > Does the attached patch fix it for you?
> > 
> 
> The patch doesn't help.
> Please let me now if you would like to receive more information or if can do
> some more tests.
> 

I did some test:
Pressing the menu button of my screen shows the resolution it is running at.
This is 1280x1024 which is as it should be.
In console only the upper left part of the screen is used for the framebuffer
console.
In X the output of xrandr is:
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 4096 x 4096
VGA-0 disconnected (normal left inverted right x axis y axis)
DVI-I-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 376mm
x 301mm
   1280x1024      60.0 +
   1024x768       75.1*    70.1     60.0
   832x624        74.6
   800x600        72.2     75.0     60.3     56.2
   640x480        72.8     75.0     66.7     60.0
   720x400        70.1
TV-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 0mm x
0mm
   720x576        50.0 +
   1024x768       50.0*
   800x600        50.0
   720x480        50.0
   640x480        50.0
   400x300       100.0
   320x240       100.0
   320x200       100.0

I definitively have no TV attached to my system.
It seems xrandr is trying to run my monitor and non excistend tv at the same
resolution.

My understanding is:
1. nouveau detects a tv which is not there.
2. the framebuffer doesn't use all screen real estate for some reason.
3. xrandr sets all available screens to the same resolution. There is already a
bugreport about this.
4. as things are now I have to manually change the resolution of my screen.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
