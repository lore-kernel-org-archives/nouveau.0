From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93896] New: Nvidia GeForce GTX 970M unsupported,
 no backlight control
Date: Thu, 28 Jan 2016 06:36:44 +0000
Message-ID: <bug-93896-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0685294276=="
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


--===============0685294276==
Content-Type: multipart/alternative; boundary="14539630040.D96fFd.21763";
 charset="UTF-8"


--14539630040.D96fFd.21763
Date: Thu, 28 Jan 2016 06:36:44 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93896

            Bug ID: 93896
           Summary: Nvidia GeForce GTX 970M unsupported, no backlight
                    control
           Product: Mesa
           Version: 11.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jvoss-Cpl0xJrrQRvQT0dZR+AlfA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 121344
  --> https://bugs.freedesktop.org/attachment.cgi?id=121344&action=edit
Video BIOS

The driver cannot load the firmware nvidia/gm204/fecs_inst.bin.
Xorg won't load the nouveau driver because Unknown chipset: NV124.
The backlight does not work.

The following commands have no affect on the brightness:
echo 2 |sudo tee /sys/class/backlight/acpi_video0/brightness
echo 10 |sudo tee /sys/class/backlight/acpi_video0/brightness

Brightness works with the proprietary nvidia driver.

If mmiotrace logs are beneficial, I will add them.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
--14539630040.D96fFd.21763
Date: Thu, 28 Jan 2016 06:36:44 +0000
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
   title="NEW - Nvidia GeForce GTX 970M unsupported, no backlight control"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93896">93896</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nvidia GeForce GTX 970M unsupported, no backlight control
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.0
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
          <td>jvoss&#64;altsci.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=121344" name="attach_121344" title="Video BIOS">attachment 121344</a> <a href="attachment.cgi?id=121344&amp;action=edit" title="Video BIOS">[details]</a></span>
Video BIOS

The driver cannot load the firmware nvidia/gm204/fecs_inst.bin.
Xorg won't load the nouveau driver because Unknown chipset: NV124.
The backlight does not work.

The following commands have no affect on the brightness:
echo 2 |sudo tee /sys/class/backlight/acpi_video0/brightness
echo 10 |sudo tee /sys/class/backlight/acpi_video0/brightness

Brightness works with the proprietary nvidia driver.

If mmiotrace logs are beneficial, I will add them.</pre>
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
--14539630040.D96fFd.21763--

--===============0685294276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0685294276==--
