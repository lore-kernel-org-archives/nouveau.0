From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90054] New: white screen reboot on gm107 with
	multiple monitors
Date: Thu, 16 Apr 2015 17:12:49 +0000
Message-ID: <bug-90054-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0024304605=="
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


--===============0024304605==
Content-Type: multipart/alternative; boundary="1429204369.1C4Cc321.2165"; charset="UTF-8"


--1429204369.1C4Cc321.2165
Date: Thu, 16 Apr 2015 17:12:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90054

            Bug ID: 90054
           Summary: white screen reboot on gm107 with multiple monitors
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jamesstewartmiller-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115127
  --> https://bugs.freedesktop.org/attachment.cgi?id=115127&action=edit
vbios rom from /sys/kernel/debug/dri/0/vbios.rom

Hi, just been chatting with user imirkin on #nouveau irc, and he's recommended
that I open a bug report.

I am getting a white screen on both monitors when I start or add a monitor that
returns me to the login screen.

This is on a fresh install of the ubuntu-studio daily build image (xubuntu
base).

As requested I include my vbios.

The following pastebin is dmesg and xrandr output

hastebin.com/icufuvupup.vhdl

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1429204369.1C4Cc321.2165
Date: Thu, 16 Apr 2015 17:12:49 +0000
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
   title="NEW - white screen reboot on gm107 with multiple monitors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90054">90054</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>white screen reboot on gm107 with multiple monitors
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jamesstewartmiller&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115127" name="attach_115127" title="vbios rom from /sys/kernel/debug/dri/0/vbios.rom">attachment 115127</a> <a href="attachment.cgi?id=115127&amp;action=edit" title="vbios rom from /sys/kernel/debug/dri/0/vbios.rom">[details]</a></span>
vbios rom from /sys/kernel/debug/dri/0/vbios.rom

Hi, just been chatting with user imirkin on #nouveau irc, and he's recommended
that I open a bug report.

I am getting a white screen on both monitors when I start or add a monitor that
returns me to the login screen.

This is on a fresh install of the ubuntu-studio daily build image (xubuntu
base).

As requested I include my vbios.

The following pastebin is dmesg and xrandr output

hastebin.com/icufuvupup.vhdl</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1429204369.1C4Cc321.2165--

--===============0024304605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0024304605==--
