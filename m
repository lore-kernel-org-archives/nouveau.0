From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63135] New: [bisected] G69/nv50 DisplayPort
 dual-head fails to switch to KMS
Date: Thu, 04 Apr 2013 21:17:19 +0000
Message-ID: <bug-63135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1107141105=="
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


--===============1107141105==
Content-Type: multipart/alternative; boundary="1365110239.3DdFf1.9628"; charset="us-ascii"


--1365110239.3DdFf1.9628
Date: Thu, 4 Apr 2013 21:17:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63135

          Priority: medium
            Bug ID: 63135
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [bisected] G69/nv50 DisplayPort dual-head fails to
                    switch to KMS
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: djpohly+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 77445
  --> https://bugs.freedesktop.org/attachment.cgi?id=77445&action=edit
systemd journal with kernel messages

Hardware: NVIDIA Corporation G96 [Quadro FX 580] (rev a1)
Distro: Arch Linux
Bisected commit:
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=2c1a425e7d537ea655fa276f267c0b1cd100ff34

Steps to reproduce:
1. Boot system into text mode with normal kernel parameters.
2. Wait for module to load and attempt KMS.

Expected behavior:
3. KMS succeeds, login prompt appears.

Actual behavior:
3. System locks up and monitors go into power-saving mode.

More info:
* With nouveau.modeset=0, system boots normally.
* Was able to use SysRq to sync disks after hang but could not ssh, ping, or
reboot.
* Regression still present in current nvidia-git (db1b0f52) as well as
kernel.org git.
* nvidia module is not installed.

lspci.log and vbios.rom forthcoming.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1365110239.3DdFf1.9628
Date: Thu, 4 Apr 2013 21:17:19 +0000
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
   title="NEW --- - [bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63135">63135</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[bisected] G69/nv50 DisplayPort dual-head fails to switch to KMS
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
          <td>djpohly+freedesktop&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=77445" name="attach_77445" title="systemd journal with kernel messages">attachment 77445</a> <a href="attachment.cgi?id=77445&amp;action=edit" title="systemd journal with kernel messages">[details]</a></span>
systemd journal with kernel messages

Hardware: NVIDIA Corporation G96 [Quadro FX 580] (rev a1)
Distro: Arch Linux
Bisected commit:
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=2c1a425e7d537ea655fa276f267c0b1cd100ff34">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=2c1a425e7d537ea655fa276f267c0b1cd100ff34</a>

Steps to reproduce:
1. Boot system into text mode with normal kernel parameters.
2. Wait for module to load and attempt KMS.

Expected behavior:
3. KMS succeeds, login prompt appears.

Actual behavior:
3. System locks up and monitors go into power-saving mode.

More info:
* With nouveau.modeset=0, system boots normally.
* Was able to use SysRq to sync disks after hang but could not ssh, ping, or
reboot.
* Regression still present in current nvidia-git (db1b0f52) as well as
kernel.org git.
* nvidia module is not installed.

lspci.log and vbios.rom forthcoming.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1365110239.3DdFf1.9628--

--===============1107141105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1107141105==--
