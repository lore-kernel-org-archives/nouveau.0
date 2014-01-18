From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Sat, 18 Jan 2014 06:22:42 +0000
Message-ID: <bug-73358-8800-NNe9aMfCpU@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2111219736=="
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


--===============2111219736==
Content-Type: multipart/alternative; boundary="1390026162.Ec0182D1.6320"; charset="us-ascii"


--1390026162.Ec0182D1.6320
Date: Sat, 18 Jan 2014 06:22:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #33 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #32)
> Created attachment 92316 [details] [review]
> vdpau patch
> 
> OK, here's a patch that
> 
> (a) disables vdpau for devices that don't support NPOT textures
> (b) error handling cleanups when creating surfaces
> (c) the thing i did before which checking surface params before making them
> 
> Now, I believe that part (a) should essentially disable VDPAU for you. When
> you build it, run vdpauinfo -- it should say something like "no devices" or
> "error creating device" or something. Hopefully flash can also deal with
> that error.

Yes,

[gebruiker@delta mesa]$ ../vdpauinfo/vdpauinfo
display: :0.0   screen: 0
Error creating VDPAU device: 1

I get no more errors in dmesg and no more hangs. For now, I disabled hardware
acceleration inside the player itself using the lef-click menu. Your patch
works as intended.

I take it there is no other way for me to contribute??

Thank you.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390026162.Ec0182D1.6320
Date: Sat, 18 Jan 2014 06:22:42 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73358#c32">comment #32</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=92316" name="attach_92316" title="vdpau patch">attachment 92316</a> <a href="attachment.cgi?id=92316&amp;action=edit" title="vdpau patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=73358&amp;attachment=92316'>[review]</a> [review]
&gt; vdpau patch
&gt; 
&gt; OK, here's a patch that
&gt; 
&gt; (a) disables vdpau for devices that don't support NPOT textures
&gt; (b) error handling cleanups when creating surfaces
&gt; (c) the thing i did before which checking surface params before making them
&gt; 
&gt; Now, I believe that part (a) should essentially disable VDPAU for you. When
&gt; you build it, run vdpauinfo -- it should say something like &quot;no devices&quot; or
&gt; &quot;error creating device&quot; or something. Hopefully flash can also deal with
&gt; that error.</span >

Yes,

[gebruiker&#64;delta mesa]$ ../vdpauinfo/vdpauinfo
display: :0.0   screen: 0
Error creating VDPAU device: 1

I get no more errors in dmesg and no more hangs. For now, I disabled hardware
acceleration inside the player itself using the lef-click menu. Your patch
works as intended.

I take it there is no other way for me to contribute??

Thank you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390026162.Ec0182D1.6320--

--===============2111219736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2111219736==--
