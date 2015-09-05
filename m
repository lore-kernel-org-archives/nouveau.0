From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91890] [nve7] witcher2: blurry image & DATA_ERRORs
 (class 0xa097 mthd 0x2380/0x238c)
Date: Sat, 05 Sep 2015 23:38:45 +0000
Message-ID: <bug-91890-8800-jwiXeYHGx7@http.bugs.freedesktop.org/>
References: <bug-91890-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0681051030=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91890-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0681051030==
Content-Type: multipart/alternative; boundary="1441496324.a555f1.11513"; charset="UTF-8"


--1441496324.a555f1.11513
Date: Sat, 5 Sep 2015 23:38:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91890

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hmmm... that's the CB_SIZE which is 64K max, aka 0x10000. Somehow it's trying
to write to 0x24000 which is well past that. Should probably throw some asserts
in to see where it's happening.

IIRC I fixed some issues with CB writes at some point, can you confirm that
this happens on a semi-recent mesa? Preferably Mesa 11-rcN or git?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1441496324.a555f1.11513
Date: Sat, 5 Sep 2015 23:38:44 +0000
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
   title="NEW - [nve7] witcher2: blurry image &amp; DATA_ERRORs (class 0xa097 mthd 0x2380/0x238c)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91890#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nve7] witcher2: blurry image &amp; DATA_ERRORs (class 0xa097 mthd 0x2380/0x238c)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91890">bug 91890</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hmmm... that's the CB_SIZE which is 64K max, aka 0x10000. Somehow it's trying
to write to 0x24000 which is well past that. Should probably throw some asserts
in to see where it's happening.

IIRC I fixed some issues with CB writes at some point, can you confirm that
this happens on a semi-recent mesa? Preferably Mesa 11-rcN or git?</pre>
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

--1441496324.a555f1.11513--

--===============0681051030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0681051030==--
