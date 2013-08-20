From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39010] better handling of large pixmaps
Date: Tue, 20 Aug 2013 02:04:52 +0000
Message-ID: <bug-39010-8800-zMhps5lvY0@http.bugs.freedesktop.org/>
References: <bug-39010-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1719046035=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39010-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1719046035==
Content-Type: multipart/alternative; boundary="1376964291.3E2b4211.32457"; charset="us-ascii"


--1376964291.3E2b4211.32457
Date: Tue, 20 Aug 2013 02:04:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=39010

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What's with the weird non-power-of-2 sizes?

Wouldn't it be better to have a target number of pixmaps to fit in vram, or
perhaps a percentage of vram that you're willing to take up with a single
pixmap? There are lots of cards with all sorts of quantities of memory (e.g.
there are 8800's with 320MB of RAM).

So once you determine a percentage, just have a list of sizes like

sizes = [8192, 4096, 2048]
for size in sizes:
  if size * size * 4 < memory * 0.1:
    return size
return 1024

(This is an example where I assume RGBA pixmaps, up to 10% of vram, but I
picked that at random... maybe other percentages would be more reasonable...
play around with the numbers. It certainly seems that we'd never want to allow
a pixmap that's bigger than VRAM, at the very least, which with current code,
there could be, if there were nv10+ with < 64MB of vram, which I'm pretty sure
I've seen with at least NV1A with 32M of stolen ram.)

[Note: please don't take this as an endorsement of the approach. In fact, I
thought TTM should be able to handle all that, but apparently not. This is just
a comment on improving your patch, irrespective of the overall approach.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376964291.3E2b4211.32457
Date: Tue, 20 Aug 2013 02:04:51 +0000
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
   title="NEW --- - better handling of large pixmaps"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39010#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - better handling of large pixmaps"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=39010">bug 39010</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What's with the weird non-power-of-2 sizes?

Wouldn't it be better to have a target number of pixmaps to fit in vram, or
perhaps a percentage of vram that you're willing to take up with a single
pixmap? There are lots of cards with all sorts of quantities of memory (e.g.
there are 8800's with 320MB of RAM).

So once you determine a percentage, just have a list of sizes like

sizes = [8192, 4096, 2048]
for size in sizes:
  if size * size * 4 &lt; memory * 0.1:
    return size
return 1024

(This is an example where I assume RGBA pixmaps, up to 10% of vram, but I
picked that at random... maybe other percentages would be more reasonable...
play around with the numbers. It certainly seems that we'd never want to allow
a pixmap that's bigger than VRAM, at the very least, which with current code,
there could be, if there were nv10+ with &lt; 64MB of vram, which I'm pretty sure
I've seen with at least NV1A with 32M of stolen ram.)

[Note: please don't take this as an endorsement of the approach. In fact, I
thought TTM should be able to handle all that, but apparently not. This is just
a comment on improving your patch, irrespective of the overall approach.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376964291.3E2b4211.32457--

--===============1719046035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1719046035==--
