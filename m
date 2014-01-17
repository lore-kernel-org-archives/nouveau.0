From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 17 Jan 2014 18:59:03 +0000
Message-ID: <bug-73358-8800-H1voMYSoWb@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399176105=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0399176105==
Content-Type: multipart/alternative; boundary="1389985143.63Bb6cA2.20304"; charset="us-ascii"


--1389985143.63Bb6cA2.20304
Date: Fri, 17 Jan 2014 18:59:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #30 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #29)
> > > And reran the tests. Same garbled screen as in comment #23. Sorry.
> > 
> > Blast! What about messages in dmesg? Do you still see
> > 
> > subc 7 class 0x0697 mthd 0x0208 data 0x00000120
> 
> Yes, (notice that the fourth line is different)

Very unfortunate. I guess I'll have to look for a different cause :(

> I didn't even knew libvdpau was provided for nv34. Let me know if I can
> help. This machine just got upgraded from 512 to 1536 megs of ram making it
> pretty usable again. Testing is a lot easier as well, let me know when you
> have something new.

VDPAU = Video Decoding AND Presentation. What's being used is the presentation
aspect -- it's essentially like Xv, but fancier. And I believe it's what's
hanging stuff. Quick test -- remove any instance of libvdpau_nouveau.so(.*) --
does everything become better? If not, it must be coming in via OpenGL or
something.

While there is video decoding HW on the NV34, it's only semi-supported; I've
disabled this support since it appears to hang my NV34 and I haven't identified
the cause. I believe it's actually something related to the NPOTness of the
textures, but I don't know for sure. My plan was to create a standalone
VPE1-supporting libXvMC library (well, the libXvMCW interface) that renders
using the hw video overlay (available on pre-NV40 cards), but that requires
some libdrm and possibly kernel changes to support the VPE1 command stream. One
could, conceivably, create a VPE2-using standalone libXvMC library that uses
the hw overlay to render instead of the 3d hardware. However the only cards
that have VPE2 and are pre-NV40 are NV31 and NV34. The rest of the NV3x's (and
NV17/NV18) have VPE1 only.

If you're interested in working on this, come over to #nouveau@freenode, would
be happy to provide some pointers.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389985143.63Bb6cA2.20304
Date: Fri, 17 Jan 2014 18:59:03 +0000
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
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73358#c29">comment #29</a>)
<span class="quote">&gt; &gt; &gt; And reran the tests. Same garbled screen as in <a href="show_bug.cgi?id=73358#c23">comment #23</a>. Sorry.
&gt; &gt; 
&gt; &gt; Blast! What about messages in dmesg? Do you still see
&gt; &gt; 
&gt; &gt; subc 7 class 0x0697 mthd 0x0208 data 0x00000120
&gt; 
&gt; Yes, (notice that the fourth line is different)</span >

Very unfortunate. I guess I'll have to look for a different cause :(

<span class="quote">&gt; I didn't even knew libvdpau was provided for nv34. Let me know if I can
&gt; help. This machine just got upgraded from 512 to 1536 megs of ram making it
&gt; pretty usable again. Testing is a lot easier as well, let me know when you
&gt; have something new.</span >

VDPAU = Video Decoding AND Presentation. What's being used is the presentation
aspect -- it's essentially like Xv, but fancier. And I believe it's what's
hanging stuff. Quick test -- remove any instance of libvdpau_nouveau.so(.*) --
does everything become better? If not, it must be coming in via OpenGL or
something.

While there is video decoding HW on the NV34, it's only semi-supported; I've
disabled this support since it appears to hang my NV34 and I haven't identified
the cause. I believe it's actually something related to the NPOTness of the
textures, but I don't know for sure. My plan was to create a standalone
VPE1-supporting libXvMC library (well, the libXvMCW interface) that renders
using the hw video overlay (available on pre-NV40 cards), but that requires
some libdrm and possibly kernel changes to support the VPE1 command stream. One
could, conceivably, create a VPE2-using standalone libXvMC library that uses
the hw overlay to render instead of the 3d hardware. However the only cards
that have VPE2 and are pre-NV40 are NV31 and NV34. The rest of the NV3x's (and
NV17/NV18) have VPE1 only.

If you're interested in working on this, come over to #nouveau&#64;freenode, would
be happy to provide some pointers.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389985143.63Bb6cA2.20304--

--===============0399176105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0399176105==--
