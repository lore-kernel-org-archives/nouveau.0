From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 17 Jan 2014 17:52:30 +0000
Message-ID: <bug-73358-8800-h1aH4PGHyK@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1956023247=="
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


--===============1956023247==
Content-Type: multipart/alternative; boundary="1389981150.AD68Ac2D1.8194"; charset="us-ascii"


--1389981150.AD68Ac2D1.8194
Date: Fri, 17 Jan 2014 17:52:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #27 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #26)

> I think you meant to say LD_LIBRARY_PATH=./lib

The vdpau_nouveau.so was sitting in mesa/lib/gallium. But it turns out that
even with your suggestion it would not load. What I did was this:

- vdpau_nouveau.so was sitting in ~/mesa/lib/gallium
- cd ~/mesa/lib/gallium
- git clone git://people.freedesktop.org/~aplattner/libvdpau
- ./configure --with-module-dir=~/mesa/lib/gallium
- cd ..
- ln -s -t . libvdpau/src/.libs/libvdpau.so
- ln -s libvdpau.so libvdpau.so.1
- ln -s libvdpau.so libvdpau.so.1.0.0
- cd ~/mesa/lib/gallium

And reran the tests. Same garbled screen as in comment #23. Sorry.

I went to verify I did thinks right so I ran inotifywait on the system vdpau
and my own build of vdpau:

[gebruiker@delta ~]$ inotifywait -m ~/mesa/lib/gallium/libvdpau_nouveau.so
Setting up watches.
Watches established.
mesa/lib/gallium/libvdpau_nouveau.so OPEN 
mesa/lib/gallium/libvdpau_nouveau.so ACCESS 
mesa/lib/gallium/libvdpau_nouveau.so CLOSE_NOWRITE,CLOSE 
mesa/lib/gallium/libvdpau_nouveau.so OPEN 
mesa/lib/gallium/libvdpau_nouveau.so ACCESS 
mesa/lib/gallium/libvdpau_nouveau.so CLOSE_NOWRITE,CLOSE 

( other terminal )

[gebruiker@delta mesa]$ inotifywait -rm /usr/lib/vdpau/
Setting up watches.  Beware: since -r was given, this may take a while!
Watches established.

( empty -> not used -> good! )

So I can fairly confidently say that your patch did not fix the issue.

> Also, since I'm pretty sure that this is all caused by vdpau, in order for
> it to use the libvdpau_nouveau.so that you generated, you need to have a
> libvdpau in that *same* lib directory. Otherwise it'll get loaded from a
> fixed path. (You can run strace -f -e open to confirm.)

Yes, thanks for the tip. I used strace and inotifywait.

> Mind testing out http://patchwork.freedesktop.org/patch/18063/ ? (Note,
> again, make _sure_ that the 'new' version of libvdpau_nouveau.so is being
> loaded, not the old one.)

Yes, you suggested this in comment #19 (or did you accidentaly ment another
patch?)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389981150.AD68Ac2D1.8194
Date: Fri, 17 Jan 2014 17:52:30 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73358#c26">comment #26</a>)

<span class="quote">&gt; I think you meant to say LD_LIBRARY_PATH=./lib</span >

The vdpau_nouveau.so was sitting in mesa/lib/gallium. But it turns out that
even with your suggestion it would not load. What I did was this:

- vdpau_nouveau.so was sitting in ~/mesa/lib/gallium
- cd ~/mesa/lib/gallium
- git clone git://people.freedesktop.org/~aplattner/libvdpau
- ./configure --with-module-dir=~/mesa/lib/gallium
- cd ..
- ln -s -t . libvdpau/src/.libs/libvdpau.so
- ln -s libvdpau.so libvdpau.so.1
- ln -s libvdpau.so libvdpau.so.1.0.0
- cd ~/mesa/lib/gallium

And reran the tests. Same garbled screen as in <a href="show_bug.cgi?id=73358#c23">comment #23</a>. Sorry.

I went to verify I did thinks right so I ran inotifywait on the system vdpau
and my own build of vdpau:

[gebruiker&#64;delta ~]$ inotifywait -m ~/mesa/lib/gallium/libvdpau_nouveau.so
Setting up watches.
Watches established.
mesa/lib/gallium/libvdpau_nouveau.so OPEN 
mesa/lib/gallium/libvdpau_nouveau.so ACCESS 
mesa/lib/gallium/libvdpau_nouveau.so CLOSE_NOWRITE,CLOSE 
mesa/lib/gallium/libvdpau_nouveau.so OPEN 
mesa/lib/gallium/libvdpau_nouveau.so ACCESS 
mesa/lib/gallium/libvdpau_nouveau.so CLOSE_NOWRITE,CLOSE 

( other terminal )

[gebruiker&#64;delta mesa]$ inotifywait -rm /usr/lib/vdpau/
Setting up watches.  Beware: since -r was given, this may take a while!
Watches established.

( empty -&gt; not used -&gt; good! )

So I can fairly confidently say that your patch did not fix the issue.

<span class="quote">&gt; Also, since I'm pretty sure that this is all caused by vdpau, in order for
&gt; it to use the libvdpau_nouveau.so that you generated, you need to have a
&gt; libvdpau in that *same* lib directory. Otherwise it'll get loaded from a
&gt; fixed path. (You can run strace -f -e open to confirm.)</span >

Yes, thanks for the tip. I used strace and inotifywait.

<span class="quote">&gt; Mind testing out <a href="http://patchwork.freedesktop.org/patch/18063/">http://patchwork.freedesktop.org/patch/18063/</a> ? (Note,
&gt; again, make _sure_ that the 'new' version of libvdpau_nouveau.so is being
&gt; loaded, not the old one.)</span >

Yes, you suggested this in <a href="show_bug.cgi?id=73358#c19">comment #19</a> (or did you accidentaly ment another
patch?)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389981150.AD68Ac2D1.8194--

--===============1956023247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1956023247==--
