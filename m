From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Sun, 15 May 2016 05:38:46 +0000
Message-ID: <bug-59069-8800-v4QExmPN4p@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1029232447=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1029232447==
Content-Type: multipart/alternative; boundary="14632907261.Aa90FC.4948";
 charset="UTF-8"


--14632907261.Aa90FC.4948
Date: Sun, 15 May 2016 05:38:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D59069

--- Comment #40 from Matt Whitlock <freedesktop-wf/ZkUcLzLDBWRuVRseHprNAH6kLmebB@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #39)
> "fail ttm_validate" usually means "you tried to use too much vram at once=
".
> Unfortunately nouveau's mesa driver isn't particularly good at handling t=
hat
> issue, which causes it to get much worse failures down the line.

A failure in Mesa should, at worst, merely cause the offending process to
crash. It shouldn't be possible for an unprivileged user-mode process to br=
ing
the entire system down. If it is, then there's a serious (denial-of-service)
kernel bug.

> Realistically, I doubt the plasma5 use-case fits well with nv30/nv40
> hardware. You're taking a 2015 compositor and running it on 2005 hardware.

In my case it's a GeForce 8600 GT (G84, Tesla microarchitecture) on a PCI-E
card. I realize this is only slightly better (release date in April 2007), =
but
supposedly Nouveau supports Tesla. Actually, I was digging into the scant
documentation in the Nouveau project, and Tesla seems to be the one
microarchitecture for which Nvidia have provided some documentation, so I
honestly would expect it to be the best supported of all the chipsets.

> You could (correctly) make the argument that nouveau should do a better j=
ob
> at this -- and you'd be right. However volunteers aren't falling over
> themselves, rushing to fix these issues.

Okay, fine. I really don't mind buying a newer card. I just need to know wh=
at's
going to work. Can you tell me what to get? I don't care about gaming. I do=
 use
a composited desktop. I want to play with Wayland on DRM (no X server). I j=
ust
want a card that will give me a stable desktop without needing to run a
proprietary driver. I've been eyeing a GeForce GT 730 (GK208-301-A1, Kepler
microarchitecture) in the hope that switching cards would solve my stability
problems. Would Kepler be more stable on Nouveau than Tesla? I have the gen=
eral
notion that Nouveau has worse support for the newer cards because they're m=
ore
complex and less is known about them. Is this true? What would you recommend
for someone who prioritizes stability above all else? Thanks.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14632907261.Aa90FC.4948
Date: Sun, 15 May 2016 05:38:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069#c40">Commen=
t # 40</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau E[ DRM] fail ttm_validate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D59069">bug 59069<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;mattwhitlock.name" title=3D"Matt Whitlock &lt;freedesktop&#=
64;mattwhitlock.name&gt;"> <span class=3D"fn">Matt Whitlock</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D590=
69#c39">comment #39</a>)
<span class=3D"quote">&gt; &quot;fail ttm_validate&quot; usually means &quo=
t;you tried to use too much vram at once&quot;.
&gt; Unfortunately nouveau's mesa driver isn't particularly good at handlin=
g that
&gt; issue, which causes it to get much worse failures down the line.</span=
 >

A failure in Mesa should, at worst, merely cause the offending process to
crash. It shouldn't be possible for an unprivileged user-mode process to br=
ing
the entire system down. If it is, then there's a serious (denial-of-service)
kernel bug.

<span class=3D"quote">&gt; Realistically, I doubt the plasma5 use-case fits=
 well with nv30/nv40
&gt; hardware. You're taking a 2015 compositor and running it on 2005 hardw=
are.</span >

In my case it's a GeForce 8600 GT (G84, Tesla microarchitecture) on a PCI-E
card. I realize this is only slightly better (release date in April 2007), =
but
supposedly Nouveau supports Tesla. Actually, I was digging into the scant
documentation in the Nouveau project, and Tesla seems to be the one
microarchitecture for which Nvidia have provided some documentation, so I
honestly would expect it to be the best supported of all the chipsets.

<span class=3D"quote">&gt; You could (correctly) make the argument that nou=
veau should do a better job
&gt; at this -- and you'd be right. However volunteers aren't falling over
&gt; themselves, rushing to fix these issues.</span >

Okay, fine. I really don't mind buying a newer card. I just need to know wh=
at's
going to work. Can you tell me what to get? I don't care about gaming. I do=
 use
a composited desktop. I want to play with Wayland on DRM (no X server). I j=
ust
want a card that will give me a stable desktop without needing to run a
proprietary driver. I've been eyeing a GeForce GT 730 (GK208-301-A1, Kepler
microarchitecture) in the hope that switching cards would solve my stability
problems. Would Kepler be more stable on Nouveau than Tesla? I have the gen=
eral
notion that Nouveau has worse support for the newer cards because they're m=
ore
complex and less is known about them. Is this true? What would you recommend
for someone who prioritizes stability above all else? Thanks.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14632907261.Aa90FC.4948--

--===============1029232447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1029232447==--
