From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] The new nouveau kernel module fails to use my
 monitor's native resolution
Date: Fri, 14 Oct 2011 07:46:35 -0700 (PDT)
Message-ID: <20111014144635.AAFF71300C9@annarchy.freedesktop.org>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #13 from monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org 2011-10-14 07:46:35 PDT ---
(In reply to comment #10)
> That's a bug of the kernel command line parser... try "RM" instead of "MR".

That does the trick, thank you (tho I still end up having to use the @55
because the modeline used by 1600x1200RM is still flagged by my monitor as "non
optimal").

> > I haven't tried the Xorg nouveau driver on top to see whether it obeys my
> > "video=" arg or whether I'm going to have to play the same dance in the
> > xorg.conf file (because right now the Xorg driver gives me the familiar
> It doesn't, right now you need to tell X to use a reduced blanking mode
> separately.

OK, since the Xorg nouveau driver now lets me start, I could try it out, and
indeed it gives me 1280x960 by default.  Problem is, if I do
  xrandr --newmode "1600x1200" 119.0 1600 1648 1680 1760 1200 1203 1207 1232
  xrandr --addmode "DVI-D-1" "1600x1200"
  xrandr --output "DVI-D-1" --mode "1600x1200"
I just get an X protocol error on the xrandr side and the following message on
the xinit output:
  resize called 1600 1200
  (EE) NOUVEAU(0): Couldn't allocate shadow memory for rotated CRTC
And if I try to add the modeline directly to the xorg.conf:
  Section "Device"
        Identifier      "NVidia card"
        Driver          "nouveau"
        Option          "Monitor-DVI-D-1" "Samsung 214T"
  EndSection
  Section "Monitor"
   Identifier "Samsung 214T"
   ModeLine "1600x1200RM@55" 119.0 1600 1648 1680 1760 1200 1203 1207 1232
  EndSection
the X server fails to start, with "Error allocating scanout buffer: 0"
(commenting out the Modeline lets it start again, using 1280x960). I've
attached the corresponding section of dmesg.log as well as the Xorg.log.

> The latter would be a better idea IMHO.

In any case, I hope that the problem generates a clear enough warning to help
track it down.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
