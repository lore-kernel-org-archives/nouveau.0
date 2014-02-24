From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75447] New: Secondary gpu is not enabled if nouveau
 is loaded from initrd/initramfs
Date: Mon, 24 Feb 2014 14:46:20 +0000
Message-ID: <bug-75447-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0615130404=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0615130404==
Content-Type: multipart/alternative; boundary="1393253180.cF55CDB81.22570"; charset="us-ascii"


--1393253180.cF55CDB81.22570
Date: Mon, 24 Feb 2014 14:46:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75447

          Priority: medium
            Bug ID: 75447
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Secondary gpu is not enabled if nouveau is loaded from
                    initrd/initramfs
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: support.intranet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 94656
  --> https://bugs.freedesktop.org/attachment.cgi?id=94656&action=edit
Working dmesg (nouveau not in initramfs)

When the nouveau kernel module is embedded in the initramfs (as in ubuntu
14.04), Xorg fails to start on the secondary GPU. The DRM appears to correctly
initialize both cards (see attahced logs), but the monitor connected to the
secondary one never comes up. Apart from removing the module from the
initramfs, a workaround is to stop X and execute at the terminal:

echo 0 > /sys/class/vtconsole/vtcon1/bind
rmmod nouveau
modprobe nouveau

and restart X.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393253180.cF55CDB81.22570
Date: Mon, 24 Feb 2014 14:46:20 +0000
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
   title="NEW --- - Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75447">75447</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Secondary gpu is not enabled if nouveau is loaded from initrd/initramfs
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
          <td>support.intranet&#64;libero.it
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
          <td>unspecified
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
        <pre>Created <span class=""><a href="attachment.cgi?id=94656" name="attach_94656" title="Working dmesg (nouveau not in initramfs)">attachment 94656</a> <a href="attachment.cgi?id=94656&amp;action=edit" title="Working dmesg (nouveau not in initramfs)">[details]</a></span>
Working dmesg (nouveau not in initramfs)

When the nouveau kernel module is embedded in the initramfs (as in ubuntu
14.04), Xorg fails to start on the secondary GPU. The DRM appears to correctly
initialize both cards (see attahced logs), but the monitor connected to the
secondary one never comes up. Apart from removing the module from the
initramfs, a workaround is to stop X and execute at the terminal:

echo 0 &gt; /sys/class/vtconsole/vtcon1/bind
rmmod nouveau
modprobe nouveau

and restart X.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393253180.cF55CDB81.22570--

--===============0615130404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0615130404==--
