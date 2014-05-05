From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] [NVA8] Xv shows black image on ION chipset
Date: Mon, 05 May 2014 03:46:56 +0000
Message-ID: <bug-51579-8800-WqWXMwnocs@http.bugs.freedesktop.org/>
References: <bug-51579-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0919746035=="
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


--===============0919746035==
Content-Type: multipart/alternative; boundary="1399261616.a8f7EBb43.32158"; charset="us-ascii"


--1399261616.a8f7EBb43.32158
Date: Mon, 5 May 2014 03:46:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51579

--- Comment #27 from lameventanas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to comment #26)
> (In reply to comment #25)
> > I have exaclty the same problem but on different hardware, its a 9400 GT.
> > 
> > 06:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400]
> > (rev b1)
> 
> Actually I'm reasonably sure that this is the same hardware as the original
> bug reporter. Can you attach dmesg and xorg logs?

Can I send them to you privately via email?

> > 
> > I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
> > 
> > mplayer -vo xv = black
> > mplayer -vo vdpau = black
> > mplayer -vo gl = ok
> > mplayer -vo gl2 = ok
> 
> Odd. VDPAU is a lot more like GL than like Xv.

Finally I could get Xv working, but vdpau is still not.

I had a problem with /dev/dri/* permissions, after fixing that, and changing
mplayer's configuration as documented in various forums, its still not working.
 But now I don't get a black screen, mplayer just stops after a few frames.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399261616.a8f7EBb43.32158
Date: Mon, 5 May 2014 03:46:56 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NVA8] Xv shows black image on ION chipset"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51579">bug 51579</a>
              from <span class="vcard"><a class="email" href="mailto:lameventanas&#64;gmail.com" title="lameventanas&#64;gmail.com">lameventanas&#64;gmail.com</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=51579#c26">comment #26</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=51579#c25">comment #25</a>)
&gt; &gt; I have exaclty the same problem but on different hardware, its a 9400 GT.
&gt; &gt; 
&gt; &gt; 06:00.0 VGA compatible controller: NVIDIA Corporation C79 [GeForce 9400]
&gt; &gt; (rev b1)
&gt; 
&gt; Actually I'm reasonably sure that this is the same hardware as the original
&gt; bug reporter. Can you attach dmesg and xorg logs?</span >

Can I send them to you privately via email?

<span class="quote">&gt; &gt; 
&gt; &gt; I am using kernel 3.14.1, mesa3d 10.1.1 and xorg-xf86-video-nouveau 1.0.10.
&gt; &gt; 
&gt; &gt; mplayer -vo xv = black
&gt; &gt; mplayer -vo vdpau = black
&gt; &gt; mplayer -vo gl = ok
&gt; &gt; mplayer -vo gl2 = ok
&gt; 
&gt; Odd. VDPAU is a lot more like GL than like Xv.</span >

Finally I could get Xv working, but vdpau is still not.

I had a problem with /dev/dri/* permissions, after fixing that, and changing
mplayer's configuration as documented in various forums, its still not working.
 But now I don't get a black screen, mplayer just stops after a few frames.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399261616.a8f7EBb43.32158--

--===============0919746035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0919746035==--
