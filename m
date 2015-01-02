From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87983] New: nouveau E[Xorg.bin[1119]] failed to idle
 channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)
Date: Fri, 02 Jan 2015 22:16:44 +0000
Message-ID: <bug-87983-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0064078804=="
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


--===============0064078804==
Content-Type: multipart/alternative; boundary="1420237004.3fbebb381.23040"; charset="UTF-8"


--1420237004.3fbebb381.23040
Date: Fri, 2 Jan 2015 22:16:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87983

            Bug ID: 87983
           Summary: nouveau E[Xorg.bin[1119]] failed to idle channel
                    0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bofh666-RbZlAiThDcE@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 111673
  --> https://bugs.freedesktop.org/attachment.cgi?id=111673&action=edit
output of dmesg

After booting a system with Fedora 21 the screen does not switch to graphics
mode on start of kde and keeps displaying the last lines of the text mode boot
log.
Switching to a text console using alt-Fn key combinations does not work.
System is otherwise working, using ssh to log in remotely works.

Last line from noueveau in dmesg shows it failed in nouveau_channel_idle:
[   54.068008] nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001
[Xorg.bin[1119]]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420237004.3fbebb381.23040
Date: Fri, 2 Jan 2015 22:16:44 +0000
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
   title="NEW - nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983">87983</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001 on G86 [GeForce 8500 GT] (rev a1)
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
          <td>critical
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
          <td>bofh666&#64;gmx.at
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111673" name="attach_111673" title="output of dmesg">attachment 111673</a> <a href="attachment.cgi?id=111673&amp;action=edit" title="output of dmesg">[details]</a></span>
output of dmesg

After booting a system with Fedora 21 the screen does not switch to graphics
mode on start of kde and keeps displaying the last lines of the text mode boot
log.
Switching to a text console using alt-Fn key combinations does not work.
System is otherwise working, using ssh to log in remotely works.

Last line from noueveau in dmesg shows it failed in nouveau_channel_idle:
[   54.068008] nouveau E[Xorg.bin[1119]] failed to idle channel 0xcccc0001
[Xorg.bin[1119]]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420237004.3fbebb381.23040--

--===============0064078804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0064078804==--
