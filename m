From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91408] New: Lenovo T440s alternate way to turn off
	discrete GPU
Date: Mon, 20 Jul 2015 20:52:40 +0000
Message-ID: <bug-91408-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1278233317=="
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


--===============1278233317==
Content-Type: multipart/alternative; boundary="1437425560.7B56Be31.7991"; charset="UTF-8"


--1437425560.7B56Be31.7991
Date: Mon, 20 Jul 2015 20:52:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91408

            Bug ID: 91408
           Summary: Lenovo T440s alternate way to turn off discrete GPU
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tnt-fbwQZTTc70vQT0dZR+AlfA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The lenovo T440s BIOS handles the discret NVIDIA card power managemement
differently when the kernel advertise "Windows 2013" (since 3.15) or "Windows
2015" (since 4.2) OSI strings.

Calling the HSM then setting the device to D3 doesn't cause any errors and it
_does_ lower the power usage, but not as much as it should. (about 1W vs 2.5W
before 3.15). This means user might not notice the issue ...

Using acpi_osi="!Windows 2013" acpi_osi="!Windows 2015" in the kernel command
line does allow the old method to work, however the user needs to manually do
this and also new OSI strings keep being added in the kernel and so this might
silently re-break in the future.

The dump of the DSDT tables in the latest (as of today) BIOS of the T440s is
available there : http://pastebin.com/raw.php?i=C6Q3A8aa

The important changes to note when "Windows 2013" is in the osi string:
 - OSYS is set to 0x07DD.
 - This in turn cause VMSH to be set to 1.
 - This in turn causes _SB_.PCI0.PEG_.VID_.PS3 to _NOT call GPOF when the
device is set to D3.
 - and so the card is never really turned off completely

Now if you look at how GPOF can be called, you can see it will be called as
part of NVP3 power resource which is PR3 ... but on the node _SB.PCI0.PEG_ and
not _SB_.PCI0.PEG_.VID_ !

So this means that the parent PCIe root port the card is connected to needs to
be put in D3.

I did a quick hack using bumblebee (easier to try stuff out) to test and this
indeed seems to work. I was able to observe the 2.5W power drop as expected and
freely able to turn the card on & off.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437425560.7B56Be31.7991
Date: Mon, 20 Jul 2015 20:52:40 +0000
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
   title="NEW - Lenovo T440s alternate way to turn off discrete GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91408">91408</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Lenovo T440s alternate way to turn off discrete GPU
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
          <td>tnt&#64;246tnt.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The lenovo T440s BIOS handles the discret NVIDIA card power managemement
differently when the kernel advertise &quot;Windows 2013&quot; (since 3.15) or &quot;Windows
2015&quot; (since 4.2) OSI strings.

Calling the HSM then setting the device to D3 doesn't cause any errors and it
_does_ lower the power usage, but not as much as it should. (about 1W vs 2.5W
before 3.15). This means user might not notice the issue ...

Using acpi_osi=&quot;!Windows 2013&quot; acpi_osi=&quot;!Windows 2015&quot; in the kernel command
line does allow the old method to work, however the user needs to manually do
this and also new OSI strings keep being added in the kernel and so this might
silently re-break in the future.

The dump of the DSDT tables in the latest (as of today) BIOS of the T440s is
available there : <a href="http://pastebin.com/raw.php?i=C6Q3A8aa">http://pastebin.com/raw.php?i=C6Q3A8aa</a>

The important changes to note when &quot;Windows 2013&quot; is in the osi string:
 - OSYS is set to 0x07DD.
 - This in turn cause VMSH to be set to 1.
 - This in turn causes _SB_.PCI0.PEG_.VID_.PS3 to _NOT call GPOF when the
device is set to D3.
 - and so the card is never really turned off completely

Now if you look at how GPOF can be called, you can see it will be called as
part of NVP3 power resource which is PR3 ... but on the node _SB.PCI0.PEG_ and
not _SB_.PCI0.PEG_.VID_ !

So this means that the parent PCIe root port the card is connected to needs to
be put in D3.

I did a quick hack using bumblebee (easier to try stuff out) to test and this
indeed seems to work. I was able to observe the 2.5W power drop as expected and
freely able to turn the card on &amp; off.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437425560.7B56Be31.7991--

--===============1278233317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1278233317==--
