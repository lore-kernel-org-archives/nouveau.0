From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92761] New: dmesg full of nouveau E[
 PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)
Date: Sat, 31 Oct 2015 23:48:38 +0000
Message-ID: <bug-92761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1133486171=="
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


--===============1133486171==
Content-Type: multipart/alternative; boundary="1446335318.dE44C3AB1.26994"; charset="UTF-8"


--1446335318.dE44C3AB1.26994
Date: Sat, 31 Oct 2015 23:48:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92761

            Bug ID: 92761
           Summary: dmesg full of nouveau E[   PIBUS][0000:01:00.0] GPC4:
                    0x5233e4 0xbadf1301 (0x01024215)
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ascanio.alba7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 119321
  --> https://bugs.freedesktop.org/attachment.cgi?id=119321&action=edit
dmesg output

1. nouveau on Fedora 23
2. dmesg is full of 
[68759.141891] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.161134] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.172614] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.172695] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.279172] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.293372] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.305836] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.305903] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.470585] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.474667] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
3. kernel 4.2.3-300.fc23.x86_64
4. xorg-x11-drv-nouveau-1.0.12-0.3.fc23.x86_64
5. 01:00.0 VGA compatible controller: NVIDIA Corporation GK110 [GeForce GTX
780] (rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446335318.dE44C3AB1.26994
Date: Sat, 31 Oct 2015 23:48:38 +0000
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
   title="NEW - dmesg full of nouveau E[ PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92761">92761</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>dmesg full of nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301 (0x01024215)
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
          <td>Other
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
          <td>ascanio.alba7&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=119321" name="attach_119321" title="dmesg output">attachment 119321</a> <a href="attachment.cgi?id=119321&amp;action=edit" title="dmesg output">[details]</a></span>
dmesg output

1. nouveau on Fedora 23
2. dmesg is full of 
[68759.141891] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.161134] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.172614] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.172695] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.279172] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.293372] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.305836] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.305903] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.470585] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
[68759.474667] nouveau E[   PIBUS][0000:01:00.0] GPC4: 0x5233e4 0xbadf1301
(0x01024215)
3. kernel 4.2.3-300.fc23.x86_64
4. xorg-x11-drv-nouveau-1.0.12-0.3.fc23.x86_64
5. 01:00.0 VGA compatible controller: NVIDIA Corporation GK110 [GeForce GTX
780] (rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446335318.dE44C3AB1.26994--

--===============1133486171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1133486171==--
