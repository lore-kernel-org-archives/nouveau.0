From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14597] randr12 failures on 12" powerbooks,
	and workarounds
Date: Fri, 29 Feb 2008 04:50:23 -0800 (PST)
Message-ID: <20080229125023.F12231300D6@annarchy.freedesktop.org>
References: <bug-14597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14597





--- Comment #16 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-02-29 04:50:23 PST ---
Ok, so afaics the problem here is something the output scripts are doing (the
intention of the below patch was to put some regs back to the state they were
in before running the script).

The scripts that are called are LVDS_PANEL_OFF, LVDS_RESET, and LVDS_PANEL_ON.

To confirm that the scripts are the problem, *first test that "return;"ing at
the very start of call_lvds_manufacturer_script works*. If not, attach the xorg
log here.

After that, do:
if (script == LVDS_PANEL_OFF || script == LVDS_PANEL_RESET)
        return;
to check if the LVDS_PANEL_ON script is broken.
If that works, do:
if (script == LVDS_PANEL_RESET)
        return;
to ensure LVDS_PANEL_OFF is ok.
If we get this far, we'll start doing the LVDS_RESET script by hand, to see
what is broken in that...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
