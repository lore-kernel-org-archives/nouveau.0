From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18336] New: nv10 : doesn't detect connected dvi
	monitor
Date: Sat,  1 Nov 2008 03:46:48 -0700 (PDT)
Message-ID: <bug-18336-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18336

           Summary: nv10 : doesn't detect connected dvi monitor
           Product: xorg
           Version: 7.3
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: msirapian-GANU6spQydw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi,

I have a NV11 with two DFP monitors connected : one via a VGA connection (main
screen), the second, via its DVI input to the DVI output of NV11. With nouveau,
only VGA-0 is seen.

Both are connected at boot. Under Windows, they work and are recognized. With
nvidia blob, it used to work until lately, as their legacy driver is broken for
the dvi output of NV11 (and they won't fix it, naturally).

So the symptom is simple : only vga monitor is seen.

sirapian@enigma:~$ xrandr -q
Screen 0: minimum 320 x 200, current 1024 x 768, maximum 2704 x 1050
VGA-0 connected 1024x768+0+0 (normal left inverted right x axis y axis) 307mm x
230mm

I've read the xorg.log, it seems to see 4 DCB entries, which are merged to one,
and only VGA monitor is seen. In a former xorg.log, when I used the blob, it
saw there 2 DCBs, and the two monitors were identified.

I attached my xorg.0.log. 

I'm using the experimental debian packages (the latest ones). 

If you need further information or investigation, please tell me.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
