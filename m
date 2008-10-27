From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18234] c51 lvds script failure in randr12 mode. if I
 start the X server the screen is black and the framebuffer too because it
 trys to link the whole output to the monitor
Date: Sun, 26 Oct 2008 17:26:04 -0700 (PDT)
Message-ID: <20081027002604.4843E130122@annarchy.freedesktop.org>
References: <bug-18234-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18234-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18234





--- Comment #4 from Thomas Schneider <maxmusterm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-10-26 17:26:03 PST ---
> Two other things to try:
> 1) does it work if the timeout is increased: in nv_bios.c, function
> init_condition_time(), change "BIOS_USLEEP(2000);" to "BIOS_USLEEP(20000);"
> 2) if 1) does not work, does it work if the off script is not run: again in
> nv_bios.c, function run_lvds_table(), just below "case LVDS_PANEL_OFF:" add
> "return;" on a new line.

I don't have to test the second way cause the first one works fine.
Thank you Stuart


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
