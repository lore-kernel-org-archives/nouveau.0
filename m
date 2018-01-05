From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104509] New: Unable to set "Content Type" bit for
 HDMI and DisplayPort
Date: Fri, 05 Jan 2018 23:07:36 +0000
Message-ID: <bug-104509-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0124447252=="
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


--===============0124447252==
Content-Type: multipart/alternative; boundary="15151936561.2E58a.9356";
 charset="UTF-8"


--15151936561.2E58a.9356
Date: Fri, 5 Jan 2018 23:07:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104509

            Bug ID: 104509
           Summary: Unable to set "Content Type" bit for HDMI and
                    DisplayPort
           Product: xorg
           Version: unspecified
          Hardware: All
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nw9165-3201-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Hi,

apparently the Intel HD Graphics driver for Windows has a "IT Content" opti=
on
that can be either enabled or disabled, see following screenshot for exampl=
e:

https://www.howtogeek.com/wp-content/uploads/2016/12/img_5855c293ac26d.jpg

According to a post on the AVS Forum, enabling "IT Content" does the follow=
ing:

http://www.avsforum.com/forum/26-home-theater-computers/1477460-theory-abou=
t-intel-s-hdmi-quantization-range-setting-full-0-255-a-7.html#post24629922

> HDMI specs "IT Content" flag is set On in video stream.
>=20
> CEA-861:
> "In IT applications (e.g. involving bit mapped text),
> each pixel in the source=E2=80=99s frame buffer is most clearly
> displayed if it is directly mapped to a light-emitting pixel
> on the display device - such that adjacent pixels are
> completely independent and do not interact.
> The IT content bit indicates when picture content is
> composed according to common IT practice (i.e. without
> regard to Nyquist criterion) and is unsuitable for
> analog reconstruction or filtering. When the IT content bit
> is set to 1, downstream processors should pass
> pixel data unfiltered and without analog reconstruction."

Apparently there is no option for it on the nouveau Linux driver.

Can you please add an option to the nouveau Linux driver which allows to en=
able
the "IT Content" bit?

Regards

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15151936561.2E58a.9356
Date: Fri, 5 Jan 2018 23:07:36 +0000
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
   title=3D"NEW - Unable to set &quot;Content Type&quot; bit for HDMI and D=
isplayPort"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104509">104509</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unable to set &quot;Content Type&quot; bit for HDMI and Displ=
ayPort
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
          <td>All
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
          <td>nw9165-3201&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

apparently the Intel HD Graphics driver for Windows has a &quot;IT Content&=
quot; option
that can be either enabled or disabled, see following screenshot for exampl=
e:

<a href=3D"https://www.howtogeek.com/wp-content/uploads/2016/12/img_5855c29=
3ac26d.jpg">https://www.howtogeek.com/wp-content/uploads/2016/12/img_5855c2=
93ac26d.jpg</a>

According to a post on the AVS Forum, enabling &quot;IT Content&quot; does =
the following:

<a href=3D"http://www.avsforum.com/forum/26-home-theater-computers/1477460-=
theory-about-intel-s-hdmi-quantization-range-setting-full-0-255-a-7.html#po=
st24629922">http://www.avsforum.com/forum/26-home-theater-computers/1477460=
-theory-about-intel-s-hdmi-quantization-range-setting-full-0-255-a-7.html#p=
ost24629922</a>

<span class=3D"quote">&gt; HDMI specs &quot;IT Content&quot; flag is set On=
 in video stream.
&gt;=20
&gt; CEA-861:
&gt; &quot;In IT applications (e.g. involving bit mapped text),
&gt; each pixel in the source=E2=80=99s frame buffer is most clearly
&gt; displayed if it is directly mapped to a light-emitting pixel
&gt; on the display device - such that adjacent pixels are
&gt; completely independent and do not interact.
&gt; The IT content bit indicates when picture content is
&gt; composed according to common IT practice (i.e. without
&gt; regard to Nyquist criterion) and is unsuitable for
&gt; analog reconstruction or filtering. When the IT content bit
&gt; is set to 1, downstream processors should pass
&gt; pixel data unfiltered and without analog reconstruction.&quot;</span >

Apparently there is no option for it on the nouveau Linux driver.

Can you please add an option to the nouveau Linux driver which allows to en=
able
the &quot;IT Content&quot; bit?

Regards</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15151936561.2E58a.9356--

--===============0124447252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0124447252==--
