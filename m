From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27905] DVI monitor is blank - DVI detected as
	Display Port ?
Date: Tue,  4 May 2010 16:11:32 -0700 (PDT)
Message-ID: <20100504231133.0E6C813004F@annarchy.freedesktop.org>
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

--- Comment #14 from Julien Wajsberg <felash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-05-04 16:11:32 PDT ---
(In reply to comment #13)

> I don't recall nv (unless by nv you mean the proprietary driver) doing anything
> of the sort.  In any case, nouveau does something similar in this case, hence
> LVDS being reported as "unknown connection".  We do this instead of
> "disconnected" so that X will setup LVDS still if the lid is closed and nothing
> else is plugged in.

Yes, and that's good.


> As I mentioned above, the VBIOS reports the connectors as DisplayPort as the
> docking station could potentially have DP instead of DVI-D connectors.  There's
> no way for us to tell which the manufacturer wired up, so we assume it's DP. 
> This has no effect on functionality.

So that's ok :-)


> Ok, my question for you is:  Are you able to make your VBIOS setup the DVI
> display during POST instead of the LVDS panel?  There may be options in your
> BIOS setup to allow this.  If so, let me know and we may be able to get traces
> that'll help me track this problem down for you.

That is my current set up: BIOS POST and Linux kernel messages are shown on the
DVI display until nouveau is loading.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
