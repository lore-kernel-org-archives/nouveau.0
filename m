From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Wed, 30 Sep 2015 19:18:41 +0000
Message-ID: <bug-89558-8800-x3iDJt0ADY@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1928431868=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1928431868==
Content-Type: multipart/alternative; boundary="1443640721.7f0E7F4.1187"; charset="UTF-8"


--1443640721.7f0E7F4.1187
Date: Wed, 30 Sep 2015 19:18:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #41 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Andrei Borzenkov from comment #40)
> /dev/dri nodes are correctly created for a second card. Unfortunately
> attempt to actually run something on secondary GPU results in
> 
> [   184.755] (II) [drm] nouveau interface version: 1.3.0
> [   184.755] (EE) Unknown chipset: NV118

The nouveau DDX won't do anything useful for maxwell. Use the modesetting
driver. Do note that there are known problems with GLAMOR.

But chances are there are no outputs on the GM108 anyways, so that won't be an
issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443640721.7f0E7F4.1187
Date: Wed, 30 Sep 2015 19:18:41 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c41">Comment # 41</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Andrei Borzenkov from <a href="show_bug.cgi?id=89558#c40">comment #40</a>)
<span class="quote">&gt; /dev/dri nodes are correctly created for a second card. Unfortunately
&gt; attempt to actually run something on secondary GPU results in
&gt; 
&gt; [   184.755] (II) [drm] nouveau interface version: 1.3.0
&gt; [   184.755] (EE) Unknown chipset: NV118</span >

The nouveau DDX won't do anything useful for maxwell. Use the modesetting
driver. Do note that there are known problems with GLAMOR.

But chances are there are no outputs on the GM108 anyways, so that won't be an
issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443640721.7f0E7F4.1187--

--===============1928431868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1928431868==--
