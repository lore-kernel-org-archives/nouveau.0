From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81283] Icons are misrendered when rgb font hinting
 is activated [NV18]
Date: Sun, 13 Jul 2014 13:17:38 +0000
Message-ID: <bug-81283-8800-CDOV2aVvvi@http.bugs.freedesktop.org/>
References: <bug-81283-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1403506785=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81283-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1403506785==
Content-Type: multipart/alternative; boundary="1405257458.daAA1.4683"; charset="us-ascii"


--1405257458.daAA1.4683
Date: Sun, 13 Jul 2014 13:17:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81283

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
There have been a few reports of things not being drawn on NV1x, but no one
ever narrowed it down to anything, and I could never reproduce.

I wonder if some sort of alpha setting isn't actually supported and so things
are being drawn with alpha=0 or something. If you're a developer, can you debug
this a bit? Take a look at src/nv10_exa.c (in the ddx)... the function that
determines if something will be accelerated is NV10EXACheckComposite. Start by
just returning FALSE unconditionally there and make sure the problem is
'fixed'. (If it isn't, the issue is something else.)

Assuming it's fine, try printing the requests that are making it through and
try to identify the ones that aren't being handled properly (by selectively
returning false for some of them).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405257458.daAA1.4683
Date: Sun, 13 Jul 2014 13:17:38 +0000
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
   title="NEW --- - Icons are misrendered when rgb font hinting is activated [NV18]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81283#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Icons are misrendered when rgb font hinting is activated [NV18]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81283">bug 81283</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>There have been a few reports of things not being drawn on NV1x, but no one
ever narrowed it down to anything, and I could never reproduce.

I wonder if some sort of alpha setting isn't actually supported and so things
are being drawn with alpha=0 or something. If you're a developer, can you debug
this a bit? Take a look at src/nv10_exa.c (in the ddx)... the function that
determines if something will be accelerated is NV10EXACheckComposite. Start by
just returning FALSE unconditionally there and make sure the problem is
'fixed'. (If it isn't, the issue is something else.)

Assuming it's fine, try printing the requests that are making it through and
try to identify the ones that aren't being handled properly (by selectively
returning false for some of them).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405257458.daAA1.4683--

--===============1403506785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1403506785==--
