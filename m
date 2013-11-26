From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70875] [NVC1] NOUVEAU(0): [drm] failed to set drm
 interface version
Date: Tue, 26 Nov 2013 18:44:05 +0000
Message-ID: <bug-70875-8800-GLl12UbmhW@http.bugs.freedesktop.org/>
References: <bug-70875-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0076847654=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70875-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0076847654==
Content-Type: multipart/alternative; boundary="1385491445.53F12002.8051"; charset="us-ascii"


--1385491445.53F12002.8051
Date: Tue, 26 Nov 2013 18:44:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70875

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #9)
> (In reply to comment #8)
> > I don't see anything that suggests that you have a hardware mux. The VGA/DVI
> > connectors appear to be on the nvidia card -- they're inaccessible from
> > intel, right? (A bit hard to tell from your logs...)
> 
> Hmm, I thought I have one (or maybe I don't understand a problem :) ).
> Currently with bumblebee I have NVidia card off and still can use both
> screen (though VGA or HDMI output).

Oh, if you can get to all your outputs from the intel card, but can also get
them from the nvidia card, then you do have a hardware mux. My bad. But I think
you can still use the xrandr offload stuff in that case, as shown on
http://nouveau.freedesktop.org/wiki/Optimus/. In the end, what are you looking
for from your nvidia card? If it's the occasional 3d game/whatever, you can use
DRI_PRIME=1 for that, at which point it should turn on and then turn back off
when you're done due to runtime pm. [Make sure that your kernel is configured
with CONFIG_RUNTIME_PM.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385491445.53F12002.8051
Date: Tue, 26 Nov 2013 18:44:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] NOUVEAU(0): [drm] failed to set drm interface version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70875">bug 70875</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70875#c9">comment #9</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=70875#c8">comment #8</a>)
&gt; &gt; I don't see anything that suggests that you have a hardware mux. The VGA/DVI
&gt; &gt; connectors appear to be on the nvidia card -- they're inaccessible from
&gt; &gt; intel, right? (A bit hard to tell from your logs...)
&gt; 
&gt; Hmm, I thought I have one (or maybe I don't understand a problem :) ).
&gt; Currently with bumblebee I have NVidia card off and still can use both
&gt; screen (though VGA or HDMI output).</span >

Oh, if you can get to all your outputs from the intel card, but can also get
them from the nvidia card, then you do have a hardware mux. My bad. But I think
you can still use the xrandr offload stuff in that case, as shown on
<a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a>. In the end, what are you looking
for from your nvidia card? If it's the occasional 3d game/whatever, you can use
DRI_PRIME=1 for that, at which point it should turn on and then turn back off
when you're done due to runtime pm. [Make sure that your kernel is configured
with CONFIG_RUNTIME_PM.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385491445.53F12002.8051--

--===============0076847654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0076847654==--
