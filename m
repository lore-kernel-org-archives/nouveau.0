From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90482] New: Xorg take 100% CPU when using multiple
 independent screen configuration
Date: Sat, 16 May 2015 15:14:07 +0000
Message-ID: <bug-90482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1440578306=="
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


--===============1440578306==
Content-Type: multipart/alternative; boundary="1431789247.E5c2DEf1.22120"; charset="UTF-8"


--1431789247.E5c2DEf1.22120
Date: Sat, 16 May 2015 15:14:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90482

            Bug ID: 90482
           Summary: Xorg take 100% CPU when using multiple independent
                    screen configuration
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dura-PlyTytoxC32F389P3+uynUB+6BGkLq7r@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 115835
  --> https://bugs.freedesktop.org/attachment.cgi?id=115835&action=edit
my xorg.conf

My xorg setup is based on two independent screen (see attached xorg.conf). Most
of the time the Xorg process eat 100% of one CPU core.

I will try to explain what I think is the problem and the fix (or workaround) I
made to the nouveau code.

Basically, the problem is that nouveau add a socket to the xorg socket list but
does not register a handler that will be able to deal with it. When data is
received on this socket the Select call in xorg-server/os/WaitFor.c will return
but the data will not be read. When Select is called again it returns
immediately because data was not read, and again, and again, resulting in 100%
CPU core consumption.

Now, some details (based on xf86-video-nouveau-1.0.11 source code)
To add a socket in the xorg server list AddGeneralSocket is used.
In src/drmmode_display.c AddGeneralSocket is called in two places: line 1605
(via drmmode_uevent_init and line 1554) and 1610. If line 1608 condition is not
meet, a socket is added without an handler so drmmode_wakeup_handler will never
be called with correct data.

My solution is to add a new handler that will only handle the udev part when
line 1608 condition is not meet. See attached patch.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431789247.E5c2DEf1.22120
Date: Sat, 16 May 2015 15:14:07 +0000
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
   title="NEW - Xorg take 100% CPU when using multiple independent screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90482">90482</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg take 100% CPU when using multiple independent screen configuration
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
          <td>dura&#64;duradsl.duckdns.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=115835" name="attach_115835" title="my xorg.conf">attachment 115835</a> <a href="attachment.cgi?id=115835&amp;action=edit" title="my xorg.conf">[details]</a></span>
my xorg.conf

My xorg setup is based on two independent screen (see attached xorg.conf). Most
of the time the Xorg process eat 100% of one CPU core.

I will try to explain what I think is the problem and the fix (or workaround) I
made to the nouveau code.

Basically, the problem is that nouveau add a socket to the xorg socket list but
does not register a handler that will be able to deal with it. When data is
received on this socket the Select call in xorg-server/os/WaitFor.c will return
but the data will not be read. When Select is called again it returns
immediately because data was not read, and again, and again, resulting in 100%
CPU core consumption.

Now, some details (based on xf86-video-nouveau-1.0.11 source code)
To add a socket in the xorg server list AddGeneralSocket is used.
In src/drmmode_display.c AddGeneralSocket is called in two places: line 1605
(via drmmode_uevent_init and line 1554) and 1610. If line 1608 condition is not
meet, a socket is added without an handler so drmmode_wakeup_handler will never
be called with correct data.

My solution is to add a new handler that will only handle the udev part when
line 1608 condition is not meet. See attached patch.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431789247.E5c2DEf1.22120--

--===============1440578306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1440578306==--
