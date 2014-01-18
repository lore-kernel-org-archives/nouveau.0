From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Sat, 18 Jan 2014 06:31:17 +0000
Message-ID: <bug-73358-8800-xe0lBfULsq@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0349460992=="
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


--===============0349460992==
Content-Type: multipart/alternative; boundary="1390026677.bEfAa02.8507"; charset="us-ascii"


--1390026677.bEfAa02.8507
Date: Sat, 18 Jan 2014 06:31:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #34 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #33)
> (In reply to comment #32)
> > Created attachment 92316 [details] [review] [review]
> > vdpau patch
> > 
> > OK, here's a patch that
> > 
> > (a) disables vdpau for devices that don't support NPOT textures
> > (b) error handling cleanups when creating surfaces
> > (c) the thing i did before which checking surface params before making them
> > 
> > Now, I believe that part (a) should essentially disable VDPAU for you. When
> > you build it, run vdpauinfo -- it should say something like "no devices" or
> > "error creating device" or something. Hopefully flash can also deal with
> > that error.
> 
> Yes,
> 
> [gebruiker@delta mesa]$ ../vdpauinfo/vdpauinfo
> display: :0.0   screen: 0
> Error creating VDPAU device: 1
> 
> I get no more errors in dmesg and no more hangs.

Great! I've posted the patch as a series, hopefully it should be in mesa.git
soonish.

> For now, I disabled
> hardware acceleration inside the player itself using the lef-click menu.

Hmmm... that shouldn't be necessary -- no hw acceleration will be provided
anyways.

> Your patch works as intended.
> 
> I take it there is no other way for me to contribute??

This is not the proper forum to discuss that. Come join us in #nouveau @
irc.freenode.net and we can see if there's overlap between your skillset/time
commitment/etc, and things that would be helpful for nouveau. Or start a
discussion at nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org if you dislike IRC.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390026677.bEfAa02.8507
Date: Sat, 18 Jan 2014 06:31:17 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73358#c33">comment #33</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=73358#c32">comment #32</a>)
&gt; &gt; Created <span class=""><a href="attachment.cgi?id=92316" name="attach_92316" title="vdpau patch">attachment 92316</a> <a href="attachment.cgi?id=92316&amp;action=edit" title="vdpau patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73358&amp;attachment=92316'>[review]</a> [review] [review]
&gt; &gt; vdpau patch
&gt; &gt; 
&gt; &gt; OK, here's a patch that
&gt; &gt; 
&gt; &gt; (a) disables vdpau for devices that don't support NPOT textures
&gt; &gt; (b) error handling cleanups when creating surfaces
&gt; &gt; (c) the thing i did before which checking surface params before making them
&gt; &gt; 
&gt; &gt; Now, I believe that part (a) should essentially disable VDPAU for you. When
&gt; &gt; you build it, run vdpauinfo -- it should say something like &quot;no devices&quot; or
&gt; &gt; &quot;error creating device&quot; or something. Hopefully flash can also deal with
&gt; &gt; that error.
&gt; 
&gt; Yes,
&gt; 
&gt; [gebruiker&#64;delta mesa]$ ../vdpauinfo/vdpauinfo
&gt; display: :0.0   screen: 0
&gt; Error creating VDPAU device: 1
&gt; 
&gt; I get no more errors in dmesg and no more hangs.</span >

Great! I've posted the patch as a series, hopefully it should be in mesa.git
soonish.

<span class="quote">&gt; For now, I disabled
&gt; hardware acceleration inside the player itself using the lef-click menu.</span >

Hmmm... that shouldn't be necessary -- no hw acceleration will be provided
anyways.

<span class="quote">&gt; Your patch works as intended.
&gt; 
&gt; I take it there is no other way for me to contribute??</span >

This is not the proper forum to discuss that. Come join us in #nouveau &#64;
irc.freenode.net and we can see if there's overlap between your skillset/time
commitment/etc, and things that would be helpful for nouveau. Or start a
discussion at <a href="mailto:nouveau&#64;lists.freedesktop.org">nouveau&#64;lists.freedesktop.org</a> if you dislike IRC.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390026677.bEfAa02.8507--

--===============0349460992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0349460992==--
