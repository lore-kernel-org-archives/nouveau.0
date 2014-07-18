From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81485] [NVE4] dmesg spam on startup
Date: Fri, 18 Jul 2014 18:04:04 +0000
Message-ID: <bug-81485-8800-VehJj18U2b@http.bugs.freedesktop.org/>
References: <bug-81485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0710109579=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0710109579==
Content-Type: multipart/alternative; boundary="1405706644.2c6b62.3247"; charset="us-ascii"


--1405706644.2c6b62.3247
Date: Fri, 18 Jul 2014 18:04:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81485

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Does this card seriously have 6GB of dedicated GDDR5 VRAM? Or is it
misdetected? (Hm, looks like indeed one of the options on the marketing
page...)

I would not be surprised if we had some bugs for cards with > 4GB.
Unfortunately we don't have a vram_limit parameter.

Could you edit drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c -- take a look
at nvc0_ram_create_, and after the for loop that does ram->size += xyz, just do

ram->size /= 2;

which will bring it down to 3GB... No clue if it'll help, but worth a shot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405706644.2c6b62.3247
Date: Fri, 18 Jul 2014 18:04:04 +0000
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
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485">bug 81485</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Does this card seriously have 6GB of dedicated GDDR5 VRAM? Or is it
misdetected? (Hm, looks like indeed one of the options on the marketing
page...)

I would not be surprised if we had some bugs for cards with &gt; 4GB.
Unfortunately we don't have a vram_limit parameter.

Could you edit drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c -- take a look
at nvc0_ram_create_, and after the for loop that does ram-&gt;size += xyz, just do

ram-&gt;size /= 2;

which will bring it down to 3GB... No clue if it'll help, but worth a shot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405706644.2c6b62.3247--

--===============0710109579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0710109579==--
