From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93732] New: SW cursor flicker in-game
Date: Sat, 16 Jan 2016 12:33:30 +0000
Message-ID: <bug-93732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0316166629=="
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


--===============0316166629==
Content-Type: multipart/alternative; boundary="1452947610.3fdCD80.10378"; charset="UTF-8"


--1452947610.3fdCD80.10378
Date: Sat, 16 Jan 2016 12:33:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93732

            Bug ID: 93732
           Summary: SW cursor flicker in-game
           Product: Mesa
           Version: 11.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kugel-UCKwuKHb1aVAfugRpC6u6w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 121072
  --> https://bugs.freedesktop.org/attachment.cgi?id=121072&action=edit
glxinfo

I've got a GeForce 650 Ti, and when I'm using the SW cursor (either manually
through xorg.conf, or enforced in a Reverse PRIME setup), the cursor begins to
flicker heavily in the Dota 2 game.

It seems that not only the cursor flickers heavily but also clicking is harder
(as if the click didn't work when the cursor is invisible).

I do not experience this with HW cursor or on the desktop or with the game in
windowed mode.

This is on GNOME 3 which disables compositing in full-screen applications.

X -version

X.Org X Server 1.18.0
Release Date: 2015-11-09
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.3.3-2-ARCH x86_64 
Current Operating System: Linux thomas-nb 4.3.3-2-ARCH #1 SMP PREEMPT Wed Dec
23 20:09:18 CET 2015 x86_64
Kernel command line: initrd=\intel-ucode.img initrd=\initramfs-linux.img
root=/dev/sda2 rw nouveau.pstate=1 nouveau.War00C800_0=1
nouveau.config=War00C800_0=1
Build Date: 16 January 2016  01:12:20PM

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1452947610.3fdCD80.10378
Date: Sat, 16 Jan 2016 12:33:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - SW cursor flicker in-game"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93732">93732</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>SW cursor flicker in-game
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>kugel&#64;rockbox.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=121072" name="attach_121072" title="glxinfo">attachment 121072</a> <a href="attachment.cgi?id=121072&amp;action=edit" title="glxinfo">[details]</a></span>
glxinfo

I've got a GeForce 650 Ti, and when I'm using the SW cursor (either manually
through xorg.conf, or enforced in a Reverse PRIME setup), the cursor begins to
flicker heavily in the Dota 2 game.

It seems that not only the cursor flickers heavily but also clicking is harder
(as if the click didn't work when the cursor is invisible).

I do not experience this with HW cursor or on the desktop or with the game in
windowed mode.

This is on GNOME 3 which disables compositing in full-screen applications.

X -version

X.Org X Server 1.18.0
Release Date: 2015-11-09
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.3.3-2-ARCH x86_64 
Current Operating System: Linux thomas-nb 4.3.3-2-ARCH #1 SMP PREEMPT Wed Dec
23 20:09:18 CET 2015 x86_64
Kernel command line: initrd=\intel-ucode.img initrd=\initramfs-linux.img
root=/dev/sda2 rw nouveau.pstate=1 nouveau.War00C800_0=1
nouveau.config=War00C800_0=1
Build Date: 16 January 2016  01:12:20PM</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452947610.3fdCD80.10378--

--===============0316166629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0316166629==--
