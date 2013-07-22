From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67161] New: Blank video after resuming from S3 or S4
Date: Mon, 22 Jul 2013 10:46:33 +0000
Message-ID: <bug-67161-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0450282303=="
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


--===============0450282303==
Content-Type: multipart/alternative; boundary="1374489993.34d01.10453"; charset="us-ascii"


--1374489993.34d01.10453
Date: Mon, 22 Jul 2013 10:46:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67161

          Priority: medium
            Bug ID: 67161
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Blank video after resuming from S3 or S4
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have a Creative Labs Graphics Blaster Riva TNT video card (nv0). I'm using
nouveau.noaccel=1 kernel boot parameter to workaround bug 27211. I'm on a
derivative of Debian Sid:

Linux openmediavault 2.6.32-5-686 #1 SMP Fri May 10 08:33:48 UTC 2013 i686
GNU/Linux

The problem is this: when the system wakes up after a pm-suspend or
pm-hibernate, the system resumes fine (I can ssh to it and everything works
ok), but the screen stays blank (the monitor has the orange led, which is used
when it's in standy-by mode or no signal received).

In /var/log/messages I find the following messages which seem to be related to
nouveau:

Jul 22 12:01:54 openmediavault kernel: [   58.165951] [drm] nouveau
0000:01:00.0: We're back, enabling device...
Jul 22 12:01:54 openmediavault kernel: [   58.165958] [drm] nouveau
0000:01:00.0: POSTing device...
Jul 22 12:01:54 openmediavault kernel: [   58.232063] agpgart-intel
0000:00:00.0: AGP 2.0 bridge
Jul 22 12:01:54 openmediavault kernel: [   58.232092] agpgart-intel
0000:00:00.0: putting AGP V2 device into 2x mode
Jul 22 12:01:54 openmediavault kernel: [   58.232121] nouveau 0000:01:00.0:
putting AGP V2 device into 2x mode
Jul 22 12:01:54 openmediavault kernel: [   58.232147] [drm] nouveau
0000:01:00.0: Reinitialising engines...
Jul 22 12:01:54 openmediavault kernel: [   58.232169] [drm] nouveau
0000:01:00.0: Restoring GPU objects...
Jul 22 12:01:54 openmediavault kernel: [   58.241771] [drm] nouveau
0000:01:00.0: Restoring mode...
Jul 22 12:01:54 openmediavault kernel: [   58.310342] [drm] nouveau
0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[...]
Jul 22 12:01:54 openmediavault kernel: [   58.398120] [drm] nouveau
0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
Jul 22 12:01:54 openmediavault kernel: [   58.398130] [drm] nouveau
0000:01:00.0: Output VGA-1 is running on CRTC 0 using output @
[...]
Jul 22 12:35:22 openmediavault kernel: [ 2071.968039] [drm] nouveau
0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)

Please let me know if you need the full contents or /var/log/messages or any
other info that could be used to understand what the problem is.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374489993.34d01.10453
Date: Mon, 22 Jul 2013 10:46:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Blank video after resuming from S3 or S4"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67161">67161</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Blank video after resuming from S3 or S4
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mauromol&#64;tiscali.it
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a Creative Labs Graphics Blaster Riva TNT video card (nv0). I'm using
nouveau.noaccel=1 kernel boot parameter to workaround <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - endless PROTECTION_FAULT logs, Nouveau drm, TNT card"
   href="show_bug.cgi?id=27211">bug 27211</a>. I'm on a
derivative of Debian Sid:

Linux openmediavault 2.6.32-5-686 #1 SMP Fri May 10 08:33:48 UTC 2013 i686
GNU/Linux

The problem is this: when the system wakes up after a pm-suspend or
pm-hibernate, the system resumes fine (I can ssh to it and everything works
ok), but the screen stays blank (the monitor has the orange led, which is used
when it's in standy-by mode or no signal received).

In /var/log/messages I find the following messages which seem to be related to
nouveau:

Jul 22 12:01:54 openmediavault kernel: [   58.165951] [drm] nouveau
0000:01:00.0: We're back, enabling device...
Jul 22 12:01:54 openmediavault kernel: [   58.165958] [drm] nouveau
0000:01:00.0: POSTing device...
Jul 22 12:01:54 openmediavault kernel: [   58.232063] agpgart-intel
0000:00:00.0: AGP 2.0 bridge
Jul 22 12:01:54 openmediavault kernel: [   58.232092] agpgart-intel
0000:00:00.0: putting AGP V2 device into 2x mode
Jul 22 12:01:54 openmediavault kernel: [   58.232121] nouveau 0000:01:00.0:
putting AGP V2 device into 2x mode
Jul 22 12:01:54 openmediavault kernel: [   58.232147] [drm] nouveau
0000:01:00.0: Reinitialising engines...
Jul 22 12:01:54 openmediavault kernel: [   58.232169] [drm] nouveau
0000:01:00.0: Restoring GPU objects...
Jul 22 12:01:54 openmediavault kernel: [   58.241771] [drm] nouveau
0000:01:00.0: Restoring mode...
Jul 22 12:01:54 openmediavault kernel: [   58.310342] [drm] nouveau
0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[...]
Jul 22 12:01:54 openmediavault kernel: [   58.398120] [drm] nouveau
0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
Jul 22 12:01:54 openmediavault kernel: [   58.398130] [drm] nouveau
0000:01:00.0: Output VGA-1 is running on CRTC 0 using output &#64;
[...]
Jul 22 12:35:22 openmediavault kernel: [ 2071.968039] [drm] nouveau
0000:01:00.0: Setting dpms mode 1 on vga encoder (output 0)

Please let me know if you need the full contents or /var/log/messages or any
other info that could be used to understand what the problem is.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374489993.34d01.10453--

--===============0450282303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0450282303==--
