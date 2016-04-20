From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95031] New: [NVE4] Random GPU lockups
Date: Wed, 20 Apr 2016 07:44:15 +0000
Message-ID: <bug-95031-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1172381523=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1172381523==
Content-Type: multipart/alternative; boundary="14611382550.4Fef.18358";
 charset="UTF-8"


--14611382550.4Fef.18358
Date: Wed, 20 Apr 2016 07:44:15 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95031

            Bug ID: 95031
           Summary: [NVE4] Random GPU lockups
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: lucasout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 123085
  --> https://bugs.freedesktop.org/attachment.cgi?id=123085&action=edit
nouveau bugs

Having random lockups on a GTX 660 Ti (NVE4), since kernel 4.1 I guess, using
DRI2.
[    0.267666] nouveau 0000:02:00.0: NVIDIA GK104 (0e4030a2)
[    0.378583] nouveau 0000:02:00.0: bios: version 80.04.4b.00.1a
[    0.379302] nouveau 0000:02:00.0: fb: 2048 MiB GDDR5

Now on gentoo ~amd64 using:

sys-kernel/gentoo-sources-4.5.1
x11-base/xorg-server-1.18.3
x11-drivers/xf86-video-nouveau-1.0.12

Also tried Karol Herbst reclocking branch v4
(https://github.com/karolherbst/nouveau/tree/stable_reclocking_kepler_v4),
reclocked to pstate 07 and tried all 3 boost states. All hang sooner or later.

Will continue testing other pstates and boost configurations.

Sometimes the kernel log becomes corrupted, but I managed to get a working log
(attached).

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14611382550.4Fef.18358
Date: Wed, 20 Apr 2016 07:44:15 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Random GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95031">95031</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] Random GPU lockups
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
          <td>lucasout&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=123085" name="attach_123085" title="nouveau bugs">attachment 123085</a> <a href="attachment.cgi?id=123085&amp;action=edit" title="nouveau bugs">[details]</a></span>
nouveau bugs

Having random lockups on a GTX 660 Ti (NVE4), since kernel 4.1 I guess, using
DRI2.
[    0.267666] nouveau 0000:02:00.0: NVIDIA GK104 (0e4030a2)
[    0.378583] nouveau 0000:02:00.0: bios: version 80.04.4b.00.1a
[    0.379302] nouveau 0000:02:00.0: fb: 2048 MiB GDDR5

Now on gentoo ~amd64 using:

sys-kernel/gentoo-sources-4.5.1
x11-base/xorg-server-1.18.3
x11-drivers/xf86-video-nouveau-1.0.12

Also tried Karol Herbst reclocking branch v4
(<a href="https://github.com/karolherbst/nouveau/tree/stable_reclocking_kepler_v4">https://github.com/karolherbst/nouveau/tree/stable_reclocking_kepler_v4</a>),
reclocked to pstate 07 and tried all 3 boost states. All hang sooner or later.

Will continue testing other pstates and boost configurations.

Sometimes the kernel log becomes corrupted, but I managed to get a working log
(attached).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14611382550.4Fef.18358--

--===============1172381523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1172381523==--
