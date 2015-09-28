From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92171] New: Reboot causes nouveau corruption/ghosting
Date: Mon, 28 Sep 2015 23:01:23 +0000
Message-ID: <bug-92171-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1974742332=="
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


--===============1974742332==
Content-Type: multipart/alternative; boundary="1443481283.312C41.18276"; charset="UTF-8"


--1443481283.312C41.18276
Date: Mon, 28 Sep 2015 23:01:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92171

            Bug ID: 92171
           Summary: Reboot causes nouveau corruption/ghosting
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pure.logic-SyKdqv6vbfZdzvEItQ6vdLNAH6kLmebB@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118503
  --> https://bugs.freedesktop.org/attachment.cgi?id=118503&action=edit
dmesg-4.3.0-rc1-broken

Running kernel 4.3-rcX I can usually boot to a good nouveau session, however if
I reboot the system the display is squashed and ghosted across the screen.

I have a capture of the kernel log showing a FIFO that has failed to reset.
Rebooting again doesn't clear the error - nor does shutting down and starting
again - I typically need to go and boot an older kernel ubuntu
3.13.0-58-generic in this case. I haven't tested shutting down the system for a
prolonged period after the corruption yet.

Attached is the kernel log of

dmesg-4.3.0-rc1.txt (totally broken both screens)
dmesg-4.3.0-rc3.txt (totally broken both screens)
dmesg-4.3.0-rc3-onescreen-good.txt (totally broken on one screen)

Also note this error is readily replicated with one screen present - the laptop
display. I'll attach a dump of that too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443481283.312C41.18276
Date: Mon, 28 Sep 2015 23:01:23 +0000
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
   title="NEW - Reboot causes nouveau corruption/ghosting"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92171">92171</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Reboot causes nouveau corruption/ghosting
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
          <td>pure.logic&#64;nexus-software.ie
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118503" name="attach_118503" title="dmesg-4.3.0-rc1-broken">attachment 118503</a> <a href="attachment.cgi?id=118503&amp;action=edit" title="dmesg-4.3.0-rc1-broken">[details]</a></span>
dmesg-4.3.0-rc1-broken

Running kernel 4.3-rcX I can usually boot to a good nouveau session, however if
I reboot the system the display is squashed and ghosted across the screen.

I have a capture of the kernel log showing a FIFO that has failed to reset.
Rebooting again doesn't clear the error - nor does shutting down and starting
again - I typically need to go and boot an older kernel ubuntu
3.13.0-58-generic in this case. I haven't tested shutting down the system for a
prolonged period after the corruption yet.

Attached is the kernel log of

dmesg-4.3.0-rc1.txt (totally broken both screens)
dmesg-4.3.0-rc3.txt (totally broken both screens)
dmesg-4.3.0-rc3-onescreen-good.txt (totally broken on one screen)

Also note this error is readily replicated with one screen present - the laptop
display. I'll attach a dump of that too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443481283.312C41.18276--

--===============1974742332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1974742332==--
