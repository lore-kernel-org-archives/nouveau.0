From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16148] primary display is borked with RandR12 enabled
Date: Mon, 18 Aug 2008 07:26:25 -0700 (PDT)
Message-ID: <20080818142625.6115B1304CA@annarchy.freedesktop.org>
References: <bug-16148-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16148-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16148





--- Comment #6 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-08-18 07:26:24 PST ---
Assuming it doesn't work with updated software, can you also try:

1) starting from a non-corrupted state, start nouveau with
nv_bios.c:call_lvds_script patched out:

--- a/src/nv_bios.c
+++ b/src/nv_bios.c
@@ -2965,6 +2965,7 @@ void call_lvds_script(ScrnInfoPtr pScrn, struct dcb_entry
*dcbent, int head, enu
        uint32_t sel_clk_binding;
        static int last_invoc = 0;

+       return;
        if (last_invoc == (script << 1 | head) || !lvds_ver)
                return;

and check whether the picture in X is ok, and whether the picture on returning
to console is ok.

2) Make register dumps while in X, and attach them here -- one with randr12
disabled (and no corruption present), and one with randr12 enabled and the
corruption present -- as follows:

git clone git://people.freedesktop.org/~stuart/radeontool
make
./radeontool regs > logfile


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
