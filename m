From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31117] New: nouveau [NV98] [mi] EQ overflowing
Date: Mon, 25 Oct 2010 17:30:26 -0700 (PDT)
Message-ID: <bug-31117-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31117

           Summary: nouveau [NV98] [mi] EQ overflowing
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: brandon-Qdl1sq8EXS0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=39769)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=39769)
patch to fix kernel compile error.

I am getting a variety of crashes and lockups while using the nouveau driver. I
cannot reproduce these issues with the VESA driver.

Different ways of reproducing:
1) Launch emacs -> Crash
2) Launch gnome-terminal, create new tab, drag tab to new window -> Corruption,
Lockup
3) Launch a QT app and at some random point -> Corruption, Lockup

I have tested git: I compiled nouveau kernel tree (I had to fix what looks like
a merge error, I will attach a patch), nouveau xorg driver and libdrm from git
but there was no change.

Environment:
openSUSE Factory
nVidia Corporation G98 [Quadro NVS 295]
X.Org X Server 1.9.1 Release Date: 2010-10-22
2.6.36-rc4-16-default

This appears in my Xorg during a lockup situation (see 2 and 3):
[ 18682.254] [mi] EQ overflowing. The server is probably stuck in an infinite
loop.

The Kernel printed this out too:
[13313.047866] [drm] nouveau 0000:02:00.0: nouveau_channel_free: freeing fifo 2
[13313.721961] [drm] nouveau 0000:02:00.0: Allocating FIFO number 2
[13313.737386] [drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised
FIFO 2
[13326.050223] [drm] nouveau 0000:02:00.0: fail ttm_validate
[13326.050226] [drm] nouveau 0000:02:00.0: validate vram_list
[13326.050228] [drm] nouveau 0000:02:00.0: validate: -12

A more detailed report here:
 https://bugzilla.novell.com/show_bug.cgi?id=648726

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
