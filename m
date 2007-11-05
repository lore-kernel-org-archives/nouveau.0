From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12833] Geforce 8400M GS (id 0x427) support
Date: Mon,  5 Nov 2007 14:00:27 -0800 (PST)
Message-ID: <20071105220027.3C67113000B@annarchy.freedesktop.org>
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


debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Geforce 8400M GS (id 0x427):|Geforce 8400M GS (id 0x427)
                   |working but slow            |support




------- Comment #13 from debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org  2007-11-05 14:05 PST -------
Git head 5ca10da0c7dd2fd689cc4369e37ed385a0c10d21 fixed the black screen, which
retrospectively was probably the screen switching off to prevent any damage.

AIGLX is deactivated in my xorg.conf at the moment.

But I still have the default frequency at 0 Hz. See xrandr output:

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

I'm eager to test hotplug.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
