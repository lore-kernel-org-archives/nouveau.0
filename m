From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27905] DVI monitor is blank - DVI detected as
	Display Port ?
Date: Tue,  4 May 2010 15:37:45 -0700 (PDT)
Message-ID: <20100504223745.D33FD13004F@annarchy.freedesktop.org>
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

--- Comment #13 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-05-04 15:37:45 PDT ---
(In reply to comment #12)
> LVDS-1 is closed; in nv, it means it is disconnected. Please see xrandr outputs
> below.
I don't recall nv (unless by nv you mean the proprietary driver) doing anything
of the sort.  In any case, nouveau does something similar in this case, hence
LVDS being reported as "unknown connection".  We do this instead of
"disconnected" so that X will setup LVDS still if the lid is closed and nothing
else is plugged in.

> 
> Also, I tried the following command lines :
> xrandr --output LVDS-1 --off
> xrandr --output DP-1 --auto
> 
> -> nothing happens. Screen DVI-1 is still blank.
Right, so now you're probably hitting another bug I've seen reported in a few
places where docking station DVI fails on systems where it could be either DP
or DVI on the docking station.

> Then I open the laptop and issued :
> 
> xrandr --output LVDS-1 --auto
> 
> I got : 
> 
> xrandr: cannot find crtc for output LVDS-1
> 
> It means that it tries to display on both DP-1 and VGA-1, right ?
Correct.

> 
> BTW, in gnome's display preferences, I correctly get both monitors displayed,
> but still, the monitor on DVI stays blank.
> 
> Again : I have no monitor on DisplayPort (and I have no DisplayPort on the
> docking station). I have one monitor on VGA and one monitor on DVI (and LVDS as
> well, which is off most of the time).
As I mentioned above, the VBIOS reports the connectors as DisplayPort as the
docking station could potentially have DP instead of DVI-D connectors.  There's
no way for us to tell which the manufacturer wired up, so we assume it's DP. 
This has no effect on functionality.


Ok, my question for you is:  Are you able to make your VBIOS setup the DVI
display during POST instead of the LVDS panel?  There may be options in your
BIOS setup to allow this.  If so, let me know and we may be able to get traces
that'll help me track this problem down for you.

Ben.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
