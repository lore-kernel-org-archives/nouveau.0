From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78863] New: [nv50] errors when starts gnome-shell
Date: Sun, 18 May 2014 14:32:09 +0000
Message-ID: <bug-78863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0639749884=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0639749884==
Content-Type: multipart/alternative; boundary="1400423529.acaF1.13060"; charset="us-ascii"


--1400423529.acaF1.13060
Date: Sun, 18 May 2014 14:32:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78863

          Priority: medium
            Bug ID: 78863
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv50] errors when starts gnome-shell
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: minor
    Classification: Unclassified
                OS: All
          Reporter: mattia.b89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 99275
  --> https://bugs.freedesktop.org/attachment.cgi?id=99275&action=edit
log from dmesg

I get these two non-fatal errors with gnome-shell:

[  164.903589] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
[  164.903603] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x003f92b000
gnome-shell[1242]] subc 3 class 0x8297 mthd 0x0e04 data 0xfebf0000
[  164.903616] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
[  164.903622] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x003f92b000
gnome-shell[1242]] subc 3 class 0x8297 mthd 0x0e08 data 0xffc70000

my configuration:
x86_64 archlinux kernel-3.14.2-1
xf86-video-nouveau-1.0.10-2
gnome-shell-3.12.2-1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400423529.acaF1.13060
Date: Sun, 18 May 2014 14:32:09 +0000
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
   title="NEW --- - [nv50] errors when starts gnome-shell"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78863">78863</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv50] errors when starts gnome-shell
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>minor
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>mattia.b89&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=99275" name="attach_99275" title="log from dmesg">attachment 99275</a> <a href="attachment.cgi?id=99275&amp;action=edit" title="log from dmesg">[details]</a></span>
log from dmesg

I get these two non-fatal errors with gnome-shell:

[  164.903589] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
[  164.903603] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x003f92b000
gnome-shell[1242]] subc 3 class 0x8297 mthd 0x0e04 data 0xfebf0000
[  164.903616] nouveau E[  PGRAPH][0000:01:00.0] DATA_ERROR INVALID_VALUE
[  164.903622] nouveau E[  PGRAPH][0000:01:00.0] ch 4 [0x003f92b000
gnome-shell[1242]] subc 3 class 0x8297 mthd 0x0e08 data 0xffc70000

my configuration:
x86_64 archlinux kernel-3.14.2-1
xf86-video-nouveau-1.0.10-2
gnome-shell-3.12.2-1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400423529.acaF1.13060--

--===============0639749884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0639749884==--
