From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91992] New: [NV4C] computer hangs after few minutes
	of use
Date: Sun, 13 Sep 2015 14:50:30 +0000
Message-ID: <bug-91992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0335808413=="
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


--===============0335808413==
Content-Type: multipart/alternative; boundary="1442155830.eCdC00.5195"; charset="UTF-8"


--1442155830.eCdC00.5195
Date: Sun, 13 Sep 2015 14:50:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91992

            Bug ID: 91992
           Summary: [NV4C] computer hangs after few minutes of use
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: laurent.riffard+freedesktop-GANU6spQydw@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 118238
  --> https://bugs.freedesktop.org/attachment.cgi?id=118238&action=edit
dmesg (ArchLinux)

Hello,

After few minutes (3 to 15) of use, the display freezes. 
1 or 2 seconds later, the screen is filled at once with repeated noise small
pattern. Then, display is frozen, no reaction at all to key presses or mouse.
NumLock etc. keyboard lights do not react. Ssh-connection dies. Machine does
not respond to ping. SysRq-keys cannot sync disks. Logs are not written to
disk. SysRq-keys (SysRq-reboot) do not work at all. Have to press reset button. 

The video card is NVIDIA Corporation C61 [GeForce 7025 / nForce 630a].

It does happen with 2 distros : ArchLinux and Ubuntu 15.04. The freeze is best
triggered by lauching LibreOffice or Firefox.

Adding nouveau.config=NvMSI=0 kernel parameter does not help.

Thanks
~~
laurent

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442155830.eCdC00.5195
Date: Sun, 13 Sep 2015 14:50:30 +0000
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
   title="NEW - [NV4C] computer hangs after few minutes of use"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91992">91992</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV4C] computer hangs after few minutes of use
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>laurent.riffard+freedesktop&#64;free.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118238" name="attach_118238" title="dmesg (ArchLinux)">attachment 118238</a> <a href="attachment.cgi?id=118238&amp;action=edit" title="dmesg (ArchLinux)">[details]</a></span>
dmesg (ArchLinux)

Hello,

After few minutes (3 to 15) of use, the display freezes. 
1 or 2 seconds later, the screen is filled at once with repeated noise small
pattern. Then, display is frozen, no reaction at all to key presses or mouse.
NumLock etc. keyboard lights do not react. Ssh-connection dies. Machine does
not respond to ping. SysRq-keys cannot sync disks. Logs are not written to
disk. SysRq-keys (SysRq-reboot) do not work at all. Have to press reset button. 

The video card is NVIDIA Corporation C61 [GeForce 7025 / nForce 630a].

It does happen with 2 distros : ArchLinux and Ubuntu 15.04. The freeze is best
triggered by lauching LibreOffice or Firefox.

Adding nouveau.config=NvMSI=0 kernel parameter does not help.

Thanks
~~
laurent</pre>
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

--1442155830.eCdC00.5195--

--===============0335808413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0335808413==--
