From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82255] [VP2] Chroma planes are vertically stretched
 during VDPAU playback
Date: Mon, 01 Sep 2014 06:50:28 +0000
Message-ID: <bug-82255-8800-mqsLq3gGIp@http.bugs.freedesktop.org/>
References: <bug-82255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0211614247=="
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


--===============0211614247==
Content-Type: multipart/alternative; boundary="1409554228.Ad3Ec1.10904"; charset="us-ascii"


--1409554228.Ad3Ec1.10904
Date: Mon, 1 Sep 2014 06:50:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82255

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The source data is messed up. Just look at the luma/chroma planes that you
captured.

The overall image is 1280x544. Which means that each field is 1280x272. And
chroma would be 640x136

These look great:
gm display -size 1280x272 gray:sv0-texture0
gm display -size 1280x272 gray:sv0-texture1

These... don't:
gm display -size 640x136 gray:sv1-texture0
gm display -size 640x136 gray:sv1-texture1

Note that texture1 has *some* stuff in it... and trying to display it as

gm display -size 1280x68 gray:sv1-texture1

Shows *some* stuff, but not that much. Of course, vdpau *generally speaking*
works on vp2, so it's highly unlikely that the decoding step is entirely
broken. It must be some bit of sampler view setup, I guess.

I'm also guessing that you somehow messed up capturing the contents of the
chroma since it should have had 2 components, not 1 (which is probably why the
1280 stride works out for the chroma image that has something in it).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409554228.Ad3Ec1.10904
Date: Mon, 1 Sep 2014 06:50:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [VP2] Chroma planes are vertically stretched during VDPAU playback"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82255">bug 82255</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The source data is messed up. Just look at the luma/chroma planes that you
captured.

The overall image is 1280x544. Which means that each field is 1280x272. And
chroma would be 640x136

These look great:
gm display -size 1280x272 gray:sv0-texture0
gm display -size 1280x272 gray:sv0-texture1

These... don't:
gm display -size 640x136 gray:sv1-texture0
gm display -size 640x136 gray:sv1-texture1

Note that texture1 has *some* stuff in it... and trying to display it as

gm display -size 1280x68 gray:sv1-texture1

Shows *some* stuff, but not that much. Of course, vdpau *generally speaking*
works on vp2, so it's highly unlikely that the decoding step is entirely
broken. It must be some bit of sampler view setup, I guess.

I'm also guessing that you somehow messed up capturing the contents of the
chroma since it should have had 2 components, not 1 (which is probably why the
1280 stride works out for the chroma image that has something in it).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409554228.Ad3Ec1.10904--

--===============0211614247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0211614247==--
