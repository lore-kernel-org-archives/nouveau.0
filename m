From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103896] New: [optimus, reverse PRIME] no HDMI audio
Date: Fri, 24 Nov 2017 21:39:55 +0000
Message-ID: <bug-103896-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0896709359=="
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


--===============0896709359==
Content-Type: multipart/alternative; boundary="15115595960.e1EFeb17.30783";
 charset="UTF-8"


--15115595960.e1EFeb17.30783
Date: Fri, 24 Nov 2017 21:39:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103896

            Bug ID: 103896
           Summary: [optimus, reverse PRIME] no HDMI audio
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: post+fdo-8yesU2pFZgY@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I have a Lenovo P50 which contains an NVIDIA Quadro M2000M in reverse PRIME
configuration: The HDMI port is connected to the NVidia card.  While gettin=
g an
image onto the HDMI port works just fine, there is no audio.

I asked about this on IRC, the logs are at
<https://people.freedesktop.org/~cbrill/dri-log/index.php?channel=3Dnouveau=
&highlight_names=3D&date=3D2017-11-24#t-2034>.
 The summary is that I tried running the following script (after stopping X=
):

rmmod nouveau
setpci -s 01:00.0 0x488.l=3D0x2000000:0x2000000
echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove
#echo 1 > /sys/bus/pci/devices/0000:00:01.0/rescan
echo 1 > /sys/bus/pci/rescan
modprobe nouveau

But that did not help.  I then started X again, and lspci still shows only

$ sudo lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GLM [Quad=
ro
M2000M] [10de:13b0] (rev a2)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15115595960.e1EFeb17.30783
Date: Fri, 24 Nov 2017 21:39:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [optimus, reverse PRIME] no HDMI audio"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103896">103896</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[optimus, reverse PRIME] no HDMI audio
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>post+fdo&#64;ralfj.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a Lenovo P50 which contains an NVIDIA Quadro M2000M in =
reverse PRIME
configuration: The HDMI port is connected to the NVidia card.  While gettin=
g an
image onto the HDMI port works just fine, there is no audio.

I asked about this on IRC, the logs are at
&lt;<a href=3D"https://people.freedesktop.org/~cbrill/dri-log/index.php?cha=
nnel=3Dnouveau&amp;highlight_names=3D&amp;date=3D2017-11-24#t-2034">https:/=
/people.freedesktop.org/~cbrill/dri-log/index.php?channel=3Dnouveau&amp;hig=
hlight_names=3D&amp;date=3D2017-11-24#t-2034</a>&gt;.
 The summary is that I tried running the following script (after stopping X=
):

rmmod nouveau
setpci -s 01:00.0 0x488.l=3D0x2000000:0x2000000
echo 1 &gt; /sys/bus/pci/devices/0000:01:00.0/remove
#echo 1 &gt; /sys/bus/pci/devices/0000:00:01.0/rescan
echo 1 &gt; /sys/bus/pci/rescan
modprobe nouveau

But that did not help.  I then started X again, and lspci still shows only

$ sudo lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GLM [Quad=
ro
M2000M] [10de:13b0] (rev a2)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15115595960.e1EFeb17.30783--

--===============0896709359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0896709359==--
