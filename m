From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Sun, 09 Dec 2012 22:53:49 +0000
Message-ID: <bug-56461-8800-cr5DMSDPoj@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1339791462=="
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


--===============1339791462==
Content-Type: multipart/alternative; boundary="1355093629.aB2a2bF11.4331"; charset="us-ascii"


--1355093629.aB2a2bF11.4331
Date: Sun, 9 Dec 2012 22:53:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #9 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
Hi,

I only just realised that you sent me a second patch (I thought you were
referring to the first patch, so I went and did the bisect as per my previous
message). I've just tried the second patch against nouveau HEAD. Unfortunately
it causes a NULL pointer dereference. I think this is because when this line in
nv04_timer_init...

n = nouveau_hw_get_clock(((struct nouveau_drm *)nouveau_client(priv))->dev,
PLL_CORE);

...calls nouveau_client() it gets NULL, because the parent of nv04_timer_priv
is a nouveau_device, not a nouveau_drm. I can't see any way to get a pointer to
the drm_device from nv04_timer_init, so I don't think calling
nouveau_hw_get_clock from here is possible.

Chris.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355093629.aB2a2bF11.4331
Date: Sun, 9 Dec 2012 22:53:49 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>Hi,

I only just realised that you sent me a second patch (I thought you were
referring to the first patch, so I went and did the bisect as per my previous
message). I've just tried the second patch against nouveau HEAD. Unfortunately
it causes a NULL pointer dereference. I think this is because when this line in
nv04_timer_init...

n = nouveau_hw_get_clock(((struct nouveau_drm *)nouveau_client(priv))-&gt;dev,
PLL_CORE);

...calls nouveau_client() it gets NULL, because the parent of nv04_timer_priv
is a nouveau_device, not a nouveau_drm. I can't see any way to get a pointer to
the drm_device from nv04_timer_init, so I don't think calling
nouveau_hw_get_clock from here is possible.

Chris.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355093629.aB2a2bF11.4331--

--===============1339791462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1339791462==--
