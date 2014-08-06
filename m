From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82255] New: [VP2] Chroma planes are vertically
 stretched during VDPAU playback
Date: Wed, 06 Aug 2014 16:24:37 +0000
Message-ID: <bug-82255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0628883368=="
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


--===============0628883368==
Content-Type: multipart/alternative; boundary="1407342277.bb1D60.23483"; charset="us-ascii"


--1407342277.bb1D60.23483
Date: Wed, 6 Aug 2014 16:24:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D82255

          Priority: medium
            Bug ID: 82255
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [VP2] Chroma planes are vertically stretched during
                    VDPAU playback
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 104158
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D104158&action=3Dedit
VDPAU_TRACE=3D1 vlc

Using VLC and flashplayer causes h264 video streams to be incorrectly rende=
red.
Both chroma planes are stretched and wrapped over vertically (x2) while the
luma plane seems correct.

Note: the issue does not appear with every h264 encoded clip and never happ=
ens
with mplayer (a bug in mplayer perhaps ?).


The following clip [1] is known to exhibit the issue, attaching VDPAU_TRACE=
=3D1
log of VLC playback.


How to enable/force VLC (v2.1.5) + VDPAU:
 - Fire up VLC
 - Navigate to Tools>Preferences>Input/Codecs
 - Set "Hardware-accelerated decoding to VDPAU.
 - Save and play a video.

If VDPAU is seemingly unused by VLC (high CPU usage), check the VLC log:
 - Navigate to Tools>Messages
 - Change the Verbosity level to "2(debug)". Elapsed events/messages with
higher level are not stored, as such you will need to restart playback.

Last minute update:
Interesting... seem like for every h264 clip that I can find, VLC exhibits =
this
problem. I have a sneaky suspicion that VLC is using xcb_xv for presentatio=
n,
which could have something to do with all this.


-Emil


[1] "Fantastic Four: Rise of the Silver Surfer =E2=80=93 720p Trailer" from
http://www.h264info.com/clips.html

http://downloads.dvdloc8.com/trailers/divxdigest/fantastic_four_rise_of_the=
_silver_surfer-trailer.zip

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1407342277.bb1D60.23483
Date: Wed, 6 Aug 2014 16:24:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [VP2] Chroma planes are vertically stretched during V=
DPAU playback"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82255">82255</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[VP2] Chroma planes are vertically stretched during VDPAU pla=
yback
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>emil.l.velikov&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D104158=
" name=3D"attach_104158" title=3D"VDPAU_TRACE=3D1 vlc">attachment 104158</a=
> <a href=3D"attachment.cgi?id=3D104158&amp;action=3Dedit" title=3D"VDPAU_T=
RACE=3D1 vlc">[details]</a></span>
VDPAU_TRACE=3D1 vlc

Using VLC and flashplayer causes h264 video streams to be incorrectly rende=
red.
Both chroma planes are stretched and wrapped over vertically (x2) while the
luma plane seems correct.

Note: the issue does not appear with every h264 encoded clip and never happ=
ens
with mplayer (a bug in mplayer perhaps ?).


The following clip [1] is known to exhibit the issue, attaching VDPAU_TRACE=
=3D1
log of VLC playback.


How to enable/force VLC (v2.1.5) + VDPAU:
 - Fire up VLC
 - Navigate to Tools&gt;Preferences&gt;Input/Codecs
 - Set &quot;Hardware-accelerated decoding to VDPAU.
 - Save and play a video.

If VDPAU is seemingly unused by VLC (high CPU usage), check the VLC log:
 - Navigate to Tools&gt;Messages
 - Change the Verbosity level to &quot;2(debug)&quot;. Elapsed events/messa=
ges with
higher level are not stored, as such you will need to restart playback.

Last minute update:
Interesting... seem like for every h264 clip that I can find, VLC exhibits =
this
problem. I have a sneaky suspicion that VLC is using xcb_xv for presentatio=
n,
which could have something to do with all this.


-Emil


[1] &quot;Fantastic Four: Rise of the Silver Surfer =E2=80=93 720p Trailer&=
quot; from
<a href=3D"http://www.h264info.com/clips.html">http://www.h264info.com/clip=
s.html</a>

<a href=3D"http://downloads.dvdloc8.com/trailers/divxdigest/fantastic_four_=
rise_of_the_silver_surfer-trailer.zip">http://downloads.dvdloc8.com/trailer=
s/divxdigest/fantastic_four_rise_of_the_silver_surfer-trailer.zip</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407342277.bb1D60.23483--

--===============0628883368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0628883368==--
