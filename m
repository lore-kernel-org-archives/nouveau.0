From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] New: [NVAC] EQ overflowing
Date: Mon, 29 Dec 2014 05:52:54 +0000
Message-ID: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1412080573=="
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


--===============1412080573==
Content-Type: multipart/alternative; boundary="1419832374.1AAD02B0.6970"; charset="UTF-8"


--1419832374.1AAD02B0.6970
Date: Mon, 29 Dec 2014 05:52:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

            Bug ID: 87819
           Summary: [NVAC] EQ overflowing
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: eurbah-GANU6spQydw@public.gmane.org

Created attachment 111450
  --> https://bugs.freedesktop.org/attachment.cgi?id=111450&action=edit
Xorg.0.log for X freeze with nouveau from linux-3.19.0-rc2

Normally, I am using Ubuntu utopic (14.10), where module 'nouveau'
systematically crashes after a few minutes, whereas module nvidia from
nvidia-331-updates crashes only after several hours of work.

So, I have filed https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396840

Inside this Ubuntu bug, Christopher M. Penalver (penalvch) asked me to ensure
the issue is reproducible with the latest mainline kernel.

Currently, this latest mainline kernel is 'linux-3.19.0-rc2'.
With Cinnamon and Firefox, this kernel quickly froze with 'Xorg.0.log'
complaining 'EQ overflowing'.

Inside 'Xorg.0.log', I found :
-  Module nouveau: vendor="X.Org Foundation" compiled for 1.16.0, module
version = 1.0.11
-  'AIGLX: enabled GLX_MESA_copy_sub_buffer'.
So I guess that the 'nouveau' module embedded in 'linux-3.19.0-rc2' is a 3D
driver from the 'Mesa' product (but I am NOT completely sure).

Anyway, I a trying to attach here :

-  Xorg.0.log,

-  kern.log, restricted to 'linux-3.19.0-rc2', with 'Loglevel set to 1' and
'SysRq : Show State'.

I hope that these log files will be useful.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419832374.1AAD02B0.6970
Date: Mon, 29 Dec 2014 05:52:54 +0000
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
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">87819</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAC] EQ overflowing
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
          <td>eurbah&#64;free.fr
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=111450" name="attach_111450" title="Xorg.0.log for X freeze with nouveau from linux-3.19.0-rc2">attachment 111450</a> <a href="attachment.cgi?id=111450&amp;action=edit" title="Xorg.0.log for X freeze with nouveau from linux-3.19.0-rc2">[details]</a></span>
Xorg.0.log for X freeze with nouveau from linux-3.19.0-rc2

Normally, I am using Ubuntu utopic (14.10), where module 'nouveau'
systematically crashes after a few minutes, whereas module nvidia from
nvidia-331-updates crashes only after several hours of work.

So, I have filed <a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396840">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396840</a>

Inside this Ubuntu bug, Christopher M. Penalver (penalvch) asked me to ensure
the issue is reproducible with the latest mainline kernel.

Currently, this latest mainline kernel is 'linux-3.19.0-rc2'.
With Cinnamon and Firefox, this kernel quickly froze with 'Xorg.0.log'
complaining 'EQ overflowing'.

Inside 'Xorg.0.log', I found :
-  Module nouveau: vendor=&quot;X.Org Foundation&quot; compiled for 1.16.0, module
version = 1.0.11
-  'AIGLX: enabled GLX_MESA_copy_sub_buffer'.
So I guess that the 'nouveau' module embedded in 'linux-3.19.0-rc2' is a 3D
driver from the 'Mesa' product (but I am NOT completely sure).

Anyway, I a trying to attach here :

-  Xorg.0.log,

-  kern.log, restricted to 'linux-3.19.0-rc2', with 'Loglevel set to 1' and
'SysRq : Show State'.

I hope that these log files will be useful.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419832374.1AAD02B0.6970--

--===============1412080573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1412080573==--
