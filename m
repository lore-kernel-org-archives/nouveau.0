From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90682] New: failed to idle channel 0xcccc0001 then
	crash
Date: Wed, 27 May 2015 14:30:03 +0000
Message-ID: <bug-90682-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1410028296=="
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


--===============1410028296==
Content-Type: multipart/alternative; boundary="1432737003.2233Bf01.4991"; charset="UTF-8"


--1432737003.2233Bf01.4991
Date: Wed, 27 May 2015 14:30:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90682

            Bug ID: 90682
           Summary: failed to idle channel 0xcccc0001 then crash
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: thomas-jC2YvWITRxqtmTQ+vhA3Yw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 116084
  --> https://bugs.freedesktop.org/attachment.cgi?id=116084&action=edit
dmesg captured with kdump

Hi,

My Lenovo W540 started crashing when I upgraded from Linux 3.14 to 3.16 in Sept
2014. I continued to use 3.14 and I did nothing till last week when I tried
Linux 4.0 (from sid) which kept crashing soon after logging in to GNOME 3. I
EFI boot to grub and use GRUB_GFXPAYLOAD_LINUX=keep. Then use KMS and Plymouth
till GDM, X.Org and GNOME3. When it crashed the mouse and keyboard no longer
did anything (ie Ctrl-Alt-F1 did not work) and the laptop appeared to drop off
the network. 

When I boot with Linux 4.0 and login to GNOME 3, it would crash within minutes,
but sometimes an hour. I manually compiled 3.15, 3.16, 3.17, 3.18, 3.19 and 4.0
which all had various issues: the external monitor resolution was broken on
3.15, 3.16 seemed ok, but 3.17, 3.18, 3.19 and 4.0 all seemed to crash soon
after boot.

I used kdump to capture a dump and dmesg and there was a message about nouveau:
[   76.792370] nouveau E[     DRM] failed to idle channel 0xcccc0001 [DRM]

Then 60 microseconds later a BUG:
[   76.792430] BUG: unable to handle kernel paging request at ffff8805660b7ffc
[   76.792455] IP: [<ffffffffa0406bf3>] evo_wait+0x53/0x120 [nouveau]

After a little googling I found out about the "nouveau.runpm=0" parameter. Once
I added this parameter and rebooted my laptop has worked fine with Linux 4.0.
However I have not tried that parameter in any previous kernels so am unsure
which release this workaround started working.

I'm now happy that I have a working system with working lcd screen brightness
controls and multi-stream transport monitors that work. However I don't want to
kill the laptops battery by permanently disabling the power management. I could
try bisecting, but with so many revisions I'm not sure what to mark good and
bad or if I should use runpm at all.

Anyway here are some Debian package versions and info:
linux-image-4.0.0-1-amd64       4.0.2-1
libdrm-nouveau2                 2.4.60-3
libgl1-mesa-glx                 10.5.5-1
xserver-xorg-video-nouveau      1:1.0.11-1+b1

$ lspci | grep -i VGA
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor
Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1)
$

Kind Regards
--
Tom

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432737003.2233Bf01.4991
Date: Wed, 27 May 2015 14:30:03 +0000
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
   title="NEW - failed to idle channel 0xcccc0001 then crash"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90682">90682</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>failed to idle channel 0xcccc0001 then crash
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
          <td>thomas&#64;stewarts.org.uk
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116084" name="attach_116084" title="dmesg captured with kdump">attachment 116084</a> <a href="attachment.cgi?id=116084&amp;action=edit" title="dmesg captured with kdump">[details]</a></span>
dmesg captured with kdump

Hi,

My Lenovo W540 started crashing when I upgraded from Linux 3.14 to 3.16 in Sept
2014. I continued to use 3.14 and I did nothing till last week when I tried
Linux 4.0 (from sid) which kept crashing soon after logging in to GNOME 3. I
EFI boot to grub and use GRUB_GFXPAYLOAD_LINUX=keep. Then use KMS and Plymouth
till GDM, X.Org and GNOME3. When it crashed the mouse and keyboard no longer
did anything (ie Ctrl-Alt-F1 did not work) and the laptop appeared to drop off
the network. 

When I boot with Linux 4.0 and login to GNOME 3, it would crash within minutes,
but sometimes an hour. I manually compiled 3.15, 3.16, 3.17, 3.18, 3.19 and 4.0
which all had various issues: the external monitor resolution was broken on
3.15, 3.16 seemed ok, but 3.17, 3.18, 3.19 and 4.0 all seemed to crash soon
after boot.

I used kdump to capture a dump and dmesg and there was a message about nouveau:
[   76.792370] nouveau E[     DRM] failed to idle channel 0xcccc0001 [DRM]

Then 60 microseconds later a BUG:
[   76.792430] BUG: unable to handle kernel paging request at ffff8805660b7ffc
[   76.792455] IP: [&lt;ffffffffa0406bf3&gt;] evo_wait+0x53/0x120 [nouveau]

After a little googling I found out about the &quot;nouveau.runpm=0&quot; parameter. Once
I added this parameter and rebooted my laptop has worked fine with Linux 4.0.
However I have not tried that parameter in any previous kernels so am unsure
which release this workaround started working.

I'm now happy that I have a working system with working lcd screen brightness
controls and multi-stream transport monitors that work. However I don't want to
kill the laptops battery by permanently disabling the power management. I could
try bisecting, but with so many revisions I'm not sure what to mark good and
bad or if I should use runpm at all.

Anyway here are some Debian package versions and info:
linux-image-4.0.0-1-amd64       4.0.2-1
libdrm-nouveau2                 2.4.60-3
libgl1-mesa-glx                 10.5.5-1
xserver-xorg-video-nouveau      1:1.0.11-1+b1

$ lspci | grep -i VGA
00:02.0 VGA compatible controller: Intel Corporation 4th Gen Core Processor
Integrated Graphics Controller (rev 06)
01:00.0 VGA compatible controller: NVIDIA Corporation GK106GLM [Quadro K2100M]
(rev a1)
$

Kind Regards
--
Tom</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432737003.2233Bf01.4991--

--===============1410028296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1410028296==--
