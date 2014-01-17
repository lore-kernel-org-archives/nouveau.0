From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 17 Jan 2014 19:55:32 +0000
Message-ID: <bug-73358-8800-DVvSg2PVkE@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0080917738=="
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


--===============0080917738==
Content-Type: multipart/alternative; boundary="1389988532.C42e2E1.31052"; charset="us-ascii"


--1389988532.C42e2E1.31052
Date: Fri, 17 Jan 2014 19:55:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #31 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Yes, I relocated (In reply to comment #30)
> (In reply to comment #29)
> > > > And reran the tests. Same garbled screen as in comment #23. Sorry.
> > > 
> > > Blast! What about messages in dmesg? Do you still see
> > > 
> > > subc 7 class 0x0697 mthd 0x0208 data 0x00000120
> > 
> > Yes, (notice that the fourth line is different)
> 
> Very unfortunate. I guess I'll have to look for a different cause :(

Thomas Edison 

..."I have not failed 700 times. I have not failed once. I have
succeeded in proving that those 700 ways will not work. When I have
eliminated the ways that will not work, I will find the way that will
work."

> > I didn't even knew libvdpau was provided for nv34. Let me know if I can
> > help. This machine just got upgraded from 512 to 1536 megs of ram making it
> > pretty usable again. Testing is a lot easier as well, let me know when you
> > have something new.
> 
> VDPAU = Video Decoding AND Presentation. What's being used is the
> presentation aspect -- it's essentially like Xv, but fancier. And I believe
> it's what's hanging stuff. Quick test -- remove any instance of
> libvdpau_nouveau.so(.*) -- does everything become better? If not, it must be
> coming in via OpenGL or something.

Yes, moving /usr/lib/vdpau away makes the kernel errors go away. Which is what
I did right now. So it's vdpau (narrows it down I hope?).

Furthermore, when I do that I get this message:

Failed to open VDPAU backend libvdpau_nouveau.so: kan gedeeld objectbestand
niet openen: Bestand of map bestaat niet

(cannot open shared library: File or directory does not exist)

Which makes me wonder why error messages like these get through, despite all
the attempts with fprintf(stderr within Emil's patch xD yielding 0 results.

> While there is video decoding HW on the NV34, it's only semi-supported; I've
> disabled this support since it appears to hang my NV34 and I haven't
> identified the cause. I believe it's actually something related to the
> NPOTness of the textures, but I don't know for sure. My plan was to create a
> standalone VPE1-supporting libXvMC library (well, the libXvMCW interface)
> that renders using the hw video overlay (available on pre-NV40 cards), but
> that requires some libdrm and possibly kernel changes to support the VPE1
> command stream. One could, conceivably, create a VPE2-using standalone
> libXvMC library that uses the hw overlay to render instead of the 3d
> hardware. However the only cards that have VPE2 and are pre-NV40 are NV31
> and NV34. The rest of the NV3x's (and NV17/NV18) have VPE1 only.
> 
> If you're interested in working on this, come over to #nouveau@freenode,
> would be happy to provide some pointers.

I would love to help, but I cannot code. To this point, I have always gotten
away by reading lot's of (badly written) manpages and bash scripting. If you
bend with the system it will be nice to you. Never had the courage to touch a
line of C code. Maybe it's time ...

Is it possible to contribute after an initial phase of self study? What kind of
topics would I need to get familiair with?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389988532.C42e2E1.31052
Date: Fri, 17 Jan 2014 19:55:32 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Yes, I relocated (In reply to <a href="show_bug.cgi?id=73358#c30">comment #30</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=73358#c29">comment #29</a>)
&gt; &gt; &gt; &gt; And reran the tests. Same garbled screen as in <a href="show_bug.cgi?id=73358#c23">comment #23</a>. Sorry.
&gt; &gt; &gt; 
&gt; &gt; &gt; Blast! What about messages in dmesg? Do you still see
&gt; &gt; &gt; 
&gt; &gt; &gt; subc 7 class 0x0697 mthd 0x0208 data 0x00000120
&gt; &gt; 
&gt; &gt; Yes, (notice that the fourth line is different)
&gt; 
&gt; Very unfortunate. I guess I'll have to look for a different cause :(</span >

Thomas Edison 

...&quot;I have not failed 700 times. I have not failed once. I have
succeeded in proving that those 700 ways will not work. When I have
eliminated the ways that will not work, I will find the way that will
work.&quot;

<span class="quote">&gt; &gt; I didn't even knew libvdpau was provided for nv34. Let me know if I can
&gt; &gt; help. This machine just got upgraded from 512 to 1536 megs of ram making it
&gt; &gt; pretty usable again. Testing is a lot easier as well, let me know when you
&gt; &gt; have something new.
&gt; 
&gt; VDPAU = Video Decoding AND Presentation. What's being used is the
&gt; presentation aspect -- it's essentially like Xv, but fancier. And I believe
&gt; it's what's hanging stuff. Quick test -- remove any instance of
&gt; libvdpau_nouveau.so(.*) -- does everything become better? If not, it must be
&gt; coming in via OpenGL or something.</span >

Yes, moving /usr/lib/vdpau away makes the kernel errors go away. Which is what
I did right now. So it's vdpau (narrows it down I hope?).

Furthermore, when I do that I get this message:

Failed to open VDPAU backend libvdpau_nouveau.so: kan gedeeld objectbestand
niet openen: Bestand of map bestaat niet

(cannot open shared library: File or directory does not exist)

Which makes me wonder why error messages like these get through, despite all
the attempts with fprintf(stderr within Emil's patch xD yielding 0 results.

<span class="quote">&gt; While there is video decoding HW on the NV34, it's only semi-supported; I've
&gt; disabled this support since it appears to hang my NV34 and I haven't
&gt; identified the cause. I believe it's actually something related to the
&gt; NPOTness of the textures, but I don't know for sure. My plan was to create a
&gt; standalone VPE1-supporting libXvMC library (well, the libXvMCW interface)
&gt; that renders using the hw video overlay (available on pre-NV40 cards), but
&gt; that requires some libdrm and possibly kernel changes to support the VPE1
&gt; command stream. One could, conceivably, create a VPE2-using standalone
&gt; libXvMC library that uses the hw overlay to render instead of the 3d
&gt; hardware. However the only cards that have VPE2 and are pre-NV40 are NV31
&gt; and NV34. The rest of the NV3x's (and NV17/NV18) have VPE1 only.
&gt; 
&gt; If you're interested in working on this, come over to #nouveau&#64;freenode,
&gt; would be happy to provide some pointers.</span >

I would love to help, but I cannot code. To this point, I have always gotten
away by reading lot's of (badly written) manpages and bash scripting. If you
bend with the system it will be nice to you. Never had the courage to touch a
line of C code. Maybe it's time ...

Is it possible to contribute after an initial phase of self study? What kind of
topics would I need to get familiair with?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389988532.C42e2E1.31052--

--===============0080917738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0080917738==--
