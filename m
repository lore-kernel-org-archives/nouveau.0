From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12251] New: NVComposite() is broken on NV17 (GeForce
	4 MX)
Date: Sat,  1 Sep 2007 07:36:57 -0700 (PDT)
Message-ID: <bug-12251-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12251

           Summary: NVComposite() is broken on NV17 (GeForce 4 MX)
           Product: xorg
           Version: 7.2
          Platform: x86 (IA32)
               URL: http://www.shlomifish.org/Files/files/images/Computer/Sc
                    reenshots/ksokoban-nouveau.png
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


As can be seen in the screenshot running KSokoban, the NVComposite is broken on
NV17.

<<<<<<<<<<<<<<<<<<<<
<rindolf> ahuillet: it's working now.
<ahuillet> -_-
<ahuillet> ok, can you please re-opn nv_exa.c
<rindolf> ahuillet: although when I tried to replace xf86-video-nouveau during
the X runtime, it caused my computer to hang.
<rindolf> ahuillet: yes, I can.
<ahuillet> replace the = 1 by a 0 again
<ahuillet> and look a little below for a if ( op != PictOpSrc && op !=
PictOpOver ) statement
<ahuillet> remove the PictOpOver part
<ahuillet> then try again and confirm that it works.
<rindolf> ahuillet: {{{ else if (op != PictOpOver &&  op != PictOpSrc) }}} ?
<ahuillet> yes
<ahuillet> s/op != PictOpOver && //
<rindolf> ahuillet: changing and re-compiling.
<rindolf> ahuillet: ok, I'm going to restart X.
 Perl interface unloaded

* Loaded log from Sat Sep  1 17:20:17 2007

--> You are now talking on #nouveau
--- Topic for #nouveau is TiNDC #26 | http://nouveau.freedesktop.org and FAQ |
dump HowTo http://nouveau.freedesktop.org/wiki/REnouveauDumps
--- Topic for #nouveau set by Koala_BR at Sat Aug 25 10:18:50 2007
<ahuillet> afternoon.
<rindolf> Hi ahuillet 
<rindolf> ahuillet: now, it's as bad as before.
<ahuillet> rindolf : hello, long time no see
<rindolf> ahuillet: :-)
<ahuillet> rindolf : aha, interesting.
>>>>>>>>>>>>>>>>>>


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
