From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63790] Nouveau fb boots laptop screen a GIANT BARCODE
Date: Sat, 24 Aug 2013 03:04:47 +0000
Message-ID: <bug-63790-8800-Hw3po5Fbw6@http.bugs.freedesktop.org/>
References: <bug-63790-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0460008076=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63790-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0460008076==
Content-Type: multipart/alternative; boundary="1377313486.DCD121.29871"; charset="us-ascii"


--1377313486.DCD121.29871
Date: Sat, 24 Aug 2013 03:04:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63790

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Things to try:

(a) get rid of the video= stuff. Does it work without that?
(b) get the latest kernel (nouveau/master git tree or 3.11-rc7+ when that's
out)
(c) a really old kernel, like 3.2 or 3.5. (or alternatively, did this work
before at some point with nouveau?)

Could you also provide your vbios? (/sys/kernel/debug/dri/0/vbios.rom)

(BTW -- Transmeta? Awesome!)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377313486.DCD121.29871
Date: Sat, 24 Aug 2013 03:04:46 +0000
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
   title="NEW --- - Nouveau fb boots laptop screen a GIANT BARCODE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63790#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau fb boots laptop screen a GIANT BARCODE"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63790">bug 63790</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Things to try:

(a) get rid of the video= stuff. Does it work without that?
(b) get the latest kernel (nouveau/master git tree or 3.11-rc7+ when that's
out)
(c) a really old kernel, like 3.2 or 3.5. (or alternatively, did this work
before at some point with nouveau?)

Could you also provide your vbios? (/sys/kernel/debug/dri/0/vbios.rom)

(BTW -- Transmeta? Awesome!)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377313486.DCD121.29871--

--===============0460008076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0460008076==--
