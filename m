From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] [NVA8] Xv shows black image on ION chipset
Date: Thu, 08 May 2014 03:31:15 +0000
Message-ID: <bug-51579-8800-8LeYrDwV8l@http.bugs.freedesktop.org/>
References: <bug-51579-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1623503379=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51579-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1623503379==
Content-Type: multipart/alternative; boundary="1399519875.FfB753.7093"; charset="us-ascii"


--1399519875.FfB753.7093
Date: Thu, 8 May 2014 03:31:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51579

--- Comment #29 from lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #28)
> (In reply to comment #27)
> > (In reply to comment #26)
> > > (In reply to comment #25)
> > > > I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
> > > > 
> > > > mplayer -vo xv = black
> > > > mplayer -vo vdpau = black
> > > > mplayer -vo gl = ok
> > > > mplayer -vo gl2 = ok
> > > 
> > > Odd. VDPAU is a lot more like GL than like Xv.
> > 
> > Finally I could get Xv working, but vdpau is still not.
> > 
> > I had a problem with /dev/dri/* permissions, after fixing that, and changing
> > mplayer's configuration as documented in various forums, its still not
> > working.  But now I don't get a black screen, mplayer just stops after a few
> > frames.
> 
> Does OpenGL work? What does glxinfo say? How about vdpauinfo? I'm not aware
> of any hangs. (I assume you have the fw installed... if you didn't it
> wouldn't hang, just put up lots of errors.) Have you tried multiple videos?
> mplayer's output would be good too.


Sorry, I was not very descriptive, I didn't mean that mplayer hangs, it just
stopped after less than a second (no video, just a few audio frames).  So I
guess it was decoding, but not able to output any video.

After spending some time, and thanks to your valuable pointers, it is more or
less working.

I didn't even have the firmware before, I found out when running vdpauinfo.

Right now it works in about 10% of the cases.  For some files it doesn't work
at all.  The ones that work break with some video filters (for example, -vf
pp=de).  It this documented somewhere? I would like a list of what works and
what doesn't.

Unfortunately, mplayer doesn't fall back to a different video-output when vdpau
doesn't work (eg: mplayer -vo vdpau,xv ...).  Some people use a wrapper script
to achieve this, I guess I'll do the same.
But at the same time, I didn't notice a big difference in CPU usage between Xv
and vdpau, so maybe I'll just stick with Xv.

Overall I'm very happy with nouveau now.  In fact, I just built it into my
kernel to get KMS, and ditched nvidia's driver for good, after so many years of
being stuck with it.

Not so happy with mplayer issues though, I guess that is why there are so many
forks.

Thanks a lot for your invaluable help!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399519875.FfB753.7093
Date: Thu, 8 May 2014 03:31:15 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
              from <span class="vcard"><a class="email" href="mailto:lameventanas&#64;gmail.com" title="lameventanas&#64;gmail.com">lameventanas&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51579#c28">comment #28</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=51579#c27">comment #27</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=51579#c26">comment #26</a>)
&gt; &gt; &gt; (In reply to <a href="show_bug.cgi?id=51579#c25">comment #25</a>)
&gt; &gt; &gt; &gt; I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; mplayer -vo xv = black
&gt; &gt; &gt; &gt; mplayer -vo vdpau = black
&gt; &gt; &gt; &gt; mplayer -vo gl = ok
&gt; &gt; &gt; &gt; mplayer -vo gl2 = ok
&gt; &gt; &gt; 
&gt; &gt; &gt; Odd. VDPAU is a lot more like GL than like Xv.
&gt; &gt; 
&gt; &gt; Finally I could get Xv working, but vdpau is still not.
&gt; &gt; 
&gt; &gt; I had a problem with /dev/dri/* permissions, after fixing that, and changing
&gt; &gt; mplayer's configuration as documented in various forums, its still not
&gt; &gt; working.  But now I don't get a black screen, mplayer just stops after a few
&gt; &gt; frames.
&gt; 
&gt; Does OpenGL work? What does glxinfo say? How about vdpauinfo? I'm not aware
&gt; of any hangs. (I assume you have the fw installed... if you didn't it
&gt; wouldn't hang, just put up lots of errors.) Have you tried multiple videos?
&gt; mplayer's output would be good too.</span >


Sorry, I was not very descriptive, I didn't mean that mplayer hangs, it just
stopped after less than a second (no video, just a few audio frames).  So I
guess it was decoding, but not able to output any video.

After spending some time, and thanks to your valuable pointers, it is more or
less working.

I didn't even have the firmware before, I found out when running vdpauinfo.

Right now it works in about 10% of the cases.  For some files it doesn't work
at all.  The ones that work break with some video filters (for example, -vf
pp=de).  It this documented somewhere? I would like a list of what works and
what doesn't.

Unfortunately, mplayer doesn't fall back to a different video-output when vdpau
doesn't work (eg: mplayer -vo vdpau,xv ...).  Some people use a wrapper script
to achieve this, I guess I'll do the same.
But at the same time, I didn't notice a big difference in CPU usage between Xv
and vdpau, so maybe I'll just stick with Xv.

Overall I'm very happy with nouveau now.  In fact, I just built it into my
kernel to get KMS, and ditched nvidia's driver for good, after so many years of
being stuck with it.

Not so happy with mplayer issues though, I guess that is why there are so many
forks.

Thanks a lot for your invaluable help!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399519875.FfB753.7093--

--===============1623503379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1623503379==--
