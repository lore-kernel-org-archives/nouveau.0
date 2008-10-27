From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18234] c51 lvds script failure in randr12 mode. if I
 start the X server the screen is black and the framebuffer too because it
 trys to link the whole output to the monitor
Date: Sun, 26 Oct 2008 17:07:57 -0700 (PDT)
Message-ID: <20081027000757.9309A13013B@annarchy.freedesktop.org>
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





--- Comment #2 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-10-26 17:07:56 PST ---
Issue can be worked around by worked around by turning call_lvds_script into a
noop.

It is possibly suspicious that in doing dpms on at the end of the modeset,
0xD3BF: [ (0x56) - INIT_CONDITION_TIME ] does not successfully complete: "
0xD3BF: Condition still not met, skiping following opcodes". A comparison xorg
log from darktama's C51 executing (almost) the same script does successfully
complete.

Thomas: after nouveau has failed to start X, does the VT return, or does the
screen remain blank until the laptop is rebooted?

Two other things to try:
1) does it work if the timeout is increased: in nv_bios.c, function
init_condition_time(), change "BIOS_USLEEP(2000);" to "BIOS_USLEEP(20000);"
2) if 1) does not work, does it work if the off script is not run: again in
nv_bios.c, function run_lvds_table(), just below "case LVDS_PANEL_OFF:" add
"return;" on a new line.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
