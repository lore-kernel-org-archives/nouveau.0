From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82255] [VP2] Chroma planes are vertically stretched
 during VDPAU playback
Date: Mon, 01 Sep 2014 12:57:55 +0000
Message-ID: <bug-82255-8800-b0KQw9dU8X@http.bugs.freedesktop.org/>
References: <bug-82255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1518108787=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1518108787==
Content-Type: multipart/alternative; boundary="1409576274.F2dFd0.23368"; charset="us-ascii"


--1409576274.F2dFd0.23368
Date: Mon, 1 Sep 2014 12:57:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82255

--- Comment #13 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 105558
  --> https://bugs.freedesktop.org/attachment.cgi?id=105558&action=edit
dump vdpau texture data

(In reply to comment #12)
> The source data is messed up. Just look at the luma/chroma planes that you
> captured.
> 
> The overall image is 1280x544. Which means that each field is 1280x272. And
> chroma would be 640x136
> 
> These look great:
> gm display -size 1280x272 gray:sv0-texture0
> gm display -size 1280x272 gray:sv0-texture1
> 
> These... don't:
> gm display -size 640x136 gray:sv1-texture0
> gm display -size 640x136 gray:sv1-texture1
> 
> Note that texture1 has *some* stuff in it... and trying to display it as
> 
> gm display -size 1280x68 gray:sv1-texture1
> 
> Shows *some* stuff, but not that much. Of course, vdpau *generally speaking*
> works on vp2, so it's highly unlikely that the decoding step is entirely
> broken. It must be some bit of sampler view setup, I guess.
> 
Never said that's it's entirely broken. Pardon if it came out like that :) 

> I'm also guessing that you somehow messed up capturing the contents of the
> chroma since it should have had 2 components, not 1 (which is probably why
> the 1280 stride works out for the chroma image that has something in it).
>
Feel free to point out how I should capture them. The patch used can be found
in the attachment :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409576274.F2dFd0.23368
Date: Mon, 1 Sep 2014 12:57:54 +0000
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
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255">bug 82255</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=105558" name="attach_105558" title="dump vdpau texture data">attachment 105558</a> <a href="attachment.cgi?id=105558&amp;action=edit" title="dump vdpau texture data">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=82255&amp;attachment=105558'>[review]</a>
dump vdpau texture data

(In reply to <a href="show_bug.cgi?id=82255#c12">comment #12</a>)
<span class="quote">&gt; The source data is messed up. Just look at the luma/chroma planes that you
&gt; captured.
&gt; 
&gt; The overall image is 1280x544. Which means that each field is 1280x272. And
&gt; chroma would be 640x136
&gt; 
&gt; These look great:
&gt; gm display -size 1280x272 gray:sv0-texture0
&gt; gm display -size 1280x272 gray:sv0-texture1
&gt; 
&gt; These... don't:
&gt; gm display -size 640x136 gray:sv1-texture0
&gt; gm display -size 640x136 gray:sv1-texture1
&gt; 
&gt; Note that texture1 has *some* stuff in it... and trying to display it as
&gt; 
&gt; gm display -size 1280x68 gray:sv1-texture1
&gt; 
&gt; Shows *some* stuff, but not that much. Of course, vdpau *generally speaking*
&gt; works on vp2, so it's highly unlikely that the decoding step is entirely
&gt; broken. It must be some bit of sampler view setup, I guess.
&gt; </span >
Never said that's it's entirely broken. Pardon if it came out like that :) 

<span class="quote">&gt; I'm also guessing that you somehow messed up capturing the contents of the
&gt; chroma since it should have had 2 components, not 1 (which is probably why
&gt; the 1280 stride works out for the chroma image that has something in it).</span >
&gt;
Feel free to point out how I should capture them. The patch used can be found
in the attachment :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409576274.F2dFd0.23368--

--===============1518108787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1518108787==--
