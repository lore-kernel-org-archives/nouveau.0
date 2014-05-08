From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] [NVA8] Xv shows black image on ION chipset
Date: Thu, 08 May 2014 11:53:25 +0000
Message-ID: <bug-51579-8800-bf5ur82ZAL@http.bugs.freedesktop.org/>
References: <bug-51579-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0911307088=="
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


--===============0911307088==
Content-Type: multipart/alternative; boundary="1399550005.Ca0db3.20935"; charset="us-ascii"


--1399550005.Ca0db3.20935
Date: Thu, 8 May 2014 11:53:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51579

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #30 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #29)
> (In reply to comment #28)
> > (In reply to comment #27)
> > > (In reply to comment #26)
> > > > (In reply to comment #25)
> > > > > I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
> > > > > 
> > > > > mplayer -vo xv = black
> > > > > mplayer -vo vdpau = black
> > > > > mplayer -vo gl = ok
> > > > > mplayer -vo gl2 = ok
> > > > 
> > > > Odd. VDPAU is a lot more like GL than like Xv.
> > > 
> > > Finally I could get Xv working, but vdpau is still not.
> > > 
> > > I had a problem with /dev/dri/* permissions, after fixing that, and changing
> > > mplayer's configuration as documented in various forums, its still not
> > > working.  But now I don't get a black screen, mplayer just stops after a few
> > > frames.
> > 
> > Does OpenGL work? What does glxinfo say? How about vdpauinfo? I'm not aware
> > of any hangs. (I assume you have the fw installed... if you didn't it
> > wouldn't hang, just put up lots of errors.) Have you tried multiple videos?
> > mplayer's output would be good too.
> 
> 
> Sorry, I was not very descriptive, I didn't mean that mplayer hangs, it just
> stopped after less than a second (no video, just a few audio frames).  So I
> guess it was decoding, but not able to output any video.
> 
> After spending some time, and thanks to your valuable pointers, it is more
> or less working.
> 
> I didn't even have the firmware before, I found out when running vdpauinfo.
> 
> Right now it works in about 10% of the cases.  For some files it doesn't
> work at all.  The ones that work break with some video filters (for example,
> -vf pp=de).  It this documented somewhere? I would like a list of what works
> and what doesn't.

vf + vdpau generally don't work. If you're looking for deinterlacing, the
latest mesa (10.2-rc1) should have support for it (via DEINTERLACE_TEMPORAL),
you can turn it on with "mplayer -vo vdpau:deint=3" IIRC. I do recall the black
bars being weird when you do that though, but that is an mplayer-only artifact,
apparently.

Note that VDPAU is Video Decoding + Presentation. So if you're seeing high cpu
usage, it's probably just doing the presentation and not the decoding (for
which you don't need firmware, btw). Make sure you're using the appropriate
codec (e.g. -vc ffh264vdpau). See
http://nouveau.freedesktop.org/wiki/VideoAcceleration/#usingvdpau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399550005.Ca0db3.20935
Date: Thu, 8 May 2014 11:53:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51579#c29">comment #29</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=51579#c28">comment #28</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=51579#c27">comment #27</a>)
&gt; &gt; &gt; (In reply to <a href="show_bug.cgi?id=51579#c26">comment #26</a>)
&gt; &gt; &gt; &gt; (In reply to <a href="show_bug.cgi?id=51579#c25">comment #25</a>)
&gt; &gt; &gt; &gt; &gt; I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
&gt; &gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; &gt; mplayer -vo xv = black
&gt; &gt; &gt; &gt; &gt; mplayer -vo vdpau = black
&gt; &gt; &gt; &gt; &gt; mplayer -vo gl = ok
&gt; &gt; &gt; &gt; &gt; mplayer -vo gl2 = ok
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; Odd. VDPAU is a lot more like GL than like Xv.
&gt; &gt; &gt; 
&gt; &gt; &gt; Finally I could get Xv working, but vdpau is still not.
&gt; &gt; &gt; 
&gt; &gt; &gt; I had a problem with /dev/dri/* permissions, after fixing that, and changing
&gt; &gt; &gt; mplayer's configuration as documented in various forums, its still not
&gt; &gt; &gt; working.  But now I don't get a black screen, mplayer just stops after a few
&gt; &gt; &gt; frames.
&gt; &gt; 
&gt; &gt; Does OpenGL work? What does glxinfo say? How about vdpauinfo? I'm not aware
&gt; &gt; of any hangs. (I assume you have the fw installed... if you didn't it
&gt; &gt; wouldn't hang, just put up lots of errors.) Have you tried multiple videos?
&gt; &gt; mplayer's output would be good too.
&gt; 
&gt; 
&gt; Sorry, I was not very descriptive, I didn't mean that mplayer hangs, it just
&gt; stopped after less than a second (no video, just a few audio frames).  So I
&gt; guess it was decoding, but not able to output any video.
&gt; 
&gt; After spending some time, and thanks to your valuable pointers, it is more
&gt; or less working.
&gt; 
&gt; I didn't even have the firmware before, I found out when running vdpauinfo.
&gt; 
&gt; Right now it works in about 10% of the cases.  For some files it doesn't
&gt; work at all.  The ones that work break with some video filters (for example,
&gt; -vf pp=de).  It this documented somewhere? I would like a list of what works
&gt; and what doesn't.</span >

vf + vdpau generally don't work. If you're looking for deinterlacing, the
latest mesa (10.2-rc1) should have support for it (via DEINTERLACE_TEMPORAL),
you can turn it on with &quot;mplayer -vo vdpau:deint=3&quot; IIRC. I do recall the black
bars being weird when you do that though, but that is an mplayer-only artifact,
apparently.

Note that VDPAU is Video Decoding + Presentation. So if you're seeing high cpu
usage, it's probably just doing the presentation and not the decoding (for
which you don't need firmware, btw). Make sure you're using the appropriate
codec (e.g. -vc ffh264vdpau). See
<a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/#usingvdpau">http://nouveau.freedesktop.org/wiki/VideoAcceleration/#usingvdpau</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399550005.Ca0db3.20935--

--===============0911307088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0911307088==--
