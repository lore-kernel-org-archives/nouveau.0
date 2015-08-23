From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] New: xf86-video-nouveau 1.0.11 will not allow
	X to start
Date: Sun, 23 Aug 2015 19:00:34 +0000
Message-ID: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0902030791=="
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


--===============0902030791==
Content-Type: multipart/alternative; boundary="1440356434.0B261.10381"; charset="UTF-8"


--1440356434.0B261.10381
Date: Sun, 23 Aug 2015 19:00:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

            Bug ID: 91738
           Summary: xf86-video-nouveau 1.0.11 will not allow X to start
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ryan.q-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 117881
  --> https://bugs.freedesktop.org/attachment.cgi?id=117881&action=edit
dmesg_before_startx

Host machine is Slackware64-current.

- xf86-video-nouveau 1.0.11
- xorg-server 1.17.2
- Linux 4.1.6

X is unable to start from what appears to be a block by nouveau. Blacklisting
nouveau in /etc/modprobe.d/nouveau.conf like so:

    blacklist nouveau

results in a kernel panic. See attached dmesg and Xorg.0.log. Forgive me if I
am reporting this bug in the wrong place.

Thank you.


dmesg:
http://sprunge.us/fNHi

Xorg.0.log
http://sprunge.us/XhRO

dmesg after startx:
http://sprunge.us/gEdV

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440356434.0B261.10381
Date: Sun, 23 Aug 2015 19:00:34 +0000
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
   title="NEW - xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">91738</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xf86-video-nouveau 1.0.11 will not allow X to start
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
          <td>major
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
          <td>ryan.q&#64;linux.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=117881" name="attach_117881" title="dmesg_before_startx">attachment 117881</a> <a href="attachment.cgi?id=117881&amp;action=edit" title="dmesg_before_startx">[details]</a></span>
dmesg_before_startx

Host machine is Slackware64-current.

- xf86-video-nouveau 1.0.11
- xorg-server 1.17.2
- Linux 4.1.6

X is unable to start from what appears to be a block by nouveau. Blacklisting
nouveau in /etc/modprobe.d/nouveau.conf like so:

    blacklist nouveau

results in a kernel panic. See attached dmesg and Xorg.0.log. Forgive me if I
am reporting this bug in the wrong place.

Thank you.


dmesg:
<a href="http://sprunge.us/fNHi">http://sprunge.us/fNHi</a>

Xorg.0.log
<a href="http://sprunge.us/XhRO">http://sprunge.us/XhRO</a>

dmesg after startx:
<a href="http://sprunge.us/gEdV">http://sprunge.us/gEdV</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440356434.0B261.10381--

--===============0902030791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0902030791==--
