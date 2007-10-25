From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12833] Geforce 8400M GS (id 0x427): won't start
Date: Thu, 25 Oct 2007 10:51:57 -0700 (PDT)
Message-ID: <20071025175157.A6E08130009@annarchy.freedesktop.org>
References: <bug-12833-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12833-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12833





------- Comment #3 from debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org  2007-10-25 10:56 PST -------
After git clones of drm and nouveau, compiling and installing, I restarted. I
had to manually load the new drm module instead of the default one and... it
worked!

The native resolution of 1280x800 was enabled by default.

My first impression is how the refreshing is slow.

Some output from xrandr:

Screen 0: minimum 320 x 200, current 1280 x 800, maximum 1280 x 1280
VGA1 disconnected
DVI1 disconnected
LVDS connected 1280x800+0+0 0mm x 0mm
   1280x800        0.0*+   60.0  
   1280x768       60.0  
   1024x768       60.0  
   800x600        60.3  
   640x480        59.9  
   640x400       120.0  
   640x384       120.2  
   512x384       120.0  

I connected a screen on VGA1 but nothing changed. But I expected it to be named
VGA.

I attach the Xorg log.

What do you need now to help improve support?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
