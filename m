From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91986] Artifacts in models rendering with GeForce
 6150 (NV4x chipsets)
Date: Sat, 12 Sep 2015 22:56:46 +0000
Message-ID: <bug-91986-8800-jqCSVvc1FJ@http.bugs.freedesktop.org/>
References: <bug-91986-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0967292682=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91986-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0967292682==
Content-Type: multipart/alternative; boundary="1442098605.737228Fa0.12660"; charset="UTF-8"


--1442098605.737228Fa0.12660
Date: Sat, 12 Sep 2015 22:56:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91986

--- Comment #4 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

tested with NV30_SWTNL=true 

With both mesa 11.1git (oibaf ppa) and 10.6.5 (xorg-edgers ppa) the problems
disappears

As a side note, with NV30_SWTNL=true I see minor side effects on all models,
including the ones that were perfect (Tie Pilot, Tie Fighter), like missing
translucency and normal maps have been disabled.

Just my curiosity, are these side effects to be expected when using 
NV30_SWTNL=true ?

Mauro

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1442098605.737228Fa0.12660
Date: Sat, 12 Sep 2015 22:56:45 +0000
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
   title="NEW - Artifacts in models rendering with GeForce 6150 (NV4x chipsets)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91986#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Artifacts in models rendering with GeForce 6150 (NV4x chipsets)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91986">bug 91986</a>
              from <span class="vcard"><a class="email" href="mailto:issor.oruam&#64;gmail.com" title="Mauro Rossi &lt;issor.oruam&#64;gmail.com&gt;"> <span class="fn">Mauro Rossi</span></a>
</span></b>
        <pre>Hi Ilia,

tested with NV30_SWTNL=true 

With both mesa 11.1git (oibaf ppa) and 10.6.5 (xorg-edgers ppa) the problems
disappears

As a side note, with NV30_SWTNL=true I see minor side effects on all models,
including the ones that were perfect (Tie Pilot, Tie Fighter), like missing
translucency and normal maps have been disabled.

Just my curiosity, are these side effects to be expected when using 
NV30_SWTNL=true ?

Mauro</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442098605.737228Fa0.12660--

--===============0967292682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0967292682==--
