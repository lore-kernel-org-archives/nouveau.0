From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69203] [NVC1] Kernel 3.11 - Xorg hangs immediately
 after invocation
Date: Thu, 07 Nov 2013 20:45:19 +0000
Message-ID: <bug-69203-8800-WtKztnW87K@http.bugs.freedesktop.org/>
References: <bug-69203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1938732809=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1938732809==
Content-Type: multipart/alternative; boundary="1383857119.bD2Ead3.25577"; charset="us-ascii"


--1383857119.bD2Ead3.25577
Date: Thu, 7 Nov 2013 20:45:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69203

--- Comment #32 from Marc Collin <marccollin7379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
i cloned kernel 3.12.0

i took this patch:
http://cgit.freedesktop.org/nouveau/linux-2.6/patch/?id=968a8d1b6c32c9f466f236032770b9165ece045a

so the file look like this one without email inside...:
http://pastebin.ca/2474649

patch -p1 < ../nouveau.patch 

patching file drivers/gpu/drm/nouveau/core/engine/device/nv04.c
Hunk #1 FAILED at 57.
Hunk #2 FAILED at 75.
2 out of 2 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv04.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv10.c
Hunk #1 FAILED at 76.
Hunk #2 FAILED at 95.
Hunk #3 FAILED at 114.
Hunk #4 FAILED at 133.
Hunk #5 FAILED at 152.
Hunk #6 FAILED at 171.
Hunk #7 FAILED at 190.
7 out of 7 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv10.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv20.c
Hunk #1 FAILED at 60.
Hunk #2 FAILED at 79.
Hunk #3 FAILED at 98.
Hunk #4 FAILED at 117.
4 out of 4 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv20.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv30.c
Hunk #1 FAILED at 60.
Hunk #2 FAILED at 79.
Hunk #3 FAILED at 98.
Hunk #4 FAILED at 118.
Hunk #5 FAILED at 138.
5 out of 5 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv30.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv40.c
Hunk #1 FAILED at 63.
Hunk #2 FAILED at 84.
Hunk #3 FAILED at 105.
Hunk #4 FAILED at 126.
Hunk #5 FAILED at 147.
Hunk #6 FAILED at 168.
Hunk #7 FAILED at 189.
Hunk #8 FAILED at 210.
Hunk #9 FAILED at 231.
Hunk #10 FAILED at 252.
Hunk #11 FAILED at 273.
Hunk #12 FAILED at 294.
Hunk #13 FAILED at 315.
Hunk #14 FAILED at 336.
Hunk #15 FAILED at 357.
Hunk #16 FAILED at 378.
16 out of 16 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv40.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv50.c
Hunk #1 FAILED at 71.
Hunk #2 FAILED at 94.
Hunk #3 FAILED at 120.
Hunk #4 FAILED at 146.
Hunk #5 FAILED at 172.
Hunk #6 FAILED at 198.
Hunk #7 FAILED at 224.
Hunk #8 FAILED at 250.
Hunk #9 FAILED at 276.
Hunk #10 FAILED at 302.
Hunk #11 FAILED at 328.
Hunk #12 FAILED at 355.
Hunk #13 FAILED at 381.
Hunk #14 FAILED at 407.
14 out of 14 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv50.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nvc0.c
Hunk #1 FAILED at 73.
Hunk #2 FAILED at 102.
Hunk #3 FAILED at 131.
Hunk #4 FAILED at 159.
Hunk #5 FAILED at 188.
Hunk #6 FAILED at 217.
Hunk #7 FAILED at 245.
Hunk #8 FAILED at 274.
Hunk #9 FAILED at 302.
9 out of 9 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nvc0.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nve0.c
Hunk #1 FAILED at 73.
Hunk #2 FAILED at 103.
Hunk #3 FAILED at 133.
Hunk #4 FAILED at 163.
Hunk #5 FAILED at 196.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383857119.bD2Ead3.25577
Date: Thu, 7 Nov 2013 20:45:19 +0000
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
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203#c32">Comment # 32</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] Kernel 3.11 - Xorg hangs immediately after invocation"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69203">bug 69203</a>
              from <span class="vcard"><a class="email" href="mailto:marccollin7379&#64;gmail.com" title="Marc Collin &lt;marccollin7379&#64;gmail.com&gt;"> <span class="fn">Marc Collin</span></a>
