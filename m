From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] New: Amilo Xi 3650: G96M [GeForce 9600M GT]:
 HDMI monitor stays black after s2ram
Date: Wed, 27 Jan 2016 16:00:53 +0000
Message-ID: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0973422462=="
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


--===============0973422462==
Content-Type: multipart/alternative; boundary="14539104530.EF71.17598";
 charset="UTF-8"


--14539104530.EF71.17598
Date: Wed, 27 Jan 2016 16:00:53 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

            Bug ID: 93887
           Summary: Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor
                    stays black after s2ram
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When my machine awakes from 'systemctl suspend' my integrated LVDS display
comes up fine while an external HDMI monitor stays black with 'no signal'. As
far as tested the VGA output of my G96M will resume without a problem.
  I have tested the following kernel parameters in addition to a plain boot
with nouveau.hdmimhz=225:
* acpi_sleep=s3=bios: resumes well but HDMI stays without a signal
* acpi_sleep=s3_mode: crash on resume with total blackscreen of LVDS as well as
HDMI, a hard reset is the only way out.
* acpi_sleep=s3_bios,s3_mode: same as s3_mode

kernel version: 4.5.0-rc1-ARCH #2 SMP
nouveau version of the Arch package: 1.0.12-1

  Is there anything else I can try or do?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14539104530.EF71.17598
Date: Wed, 27 Jan 2016 16:00:53 +0000
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
   title="NEW - Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">93887</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram
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
          <td>estellnb&#64;elstel.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When my machine awakes from 'systemctl suspend' my integrated LVDS display
comes up fine while an external HDMI monitor stays black with 'no signal'. As
far as tested the VGA output of my G96M will resume without a problem.
  I have tested the following kernel parameters in addition to a plain boot
with nouveau.hdmimhz=225:
* acpi_sleep=s3=bios: resumes well but HDMI stays without a signal
* acpi_sleep=s3_mode: crash on resume with total blackscreen of LVDS as well as
HDMI, a hard reset is the only way out.
* acpi_sleep=s3_bios,s3_mode: same as s3_mode

kernel version: 4.5.0-rc1-ARCH #2 SMP
nouveau version of the Arch package: 1.0.12-1

  Is there anything else I can try or do?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14539104530.EF71.17598--

--===============0973422462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0973422462==--
