From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Wed, 24 Jul 2013 11:33:58 +0000
Message-ID: <bug-54700-8800-SErQ1bFlac@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1465411455=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1465411455==
Content-Type: multipart/alternative; boundary="1374665638.aB2Cf32.14634"; charset="us-ascii"


--1374665638.aB2Cf32.14634
Date: Wed, 24 Jul 2013 11:33:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #35 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #34)
> > As mentioned it seems like the tiling (pitch) is misset by ~64 (after a quick
> > look at the attached picture)
> 
> I'll look around for a doc to understand what you're saying...
> 
My knowledge is kinf of flacky in the area, so here is the way I understand it.
Gpus do not always treat and/or use memory on a linear way. It may be handled
as a tile with certain dimensions

> > Can you do try and establish if the issue happens in or outside of X, and in
> > which cases
> 
> what do you mean by outside X? Framebuffer terminal seemed ok, how can I
> show a graphic without X?
> 
Yes I meant the framebuffer. Not sure of many ways to draw stuff on it -
directFB is project that normally deals with such things [1]. My main point is
to understand if the issue is xf86-video-nouveau or libdrm/kernel related

> >i.e. in X only when drawing an image of dimensions x1 & y1, or
> > less than x2 & greater than y2
> 
> You mean rescaling a single image or showing images of different pixel size?
> 
> And you really mean drawing (e.g. with office draw) or just showing existing
> images?
> 
I meant rendering images of different sizes. Looking at the iceweasel.png at
bugs.debian.org indicates not everything rendered exhibits the distortion -
would be great to know something specific about the files causing it

Simple tests
* grab the ice weasel picture, open it in a image viewer (and/or browser) -
distorted ?
* rescale the image (using gimp or other software), reopen the picture and
observe.
* same for the cursor file

Cheers
Emil


[1] http://www.directfb.org/docs/DirectFB_Tutorials/image.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374665638.aB2Cf32.14634
Date: Wed, 24 Jul 2013 11:33:58 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=54700#c34">comment #34</a>)
<span class="quote">&gt; &gt; As mentioned it seems like the tiling (pitch) is misset by ~64 (after a quick
&gt; &gt; look at the attached picture)
&gt; 
&gt; I'll look around for a doc to understand what you're saying...
&gt; </span >
My knowledge is kinf of flacky in the area, so here is the way I understand it.
Gpus do not always treat and/or use memory on a linear way. It may be handled
as a tile with certain dimensions

<span class="quote">&gt; &gt; Can you do try and establish if the issue happens in or outside of X, and in
&gt; &gt; which cases
&gt; 
&gt; what do you mean by outside X? Framebuffer terminal seemed ok, how can I
&gt; show a graphic without X?
&gt; </span >
Yes I meant the framebuffer. Not sure of many ways to draw stuff on it -
directFB is project that normally deals with such things [1]. My main point is
to understand if the issue is xf86-video-nouveau or libdrm/kernel related

<span class="quote">&gt; &gt;i.e. in X only when drawing an image of dimensions x1 &amp; y1, or
&gt; &gt; less than x2 &amp; greater than y2
&gt; 
&gt; You mean rescaling a single image or showing images of different pixel size?
&gt; 
&gt; And you really mean drawing (e.g. with office draw) or just showing existing
&gt; images?
&gt; </span >
I meant rendering images of different sizes. Looking at the iceweasel.png at
bugs.debian.org indicates not everything rendered exhibits the distortion -
would be great to know something specific about the files causing it

Simple tests
* grab the ice weasel picture, open it in a image viewer (and/or browser) -
distorted ?
* rescale the image (using gimp or other software), reopen the picture and
observe.
* same for the cursor file

Cheers
Emil


[1] <a href="http://www.directfb.org/docs/DirectFB_Tutorials/image.html">http://www.directfb.org/docs/DirectFB_Tutorials/image.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374665638.aB2Cf32.14634--

--===============1465411455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1465411455==--
