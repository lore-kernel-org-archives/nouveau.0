From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] New: NV11 black screen & kernel hang on
 loading nouveaufb
Date: Sat, 27 Oct 2012 13:17:59 +0000
Message-ID: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1239777592=="
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


--===============1239777592==
Content-Type: multipart/alternative; boundary="1351343879.220A1.5130"; charset="us-ascii"


--1351343879.220A1.5130
Date: Sat, 27 Oct 2012 13:17:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

          Priority: medium
            Bug ID: 56461
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: NV11 black screen & kernel hang on loading nouveaufb
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 69149
  --> https://bugs.freedesktop.org/attachment.cgi?id=69149&action=edit
dmesg output prior to modprobe nouveau

My NV11 [GeForce2 Go] system hangs with a black screen when loading the nouveau
framebuffer.

After fixing #42384 - many thanks - my system was working. It still works if I
load kernel 3.2.7-1.fc16.i686. Later kernels, including one compiled from
recent commit 214e40f of nouveau/master fail.

I managed to some console messages by booting with a serial console into VGA
text mode with nouveau blacklisted, then modprobing nouveau manually. I'm
attaching the dmesg output from before the modprobe and the console output from
after the modprobe.

I'm also attaching the dmesg output (including the post-modprobe output) from
the working 3.2 kernel.

I'm guessing it will be a memory allocation problem as my ancient system has a
very large screen for a laptop - 1600x1200 and only 64MiB of VRAM.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351343879.220A1.5130
Date: Sat, 27 Oct 2012 13:17:59 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">56461</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV11 black screen &amp; kernel hang on loading nouveaufb
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
          <td>chris&#64;edesix.com
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=69149" name="attach_69149" title="dmesg output prior to modprobe nouveau">attachment 69149</a> <a href="attachment.cgi?id=69149&amp;action=edit" title="dmesg output prior to modprobe nouveau">[details]</a></span>
dmesg output prior to modprobe nouveau

My NV11 [GeForce2 Go] system hangs with a black screen when loading the nouveau
framebuffer.

After fixing #42384 - many thanks - my system was working. It still works if I
load kernel 3.2.7-1.fc16.i686. Later kernels, including one compiled from
recent commit 214e40f of nouveau/master fail.

I managed to some console messages by booting with a serial console into VGA
text mode with nouveau blacklisted, then modprobing nouveau manually. I'm
attaching the dmesg output from before the modprobe and the console output from
after the modprobe.

I'm also attaching the dmesg output (including the post-modprobe output) from
the working 3.2 kernel.

I'm guessing it will be a memory allocation problem as my ancient system has a
very large screen for a laptop - 1600x1200 and only 64MiB of VRAM.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351343879.220A1.5130--

--===============1239777592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1239777592==--
