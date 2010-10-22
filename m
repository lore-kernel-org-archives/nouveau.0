From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31058] Flickering area on external monitor [9400M]
Date: Fri, 22 Oct 2010 15:23:41 -0700 (PDT)
Message-ID: <20101022222341.125E613004F@annarchy.freedesktop.org>
References: <bug-31058-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31058-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31058

--- Comment #1 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2010-10-22 15:23:40 PDT ---
This is probably an irrelevant comment, but...

You seem to have Samsung SyncMaster 204B monitor, which has two known typical
faults: dying chinese electrolyte capacitors, and instability at the monitor's
own recommended mode of 1600x1200 60 Hz. Your symptoms, though, do not fit
either of these, but I tought you'd like to know. I have personally fixed one
of these monitors.

The only fix for capacitors is replacing them. The display mode problem,
however, is more interesting. The standard (and the one the monitor EDID
advertises) 1600x1200 mode uses 162 MHz pixel clock, which the monitor can only
barely accept. Symptoms of mode failure are image blackouts, and white or green
"snowing" (fast moving random bright pixels). Severity depends on the screen
contents.

The fix for the mode failure is easy: use 1600x1200 60 Hz reduced blanking
mode. Its pixel clock is low enough (130-something MHz) for the monitor to be
stable. That is my personal experience.

If you want to stress-test your monitor, make it show this image:
http://koti.mbnet.fi/inventor/download/kuvia/raster.gif
In the 162 MHz mode, my monitor simply refuses to show anything, or misbehaves
badly. On reduced blanking mode, it works like a charm.

I would recommend the reduced blanking mode regardless if my explanation has
anything to do with your actual problem. When you test different resolutions
and display modes, check the monitor's on-screen display for the mode size and
frequencies. I do not remember the default on Nouveau, but we may be feeding a
1600x1200 mode regardless of the resolution you have selected (GPU rescaling),
even on VGA text mode(!).

Cheers.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
