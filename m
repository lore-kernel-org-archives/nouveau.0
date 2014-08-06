From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82255] [VP2] Chroma planes are vertically stretched
 during VDPAU playback
Date: Wed, 06 Aug 2014 16:39:00 +0000
Message-ID: <bug-82255-8800-1wbRfXOjy3@http.bugs.freedesktop.org/>
References: <bug-82255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0385296307=="
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


--===============0385296307==
Content-Type: multipart/alternative; boundary="1407343140.B8cc1.27579"; charset="us-ascii"


--1407343140.B8cc1.27579
Date: Wed, 6 Aug 2014 16:39:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82255

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> A quick look at the log:
> 
>  - VLC always creates/opens multiple vpdau devices (offending flashplayer
> does the same).
>  - VLC does not seem to render/present via VDPAU.
> 
> vdp_decoder_create
> vdp_video_surface_create
> 
> vdp_decoder_render
> vdp_video_surface_get_bits_y_cb_cr
> vdp_decoder_render
> ....
> 
> vdp_video_surface_destroy
> vdp_decoder_destroy

OK, so it's only using vdpau for decoding, not for displaying. Could be that
the get_bits_y_cb_cr thing is messed up (and/or I didn't set enough bits on the
vp2 surfaces to make it not mess up...)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407343140.B8cc1.27579
Date: Wed, 6 Aug 2014 16:39:00 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255">bug 82255</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=82255#c2">comment #2</a>)
<span class="quote">&gt; A quick look at the log:
&gt; 
&gt;  - VLC always creates/opens multiple vpdau devices (offending flashplayer
&gt; does the same).
&gt;  - VLC does not seem to render/present via VDPAU.
&gt; 
&gt; vdp_decoder_create
&gt; vdp_video_surface_create
&gt; 
&gt; vdp_decoder_render
&gt; vdp_video_surface_get_bits_y_cb_cr
&gt; vdp_decoder_render
&gt; ....
&gt; 
&gt; vdp_video_surface_destroy
&gt; vdp_decoder_destroy</span >

OK, so it's only using vdpau for decoding, not for displaying. Could be that
the get_bits_y_cb_cr thing is messed up (and/or I didn't set enough bits on the
vp2 surfaces to make it not mess up...)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407343140.B8cc1.27579--

--===============0385296307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0385296307==--
