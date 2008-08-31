From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17377] New: NV50 failure on MacBook Pro.
Date: Sun, 31 Aug 2008 05:10:08 -0700 (PDT)
Message-ID: <bug-17377-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17377

           Summary: NV50 failure on MacBook Pro.
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=18598)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=18598)
Xorg.log with Fedora rawhide driver

The driver shipped with Fedora 9 (git0991281) and the one in Fedora Rawhide
(git9c1d87f) both crash on my MacBook Pro at startup:

(II) NOUVEAU(0): Display Configuration Block version 4.0 found
(II) NOUVEAU(0): DCB header length 27, with 10 possible entries
Raw DCB entry 0: 01000123 00010034
(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report
(II) NOUVEAU(0): NV50DispPreInit is called.
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"
(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"
(II) Module "ddc" already built-in
(WW) NOUVEAU(0): No outputs definitely connected, trying again...

Backtrace:
0: X(xf86SigHandler+0x65) [0x479ca5]
1: /lib64/libc.so.6 [0x37288322a0]
2: X [0x4a0100]
3: X(xf86InitialConfiguration+0x11c0) [0x4a3c10]
4: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x2d456ae]
5: X(InitOutput+0x969) [0x463109]
6: X(main+0x286) [0x42ca76]
7: /lib64/libc.so.6(__libc_start_main+0xfa) [0x372881e32a]
8: X(FontFileCompleteXLFD+0x281) [0x42c029]

Fatal server error:
Caught signal 11.  Server aborting


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
