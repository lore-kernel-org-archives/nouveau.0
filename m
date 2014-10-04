From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Sat, 04 Oct 2014 18:36:12 +0000
Message-ID: <bug-82527-8800-p17p2MaXOn@http.bugs.freedesktop.org/>
References: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0905697512=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82527-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0905697512==
Content-Type: multipart/alternative; boundary="1412447771.A73D121.15155"; charset="UTF-8"


--1412447771.A73D121.15155
Date: Sat, 4 Oct 2014 18:36:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82527

--- Comment #12 from Jamie Heilman <jamie-3MLwneIWSru5Joj7rniG6R4hnT+Y9+D1@public.gmane.org> ---
I can confirm that the regression reported in comment #2 that I bisected to
d55b4af909bc16f7982c2b8b8656f0898158627b is now fixed as of
80ad99da8bd213e12b925407f1c97a303aa8f87f (which pulled in
5838ae610ff36777b8fce6f353c2417980c1a1fa).  Additionally I haven't been able to
reproduce the case that this bug was originally opened for yet, (prior to 3.17
I could but it was always a bit finicky).  Still, it's probably too early to
say that its fixed for sure; I have a slightly different card than Martin's (a
10de:042f, NVIDIA Corporation G86 [Quadro NVS 290] (rev a1)).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412447771.A73D121.15155
Date: Sat, 4 Oct 2014 18:36:11 +0000
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
   title="NEW - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82527">bug 82527</a>
              from <span class="vcard"><a class="email" href="mailto:jamie&#64;audible.transient.net" title="Jamie Heilman &lt;jamie&#64;audible.transient.net&gt;"> <span class="fn">Jamie Heilman</span></a>
</span></b>
        <pre>I can confirm that the regression reported in <a href="show_bug.cgi?id=82527#c2">comment #2</a> that I bisected to
d55b4af909bc16f7982c2b8b8656f0898158627b is now fixed as of
80ad99da8bd213e12b925407f1c97a303aa8f87f (which pulled in
5838ae610ff36777b8fce6f353c2417980c1a1fa).  Additionally I haven't been able to
reproduce the case that this bug was originally opened for yet, (prior to 3.17
I could but it was always a bit finicky).  Still, it's probably too early to
say that its fixed for sure; I have a slightly different card than Martin's (a
10de:042f, NVIDIA Corporation G86 [Quadro NVS 290] (rev a1)).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412447771.A73D121.15155--

--===============0905697512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0905697512==--