</span></b>
        <pre>i cloned kernel 3.12.0

i took this patch:
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/patch/?id=968a8d1b6c32c9f466f236032770b9165ece045a">http://cgit.freedesktop.org/nouveau/linux-2.6/patch/?id=968a8d1b6c32c9f466f236032770b9165ece045a</a>

so the file look like this one without email inside...:
<a href="http://pastebin.ca/2474649">http://pastebin.ca/2474649</a>

patch -p1 &lt; ../nouveau.patch 

patching file drivers/gpu/drm/nouveau/core/engine/device/nv04.c
Hunk #1 FAILED at 57.
Hunk #2 FAILED at 75.
2 out of 2 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv04.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv10.c
Hunk #1 FAILED at 76.
Hunk #2 FAILED at 95.
Hunk #3 FAILED at 114.
Hunk #4 FAILED at 133.
Hunk #5 FAILED at 152.
Hunk #6 FAILED at 171.
Hunk #7 FAILED at 190.
7 out of 7 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv10.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv20.c
Hunk #1 FAILED at 60.
Hunk #2 FAILED at 79.
Hunk #3 FAILED at 98.
Hunk #4 FAILED at 117.
4 out of 4 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv20.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv30.c
Hunk #1 FAILED at 60.
Hunk #2 FAILED at 79.
Hunk #3 FAILED at 98.
Hunk #4 FAILED at 118.
Hunk #5 FAILED at 138.
5 out of 5 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv30.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv40.c
Hunk #1 FAILED at 63.
Hunk #2 FAILED at 84.
Hunk #3 FAILED at 105.
Hunk #4 FAILED at 126.
Hunk #5 FAILED at 147.
Hunk #6 FAILED at 168.
Hunk #7 FAILED at 189.
Hunk #8 FAILED at 210.
Hunk #9 FAILED at 231.
Hunk #10 FAILED at 252.
Hunk #11 FAILED at 273.
Hunk #12 FAILED at 294.
Hunk #13 FAILED at 315.
Hunk #14 FAILED at 336.
Hunk #15 FAILED at 357.
Hunk #16 FAILED at 378.
16 out of 16 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv40.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nv50.c
Hunk #1 FAILED at 71.
Hunk #2 FAILED at 94.
Hunk #3 FAILED at 120.
Hunk #4 FAILED at 146.
Hunk #5 FAILED at 172.
Hunk #6 FAILED at 198.
Hunk #7 FAILED at 224.
Hunk #8 FAILED at 250.
Hunk #9 FAILED at 276.
Hunk #10 FAILED at 302.
Hunk #11 FAILED at 328.
Hunk #12 FAILED at 355.
Hunk #13 FAILED at 381.
Hunk #14 FAILED at 407.
14 out of 14 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nv50.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nvc0.c
Hunk #1 FAILED at 73.
Hunk #2 FAILED at 102.
Hunk #3 FAILED at 131.
Hunk #4 FAILED at 159.
Hunk #5 FAILED at 188.
Hunk #6 FAILED at 217.
Hunk #7 FAILED at 245.
Hunk #8 FAILED at 274.
Hunk #9 FAILED at 302.
9 out of 9 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/core/engine/device/nvc0.c.rej
patching file drivers/gpu/drm/nouveau/core/engine/device/nve0.c
Hunk #1 FAILED at 73.
Hunk #2 FAILED at 103.
Hunk #3 FAILED at 133.
Hunk #4 FAILED at 163.
Hunk #5 FAILED at 196.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383857119.bD2Ead3.25577--

--===============1938732809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1938732809==--
