From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 07 Jul 2013 17:51:59 +0000
Message-ID: <bug-54700-8800-R6NksljzdP@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2063467705=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2063467705==
Content-Type: multipart/alternative; boundary="1373219519.CA7b2.9655"; charset="us-ascii"


--1373219519.CA7b2.9655
Date: Sun, 7 Jul 2013 17:51:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #21 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
From the screenshot, it looks like a tiling mode is being misset. I saw
something similar with a thing I was implementing on NV96, I forgot to set
tiling mode 0x20 (which is tiling Y = 2), and saw a very similar effect, but
with lines being horizontal. Not sure if memory worked the same on NV28, but
thought I'd mention it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373219519.CA7b2.9655
Date: Sun, 7 Jul 2013 17:51:59 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>From the screenshot, it looks like a tiling mode is being misset. I saw
something similar with a thing I was implementing on NV96, I forgot to set
tiling mode 0x20 (which is tiling Y = 2), and saw a very similar effect, but
with lines being horizontal. Not sure if memory worked the same on NV28, but
thought I'd mention it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373219519.CA7b2.9655--

--===============2063467705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2063467705==--
