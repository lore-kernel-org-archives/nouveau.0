From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88946] [NVC1] black screen after resuming from
	hibernate
Date: Thu, 05 Mar 2015 19:36:09 +0000
Message-ID: <bug-88946-8800-kjsYh3mDGG@http.bugs.freedesktop.org/>
References: <bug-88946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0277696593=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88946-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0277696593==
Content-Type: multipart/alternative; boundary="1425584169.A7657FEF2.4794"; charset="UTF-8"


--1425584169.A7657FEF2.4794
Date: Thu, 5 Mar 2015 19:36:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88946

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to B. A. from comment #12)
> What can I do to help you to debug this problem? 
> 
> NVC3 also seems to have this problem:
> => see bug
> https://bugs.freedesktop.org/show_bug.cgi?id=67255
> 
> Is the NVC0 family (Fermi) in general broken with hibernate and resume, or
> is it dependent on the model of the graphics card?

No clue. It could also be a new issue introduced with a recent kernel change
(like all the fencing changes that have gone in). Or it could be an issue as
old as time itself :)

If this were easy to figure out, someone would have already done it. I haven't
a clue how to debug this... resume issues are notoriously difficult to
investigate.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1425584169.A7657FEF2.4794
Date: Thu, 5 Mar 2015 19:36:09 +0000
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
   title="NEW - [NVC1] black screen after resuming from hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88946#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] black screen after resuming from hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88946">bug 88946</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to B. A. from <a href="show_bug.cgi?id=88946#c12">comment #12</a>)
<span class="quote">&gt; What can I do to help you to debug this problem? 
&gt; 
&gt; NVC3 also seems to have this problem:
&gt; =&gt; see bug
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC3] black screen after resuming from Hibernate"
   href="show_bug.cgi?id=67255">https://bugs.freedesktop.org/show_bug.cgi?id=67255</a>
&gt; 
&gt; Is the NVC0 family (Fermi) in general broken with hibernate and resume, or
&gt; is it dependent on the model of the graphics card?</span >

No clue. It could also be a new issue introduced with a recent kernel change
(like all the fencing changes that have gone in). Or it could be an issue as
old as time itself :)

If this were easy to figure out, someone would have already done it. I haven't
a clue how to debug this... resume issues are notoriously difficult to
investigate.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1425584169.A7657FEF2.4794--

--===============0277696593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0277696593==--
