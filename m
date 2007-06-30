From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11425] New: EXA on GF6200/AGP and different
	"MigrationHeuristic" schemas
Date: Fri, 29 Jun 2007 21:31:44 -0700 (PDT)
Message-ID: <bug-11425-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11425

           Summary: EXA on GF6200/AGP and different "MigrationHeuristic"
                    schemas
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


hardware:

lspci -v
01:00.0 VGA compatible controller: nVidia Corporation GeForce 6200 (rev a1)
(prog-if 00 [VGA])
        Subsystem: ASUSTeK Computer Inc.: Unknown device 81e1
        Flags: bus master, 66Mhz, medium devsel, latency 32, IRQ 20
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (32-bit, prefetchable) [size=256M]
        Memory at dd000000 (32-bit, non-prefetchable) [size=16M]
        Expansion ROM at dfde0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0

lspci -vn
01:00.0 Class 0300: 10de:0221 (rev a1)
        Subsystem: 1043:81e1
        Flags: bus master, 66Mhz, medium devsel, latency 32, IRQ 20
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (32-bit, prefetchable) [size=256M]
        Memory at dd000000 (32-bit, non-prefetchable) [size=16M]
        Expansion ROM at dfde0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0

software:
kernel 2.6.21.5
drm git up to and include a27af4c4a665864df09123f177ca7269e48f6171
mesa git 5e4a0f42f243cd5fbc8718660d78705e8c70808f
xf86-video-nouveau git e81c9a29e6d1c6573892df8601f0361c2b09c659

if i set  Option "MigrationHeuristic" in my xorg.conf to "always" (default) - i
have screen corruption even on Mozilla start. And can easily see rendering
problems after scroll some pages inside mozilla up and down.

if i set this option to "greedy" - i have stable desktop, no problems with
mozilla (i can load tens pages with heavy graphics usage). but X still crashes
at some point. Also translucency changes not very smooth.

if i set option  "MigrationHeuristic" to "smart" - i have nice looking and fast
desktop. And memory usage is lowest, according to gkrellm. But if i load many
pages in mozilla , heavy loaded with small pictures - i can see some (text
rendering) problems in gkrellm window and then crash or freeze. (acpi poweroff
work)

and question: as i can see in xorg.0.log and in sources - nouveau use half
available videoram for EXA acceleration. May be option like FBtexPercent will
be useful there?

(screenshots, crash logs and xorg.conf follow shortly ...)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
