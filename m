From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19854] XrandR reports no CRTCs for VGA-0 output
 until the first time a display is plugged
Date: Fri,  6 Feb 2009 04:36:56 -0800 (PST)
Message-ID: <20090206123656.4480E130057@annarchy.freedesktop.org>
References: <bug-19854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19854-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19854


Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|xscreensaver fails to run   |XrandR reports no CRTCs for
                   |(regression)                |VGA-0 output until the first
                   |                            |time a display is plugged




--- Comment #2 from Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-06 04:36:55 PST ---
Yep, the bug seems the same (I haven't had the time to compile xscreensaver
yet), however I think that nouveau may be at fault here:

1) X starts whith only LVDS connected
2) XrandR reports no CRTCs for VGA-0 output. I'd expect it to report CRTCs 0
and 1, as both of them can drive the output when it is connected (and this is
what it did before, IIRC)
3) xscreensaver fails.

If at this point one runs xrandr --addmode VGA-0 640x480, the server crashes
with
Backtrace:
0: /usr/bin/X(xorg_backtrace+0x26) [0x4ebd56]
1: /usr/bin/X(xf86SigHandler+0x39) [0x47f949]
2: /lib/libc.so.6 [0x7f637896ef80]
3: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0x7f63773c2fe6]
4: /usr/bin/X [0x4adfbb]
5: /usr/bin/X(RROutputAddUserMode+0xa4) [0x525d64]
6: /usr/bin/X(Dispatch+0x364) [0x44c2d4]
7: /usr/bin/X(main+0x45d) [0x432bcd]
8: /lib/libc.so.6(__libc_start_main+0xe6) [0x7f637895b1a6]
9: /usr/bin/X(FontFileCompleteXLFD+0x269) [0x431fa9]

Fatal server error:
Caught signal 11.  Server aborting

inside nv_output_mode_valid (I think nv_encoder is NULL at this point).

When a display is connected to VGA-0, xrandr reports CRTCs: 0 1 for VGA-0, and
everything works as it should (xscreensaver included). If the display is
disconnected, everything keeps working (and xrandr --addmode no longer crashes
the server), the CRTCs: 0 1 line remains in the VGA-0 output of xrandr.

So, I don't know for sure if it is wrong to report no CRTCs for a disconnected
output, but the fact that the reported CRTCs change after an external display
is plugged and unplugged again, and the related crash of the Xserver seems to
imply that there is a bug with this. I've changed the description accordingly.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
