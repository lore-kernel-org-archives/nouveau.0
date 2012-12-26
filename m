From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Wed, 26 Dec 2012 16:02:57 +0000
Message-ID: <bug-56461-8800-Vp7MA6bG8G@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0362583927=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0362583927==
Content-Type: multipart/alternative; boundary="1356537777.f0112.2505"; charset="us-ascii"


--1356537777.f0112.2505
Date: Wed, 26 Dec 2012 16:02:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #34 from Ondrej Zary <linux-ZCIryABCsrmttCpgsWEBFmD2FQJk+8+b@public.gmane.org> ---
I have the same problem on DELL Latitude C810 laptop. 3.2 is the latest working
kernel, 3.3-rc1 does not work (LCD fades to white, then backlight turns off and
machine hangs).

d2edab4acffb35a6e24259886d377774efd37e6e is the latest working version
(with dea7e0ac45fd28f90bbc38ff226d36a9f788efbf added to fix AGP crash)

2a44e4997c5fee8e1da1589ff57e0bd1c53f03ce is the first bad commit. It oopses in
nv_load_state_ext (dev->vblank_enabled is NULL). With line 1024 in nouveau_hw.c
commented out, the oops is gone and the fade&hang problem appears.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356537777.f0112.2505
Date: Wed, 26 Dec 2012 16:02:57 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:linux&#64;rainbow-software.org" title="Ondrej Zary &lt;linux&#64;rainbow-software.org&gt;"> <span class="fn">Ondrej Zary</span></a>
</span></b>
        <pre>I have the same problem on DELL Latitude C810 laptop. 3.2 is the latest working
kernel, 3.3-rc1 does not work (LCD fades to white, then backlight turns off and
machine hangs).

d2edab4acffb35a6e24259886d377774efd37e6e is the latest working version
(with dea7e0ac45fd28f90bbc38ff226d36a9f788efbf added to fix AGP crash)

2a44e4997c5fee8e1da1589ff57e0bd1c53f03ce is the first bad commit. It oopses in
nv_load_state_ext (dev-&gt;vblank_enabled is NULL). With line 1024 in nouveau_hw.c
commented out, the oops is gone and the fade&amp;hang problem appears.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356537777.f0112.2505--

--===============0362583927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0362583927==--
