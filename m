From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] [NVA8] Xv shows black image on ION chipset
Date: Mon, 05 May 2014 11:36:40 +0000
Message-ID: <bug-51579-8800-2YLckT1OoY@http.bugs.freedesktop.org/>
References: <bug-51579-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1719387332=="
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


--===============1719387332==
Content-Type: multipart/alternative; boundary="1399289800.28ee3.23144"; charset="us-ascii"


--1399289800.28ee3.23144
Date: Mon, 5 May 2014 11:36:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51579

--- Comment #28 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #27)
> (In reply to comment #26)
> > (In reply to comment #25)
> > > I have exaclty the same problem but on different hardware, its a 9400 GT.
> > > 
> > > 06:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400]
> > > (rev b1)
> > 
> > Actually I'm reasonably sure that this is the same hardware as the original
> > bug reporter. Can you attach dmesg and xorg logs?
> 
> Can I send them to you privately via email?

Please attach them here. Feel free to scrub out the lines that you don't want
to make public. I mainly want to see the kernel cmdline + nouveau/drm log lines
+ most of the Xorg log would be nice.

> 
> > > 
> > > I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
> > > 
> > > mplayer -vo xv = black
> > > mplayer -vo vdpau = black
> > > mplayer -vo gl = ok
> > > mplayer -vo gl2 = ok
> > 
> > Odd. VDPAU is a lot more like GL than like Xv.
> 
> Finally I could get Xv working, but vdpau is still not.
> 
> I had a problem with /dev/dri/* permissions, after fixing that, and changing
> mplayer's configuration as documented in various forums, its still not
> working.  But now I don't get a black screen, mplayer just stops after a few
> frames.

Does OpenGL work? What does glxinfo say? How about vdpauinfo? I'm not aware of
any hangs. (I assume you have the fw installed... if you didn't it wouldn't
hang, just put up lots of errors.) Have you tried multiple videos? mplayer's
output would be good too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399289800.28ee3.23144
Date: Mon, 5 May 2014 11:36:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51579#c27">comment #27</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=51579#c26">comment #26</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=51579#c25">comment #25</a>)
&gt; &gt; &gt; I have exaclty the same problem but on different hardware, its a 9400 GT.
&gt; &gt; &gt; 
&gt; &gt; &gt; 06:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400]
&gt; &gt; &gt; (rev b1)
&gt; &gt; 
&gt; &gt; Actually I'm reasonably sure that this is the same hardware as the original
&gt; &gt; bug reporter. Can you attach dmesg and xorg logs?
&gt; 
&gt; Can I send them to you privately via email?</span >

Please attach them here. Feel free to scrub out the lines that you don't want
to make public. I mainly want to see the kernel cmdline + nouveau/drm log lines
+ most of the Xorg log would be nice.

<span class="quote">&gt; 
&gt; &gt; &gt; 
&gt; &gt; &gt; I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
&gt; &gt; &gt; 
&gt; &gt; &gt; mplayer -vo xv = black
&gt; &gt; &gt; mplayer -vo vdpau = black
&gt; &gt; &gt; mplayer -vo gl = ok
&gt; &gt; &gt; mplayer -vo gl2 = ok
&gt; &gt; 
&gt; &gt; Odd. VDPAU is a lot more like GL than like Xv.
&gt; 
&gt; Finally I could get Xv working, but vdpau is still not.
&gt; 
&gt; I had a problem with /dev/dri/* permissions, after fixing that, and changing
&gt; mplayer's configuration as documented in various forums, its still not
&gt; working.  But now I don't get a black screen, mplayer just stops after a few
&gt; frames.</span >

Does OpenGL work? What does glxinfo say? How about vdpauinfo? I'm not aware of
any hangs. (I assume you have the fw installed... if you didn't it wouldn't
hang, just put up lots of errors.) Have you tried multiple videos? mplayer's
output would be good too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399289800.28ee3.23144--

--===============1719387332==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1719387332==--
