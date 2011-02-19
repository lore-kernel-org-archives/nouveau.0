From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34469] New: libdrm modetest fails,
	and causes kernel panic
Date: Fri, 18 Feb 2011 18:51:07 -0800 (PST)
Message-ID: <bug-34469-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34469

           Summary: libdrm modetest fails, and causes kernel panic
           Product: Mesa
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: darxus-gf8W+JFHfRr/2OF+hy8yCA@public.gmane.org


The modetest program with -v argument should flip back and forth between a
color test pattern and a solid grey screen.  Running just "./modetest" said I
was running 1600x1200 @75hz.  I ran "./modetest -s 7:1600x1200 -v" and
"./modetest -s 7:640x480 -v", both gave me a lot of garbage.  I ran "./modetest
-s 7:1600x1200@75 -v", and got an almost steady display alternating vertically
between bars of the color pattern and the solid grey.  Very roughly 20 rows of
pixels each.

Later I ran just "./modetest -s 7:1600x1200@75" and got a kernel panic.  I got
a photo, but I need to find my CF reader.  It included:
...RIP... nouveau_finish_page_flip+0xae/0x1a0 [nouveau]

I was using an NV50 family card, G92 [GeForce 8800 GT].

I believe this is related to the corruption I'm occasionally seeing in
wayland's DRM output.

Built kernel from nouveau kernel repo, last commit:
commit 82eeca9a994c9676e3ab478285d02b9474d70cba
CommitDate: Thu Feb 17 11:11:28 2011 +1000

libdrm freshly rebuilt from git:
commit a697fb6acad7992c3d23bb6a663663694782eb7b
CommitDate: Thu Feb 17 20:40:30 2011 +0100

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
