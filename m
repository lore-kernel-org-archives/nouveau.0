From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 17 Jan 2014 18:10:09 +0000
Message-ID: <bug-73358-8800-QcJ4voEAlT@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1962443066=="
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


--===============1962443066==
Content-Type: multipart/alternative; boundary="1389982208.dbF1Fcd2.10913"; charset="us-ascii"


--1389982208.dbF1Fcd2.10913
Date: Fri, 17 Jan 2014 18:10:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #28 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #27)
> (In reply to comment #26)
> 
> > I think you meant to say LD_LIBRARY_PATH=./lib
> 
> The vdpau_nouveau.so was sitting in mesa/lib/gallium. But it turns out that
> even with your suggestion it would not load. What I did was this:

Right, because libvdpau hardcodes its paths, it doesn't just try to dlopen().
Note that normally the libvdpau_$driver.so are NOT in a dlopen-able place,
which is why it has to do this.

> 
> - vdpau_nouveau.so was sitting in ~/mesa/lib/gallium
> - cd ~/mesa/lib/gallium
> - git clone git://people.freedesktop.org/~aplattner/libvdpau
> - ./configure --with-module-dir=~/mesa/lib/gallium
> - cd ..
> - ln -s -t . libvdpau/src/.libs/libvdpau.so
> - ln -s libvdpau.so libvdpau.so.1
> - ln -s libvdpau.so libvdpau.so.1.0.0
> - cd ~/mesa/lib/gallium
> 
> And reran the tests. Same garbled screen as in comment #23. Sorry.

Blast! What about messages in dmesg? Do you still see

subc 7 class 0x0697 mthd 0x0208 data 0x00000120

Or are those completely gone? Those are the messages I would expect to have
seen fixed by my patch.

Also, since you're on NV34, you don't get NPOT textures either (those came with
NV40). I wonder if the vdpau st deals with those. Hmm... it never asks the
driver whether it has NPOT textures or not, which probably means not-good, and
most likely accounts for your crashes. I need to look into exactly what the
NPOT restriction should be...

> > Mind testing out http://patchwork.freedesktop.org/patch/18063/ ? (Note,
> > again, make _sure_ that the 'new' version of libvdpau_nouveau.so is being
> > loaded, not the old one.)
> 
> Yes, you suggested this in comment #19 (or did you accidentaly ment another
> patch?)

Wow, I must have spaced out there. My bad. It indeed is the same patch, but I
had forgotten I already asked you about it :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389982208.dbF1Fcd2.10913
Date: Fri, 17 Jan 2014 18:10:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73358#c27">comment #27</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=73358#c26">comment #26</a>)
&gt; 
&gt; &gt; I think you meant to say LD_LIBRARY_PATH=./lib
&gt; 
&gt; The vdpau_nouveau.so was sitting in mesa/lib/gallium. But it turns out that
&gt; even with your suggestion it would not load. What I did was this:</span >

Right, because libvdpau hardcodes its paths, it doesn't just try to dlopen().
Note that normally the libvdpau_$driver.so are NOT in a dlopen-able place,
which is why it has to do this.

<span class="quote">&gt; 
&gt; - vdpau_nouveau.so was sitting in ~/mesa/lib/gallium
&gt; - cd ~/mesa/lib/gallium
&gt; - git clone git://people.freedesktop.org/~aplattner/libvdpau
&gt; - ./configure --with-module-dir=~/mesa/lib/gallium
&gt; - cd ..
&gt; - ln -s -t . libvdpau/src/.libs/libvdpau.so
&gt; - ln -s libvdpau.so libvdpau.so.1
&gt; - ln -s libvdpau.so libvdpau.so.1.0.0
&gt; - cd ~/mesa/lib/gallium
&gt; 
&gt; And reran the tests. Same garbled screen as in <a href="show_bug.cgi?id=73358#c23">comment #23</a>. Sorry.</span >

Blast! What about messages in dmesg? Do you still see

subc 7 class 0x0697 mthd 0x0208 data 0x00000120

Or are those completely gone? Those are the messages I would expect to have
seen fixed by my patch.

Also, since you're on NV34, you don't get NPOT textures either (those came with
NV40). I wonder if the vdpau st deals with those. Hmm... it never asks the
driver whether it has NPOT textures or not, which probably means not-good, and
most likely accounts for your crashes. I need to look into exactly what the
NPOT restriction should be...

<span class="quote">&gt; &gt; Mind testing out <a href="http://patchwork.freedesktop.org/patch/18063/">http://patchwork.freedesktop.org/patch/18063/</a> ? (Note,
&gt; &gt; again, make _sure_ that the 'new' version of libvdpau_nouveau.so is being
&gt; &gt; loaded, not the old one.)
&gt; 
&gt; Yes, you suggested this in <a href="show_bug.cgi?id=73358#c19">comment #19</a> (or did you accidentaly ment another
&gt; patch?)</span >

Wow, I must have spaced out there. My bad. It indeed is the same patch, but I
had forgotten I already asked you about it :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389982208.dbF1Fcd2.10913--

--===============1962443066==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1962443066==--
